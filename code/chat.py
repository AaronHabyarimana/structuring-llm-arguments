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
import time
from datetime import datetime
from pathlib import Path

if sys.stdout.encoding and sys.stdout.encoding.lower() != "utf-8":
    sys.stdout.reconfigure(encoding="utf-8")

from dotenv import load_dotenv
from openai import OpenAI

import extract
from extract import (
    load_ukp, extract_arguments, atomize_arguments, extract_attacks, to_prolog,
)
from af_tool import TOOL_DEFINITION, handle_tool_call, solve_af
from run_logger import (
    RunLogger, RUNS_DIR, generate_run_id, slugify,
    compute_graph_stats, build_report,
)

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


def _build_config(topic_file: str, topic_label: str, source: str, run_id: str) -> dict:
    """Baut run_config.json aus den tatsächlichen Konstanten des Codes."""
    ukp = source == "ukp"
    return {
        "run_id": run_id,
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "topic_file": topic_file,
        "topic_label": topic_label,
        "source": source,
        "split": extract.UKP_SPLIT if ukp else None,
        "limit": extract.UKP_LIMIT if ukp else 20,
        "balanced": extract.UKP_BALANCED if ukp else None,
        "seed": extract.UKP_SEED if ukp else None,
        "atomize": extract.ATOMIZE if ukp else False,
        "batch_size": extract.BATCH_SIZE,
        "max_workers": extract.MAX_WORKERS,
        "confidence_accept": extract.CONFIDENCE_ACCEPT,
        "confidence_verify": extract.CONFIDENCE_VERIFY,
        "model_extract": extract.MODEL_EXTRACT,
        "model_attacks": extract.MODEL_ATTACKS,
        "prompt_versions": extract.PROMPT_VERSIONS,
    }


def _log_arguments(logger: RunLogger, args: list[dict], config: dict) -> None:
    """Schreibt arguments.jsonl nach finaler Argumentvorbereitung."""
    for a in args:
        logger.log_argument({
            "id": a["id"],
            "base_id": extract._base_id(a["id"]),
            "source": config["source"],
            "topic": config["topic_file"],
            "split": config["split"],
            "stance": a["stance"],
            "text": a["text"],
            "original_text": a.get("original_text", a["text"]),
            "atomized_from": a.get("atomized_from", a["id"]),
        })


def run_pipeline(
    topic_file: str, topic_label: str, source: str, enable_logging: bool = True,
) -> tuple[list[dict], list[dict], dict]:
    """
    Vollständige Pipeline: Argumente → Atomisieren → Angriffe → Formale Extensions.
    Rückgabe: (arguments, attacks, formal_result) — abwärtskompatibel.

    enable_logging=True (Default): legt output/runs/<run_id>/ an und schreibt alle
    Artefakte (run_config, arguments, calls, pair_decisions, attacks, .pl, results,
    graph_stats, runtime, report). enable_logging=False → altes Verhalten.
    """
    logger = None
    if enable_logging:
        seed = extract.UKP_SEED if source == "ukp" else None
        run_id = generate_run_id(topic_file, source, seed)
        run_dir = RUNS_DIR / run_id
        logger = RunLogger(run_id, run_dir)
        config = _build_config(topic_file, topic_label, source, run_id)
        logger.write_json("run_config.json", config)
        extract.set_run_logger(logger)
        print(f"  [LOG] Run-Ordner: {run_dir}")

    runtime: dict[str, float] = {}
    t_start = time.time()
    try:
        print("\n── Argumente laden ─────────────────────────────")
        t0 = time.time()
        if source == "ukp":
            print(f"  Lade UKP-Daten ({topic_file}, split={extract.UKP_SPLIT}, "
                  f"limit={extract.UKP_LIMIT}) ...")
            args = load_ukp(topic_file, split=extract.UKP_SPLIT,
                            limit=extract.UKP_LIMIT, balanced=extract.UKP_BALANCED,
                            seed=extract.UKP_SEED)
            n_before = len(args)
            runtime["load_arguments"] = round(time.time() - t0, 3)

            print("\n── Argumente atomisieren ───────────────────────────")
            t0 = time.time()
            args = atomize_arguments(args, topic_label)
            runtime["atomize"] = round(time.time() - t0, 3)
            print(f"  {len(args)} atomare Argumente")
        else:
            print(f"  Generiere Argumente per LLM (10 pro + 10 con) ...")
            args = extract_arguments(topic_label, n_pro=10, n_con=10)
            n_before = len(args)
            runtime["load_arguments"] = round(time.time() - t0, 3)
        print(f"  {len(args)} Argumente geladen")

        if logger is not None:
            config["n_args_before_atomize"] = n_before
            logger.write_json("run_config.json", config)  # n_before nachtragen
            _log_arguments(logger, args, config)

        print("\n── Angriffe erkennen ─────────────────────")
        t0 = time.time()
        attacks = extract_attacks(args, topic=topic_label)
        runtime["attack_extraction"] = round(time.time() - t0, 3)
        print(f"  {len(attacks)} Angriffs-Relationen erkannt")

        # Prolog-Datei: in Run-Ordner UND (abwärtskompatibel) nach output/.
        prolog_code = to_prolog(args, attacks, topic_label)
        legacy = Path(__file__).parent / "output" / f"generated_af_{source}.pl"
        legacy.parent.mkdir(exist_ok=True)
        legacy.write_text(prolog_code, encoding="utf-8")
        if logger is not None:
            pl_name = f"af_{slugify(topic_file)}_{logger.run_id}.pl"
            logger.write_text(pl_name, prolog_code)

        print("\n── Formale Semantik (Prolog) ─────────────")
        t0 = time.time()
        result = solve_af(args, attacks, topic=topic_label)
        runtime["prolog_solver"] = round(time.time() - t0, 3)
        if "error" in result:
            print(f"  [FEHLER] {result['error']}")
        else:
            print(f"  Grounded  : {result.get('grounded', [])}")
            print(f"  Preferred : {result.get('preferred')}")
            print(f"  Stable    : {result.get('stable')}")

        runtime["total"] = round(time.time() - t_start, 3)

        if logger is not None:
            _finalize_run(logger, config, args, attacks, result, runtime)

        return args, attacks, result
    finally:
        if logger is not None:
            extract.set_run_logger(None)


def _finalize_run(logger, config, args, attacks, result, runtime) -> None:
    """Schreibt graph_stats.json, results.json, runtime.json und den Markdown-Report."""
    graph_stats = compute_graph_stats(args, attacks)
    logger.write_json("graph_stats.json", {"run_id": logger.run_id, **graph_stats})
    logger.write_json("runtime.json", {"run_id": logger.run_id, **runtime})

    results_doc = {
        "run_id": logger.run_id,
        "topic": config["topic_label"],
        "n_args": result.get("n_args", len(args)),
        "n_attacks": result.get("n_attacks", len(attacks)),
        "u_size": result.get("u_size"),   # |U| = unentschiedener Kern (Runtime-Treiber)
        "semantics": result.get("semantics"),
        "grounded": result.get("grounded"),
        "preferred": result.get("preferred"),
        "stable": result.get("stable"),
        "error": result.get("error"),
        "warning": result.get("warning"),
        "runtime_s": runtime,
        "graph_stats": graph_stats,
    }
    logger.write_json("results.json", results_doc)

    report = build_report(config, logger, results_doc, graph_stats)
    logger.write_text(f"report_{slugify(config['topic_file'])}.md", report)
    print(f"  [LOG] Report + Artefakte geschrieben: {logger.dir}")


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
        "Give a short structured analysis:\n"
        "1. Formal result: list the accepted arguments (grounded/preferred extensions) "
        "with a one-sentence description of what each argument says.\n"
        "2. All attacks: briefly explain the attack relations "
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
