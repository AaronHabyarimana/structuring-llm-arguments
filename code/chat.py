"""
chat.py  —  Interaktiver Argumentations-Chat

Ablauf:
    1. Topic wählen (UKP-Datensatz oder freies Thema)
    2. Argumente laden (UKP) oder generieren (LLM)
    3. Argumente atomisieren
    4. Angriffe identifizieren
    5. Formale Dung-Semantik berechnen
    6. LLM erklärt das Ergebnis
    7. Folgefragen im Chat-Loop

Beenden: 'exit', 'quit' oder Ctrl+C
"""

import json
import os
import sys

if sys.stdout.encoding and sys.stdout.encoding.lower() != "utf-8":
    sys.stdout.reconfigure(encoding="utf-8")

from dotenv import load_dotenv
from openai import OpenAI

from extract import load_ukp, extract_arguments, atomize_arguments, extract_attacks
from af_tool import TOOL_DEFINITION, handle_tool_call, solve_af

load_dotenv()

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)
MODEL = "GPT OSS 120B"

UKP_TOPICS = [
    ("nuclear_energy",          "Nuclear Energy"),
    ("abortion",                "Abortion"),
    ("cloning",                 "Cloning"),
    ("death_penalty",           "Death Penalty"),
    ("gun_control",             "Gun Control"),
    ("marijuana_legalization",  "Marijuana Legalization"),
    ("minimum_wage",            "Minimum Wage"),
    ("school_uniforms",         "School Uniforms"),
]

SYSTEM_PROMPT = """\
You are a debate analyst. You have access to a Dung Abstract Argumentation Framework (AAF) solver.

Your primary role is to discuss the CONTENT of the debate — what the arguments actually say,
why certain positions are stronger or weaker, and what the formal result reveals about the debate's substance.
Avoid explaining framework mechanics unless the user explicitly asks about them.

When re-evaluating or hypothetically modifying the framework,
call solve_argumentation_framework with the updated arguments and attacks.
For questions about the existing result, use the formal analysis already in context."""


def _llm_turn(messages: list) -> str:
    """Führt eine LLM-Runde durch inkl. Tool-Call-Handling. Gibt finalen Text zurück."""
    msg = None
    for _ in range(5):
        response = client.chat.completions.create(
            model=MODEL,
            messages=messages,
            tools=[TOOL_DEFINITION],
            tool_choice="auto",
            temperature=0,
            max_tokens=4096,
        )
        msg    = response.choices[0].message
        finish = response.choices[0].finish_reason

        if finish == "tool_calls" and msg.tool_calls:
            messages.append(msg)
            for tc in msg.tool_calls:
                raw_args   = json.loads(tc.function.arguments)
                result_str = handle_tool_call(raw_args)
                messages.append({
                    "role":         "tool",
                    "tool_call_id": tc.id,
                    "content":      result_str,
                })
        elif finish == "stop":
            return msg.content or ""
        else:
            break

    return (msg.content if msg else "") or ""


def _pick_topic() -> tuple[str, str, str]:
    """
    Lässt den User ein Thema wählen.
    Rückgabe: (topic_file, topic_label, source)
      source = "ukp" → annotierte Argumente aus UKP laden
      source = "llm" → Argumente per LLM generieren
    """
    print("\nThema-Quelle:")
    print("  [1] UKP-Datensatz  (annotierte Argumente aus Forschungsdaten)")
    print("  [2] Freies Thema   (Argumente per LLM generieren)")
    choice = input("\nWahl [1/2]: ").strip()

    if choice == "1":
        print("\nVerfügbare UKP-Themen:")
        for i, (_, label) in enumerate(UKP_TOPICS, 1):
            print(f"  [{i:2}] {label}")
        idx = input("\nNummer wählen: ").strip()
        try:
            file_name, label = UKP_TOPICS[int(idx) - 1]
        except (ValueError, IndexError):
            print("  Ungültige Eingabe — verwende Nuclear Energy.")
            file_name, label = UKP_TOPICS[0]
        return file_name, label, "ukp"

    topic = input("\nThema eingeben (z.B. 'Autonomous Vehicles'): ").strip()
    if not topic:
        topic = "Artificial Intelligence"
    return topic, topic, "llm"


def run_pipeline(
    topic_file: str, topic_label: str, source: str
) -> tuple[list[dict], list[dict], dict]:
    """
    Vollständige Pipeline: Argumente → Atomisieren → Angriffe → Formale Extensions.
    Rückgabe: (arguments, attacks, formal_result)
    """
    print("\n── Argumente laden ─────────────────────────────")
    if source == "ukp":
        print(f"  Lade UKP-Daten ({topic_file}, split=test, limit=10) ...")
        args = load_ukp(topic_file, split="test", limit=50)

        print("\n── Argumente atomisieren ───────────────────────────")
        args = atomize_arguments(args, topic_label)
        print(f"  {len(args)} atomare Argumente")
    else:
        print(f"  Generiere Argumente per LLM (10 pro + 10 con) ...")
        args = extract_arguments(topic_label, n_pro=10, n_con=10)
    print(f"  {len(args)} Argumente geladen")

    print("\n── Angriffe erkennen ─────────────────────")
    attacks = extract_attacks(args, topic=topic_label)
    print(f"  {len(attacks)} Angriffs-Relationen erkannt")

    print("\n── Formale Semantik (Prolog) ─────────────")
    result = solve_af(args, attacks, topic=topic_label)
    if "error" in result:
        print(f"  [FEHLER] {result['error']}")
    else:
        print(f"  Grounded  : {result.get('grounded', [])}")
        print(f"  Preferred : {result.get('preferred')}")
        print(f"  Stable    : {result.get('stable')}")

    return args, attacks, result


def run_chat(
    arguments: list[dict], attacks: list[dict], topic: str, formal_result: dict
) -> None:
    """Startet den interaktiven Chat-Loop auf Basis des formalen Ergebnisses."""
    arg_lines = "\n".join(
        f"  [{a['id']}] ({a['stance']}) {a['text']}" for a in arguments
    )
    att_lines = "\n".join(
        f"  att({atk['attacker']}, {atk['target']})  [{atk['type']}] conf={atk['confidence']}"
        for atk in attacks
    ) or "  (keine)"

    initial_prompt = (
        f"Topic: {topic}\n\n"
        f"Arguments:\n{arg_lines}\n\n"
        f"Attack relations:\n{att_lines}\n\n"
        f"Formal analysis result:\n"
        f"{json.dumps(formal_result, indent=2, ensure_ascii=False)}\n\n"
        "Give a short structured analysis (max 200 words):\n"
        "1. Formal result: list the accepted arguments (grounded/preferred extensions) "
        "with a one-sentence description of what each argument says.\n"
        "2. Key attacks: briefly explain 2-3 of the most important attack relations "
        "in plain language — what claim challenges what.\n"
        "3. One-sentence conclusion: which side comes out stronger and why."
    )

    messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user",   "content": initial_prompt},
    ]

    print("\n── Formale Analyse ──────────────────────────────────")
    print("  (LLM analysiert ...)\n")
    answer = _llm_turn(messages)
    messages.append({"role": "assistant", "content": answer})
    print(f"Assistent:\n{answer}\n")

    print("─" * 55)
    print("Chat gestartet — Folgefragen möglich.")
    print("Beenden: 'exit' oder Ctrl+C")
    print("─" * 55)

    while True:
        try:
            user_input = input("\nDu: ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\nChat beendet.")
            break

        if not user_input:
            continue
        if user_input.lower() in ("exit", "quit", "q", "beenden"):
            print("Chat beendet.")
            break

        messages.append({"role": "user", "content": user_input})
        answer = _llm_turn(messages)
        messages.append({"role": "assistant", "content": answer})
        print(f"\nAssistent:\n{answer}")


def main() -> None:
    print("=" * 55)
    print("  Argumentations-Chat  (Dung AAF + LLM)")

    topic_file, topic_label, source = _pick_topic()
    args, attacks, formal = run_pipeline(topic_file, topic_label, source)
    run_chat(args, attacks, topic_label, formal)


if __name__ == "__main__":
    main()
