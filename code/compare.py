"""
compare.py  —  Freie LLM-Bewertung vs. formale Dung-Semantik

Forschungsfrage:
    Stimmt die intuitive Bewertung eines LLMs mit den formal
    verteidigbaren Argumenten (Preferred/Grounded Extension) überein?

Pipeline:
    1. AF laden (args + attacks aus .pl-Datei)
    2. Dung-Semantik via Prolog  → formale Extensions
    3. LLM bewertet dieselben Argumente frei
    4. Vergleich: Überschneidung, Abweichungen, Interpretation

Aufruf:
    python compare.py
"""

import json
import os
import re
import subprocess
from pathlib import Path

from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

CODE_DIR = Path(__file__).parent
SWIPL    = r"C:\Program Files\swipl\bin\swipl.exe"
TIMEOUT  = 120

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)
MODEL = "GPT OSS 120B"

AF_FILES = ["generated_af_ukp", "generated_af_llm"]


# ── AF laden ────────────────────────────────────────────────────

def load_af(af_file: str) -> tuple[list[dict], list[tuple[str, str]]]:
    """Liest arg/1 und att/2 Fakten aus einer .pl-Datei."""
    text = (CODE_DIR / f"{af_file}.pl").read_text(encoding="utf-8")
    args = [
        {"id": m.group(1), "stance": m.group(2), "text": m.group(3).strip()}
        for m in re.finditer(r"arg\((\w+)\)\.\s*%\s*\[(\w+)\]\s*(.+)", text)
    ]
    atts = [
        (m.group(1), m.group(2))
        for m in re.finditer(r"att\((\w+),\s*(\w+)\)\.", text)
    ]
    return args, atts


# ── Prolog ──────────────────────────────────────────────────────

def run_prolog(af_file: str, goal: str) -> str:
    init = f"set_prolog_flag(af_source,{af_file}),consult('prolog.pl'),{goal},halt."
    r = subprocess.run(
        [SWIPL, "-g", init, "-t", "halt"],
        capture_output=True, text=True,
        cwd=CODE_DIR, timeout=TIMEOUT,
    )
    return r.stdout


def parse_sets(output: str, header: str) -> list[list[str]]:
    sets, collecting = [], False
    for line in output.splitlines():
        if header in line:
            collecting = True
            continue
        if collecting:
            if line.startswith("==="):
                break
            m = re.match(r"\[([^\]]*)\]", line.strip())
            if m:
                content = m.group(1).strip()
                sets.append([x.strip() for x in content.split(",")] if content else [])
    return sets


# ── Freie LLM-Bewertung ─────────────────────────────────────────

FREE_EVAL_PROMPT = """You are a debate analyst evaluating arguments on "{topic}".

Arguments:
{arg_list}

Which of these arguments do you find most convincing and defensible?

Respond ONLY with a JSON array of argument IDs, no explanation:
["id1", "id2", ...]"""


def llm_free_eval(args: list[dict], topic: str) -> list[str]:
    arg_list = "\n".join(f"  [{a['id']}] ({a['stance']}) {a['text']}" for a in args)

    message = client.chat.completions.create(
        model=MODEL,
        messages=[{"role": "user", "content": FREE_EVAL_PROMPT.format(
            topic=topic, arg_list=arg_list,
        )}],
        temperature=0,
        max_tokens=1024,
    ).choices[0].message

    # Manche APIs (inkl. Uni Mainz) liefern Inhalt in content oder reasoning_content
    content = message.content or getattr(message, "reasoning_content", None) or ""
    if not content:
        print(f"  [DEBUG] Leere Antwort. Volles message-Objekt: {message}")
        return []

    cleaned = re.sub(r"<think(?:ing)?>.*?</think(?:ing)?>", "", content, flags=re.DOTALL)
    cleaned = re.sub(r"<think(?:ing)?>.*$", "", cleaned, flags=re.DOTALL)
    cleaned = re.sub(r"```(?:json)?\s*|\s*```", "", cleaned).strip()
    try:
        return json.loads(cleaned)
    except json.JSONDecodeError:
        s, e = cleaned.find("["), cleaned.rfind("]")
        if s != -1 and e > s:
            try:
                return json.loads(cleaned[s:e + 1])
            except json.JSONDecodeError:
                pass
    print(f"  [ERROR] LLM-Antwort nicht parsebar:\n{content[:300]}")
    return []


# ── Vergleich ────────────────────────────────────────────────────

def jaccard(a: set, b: set) -> float:
    return len(a & b) / len(a | b) if a | b else 1.0


def compare(formal: set[str], llm: set[str]) -> None:
    overlap     = formal & llm
    only_formal = formal - llm
    only_llm    = llm - formal

    precision = len(overlap) / len(llm)    if llm    else 0.0
    recall    = len(overlap) / len(formal) if formal  else 0.0
    j         = jaccard(formal, llm)

    print(f"  Überschneidung          : {sorted(overlap) or '∅'}")
    print(f"  Nur formal (Dung)       : {sorted(only_formal) or '∅'}")
    print(f"  Nur LLM (frei)          : {sorted(only_llm) or '∅'}")
    print(f"  Jaccard                 : {j:.2f}")
    print(f"  Precision (LLM→Formal)  : {precision:.2f}")
    print(f"  Recall    (Formal→LLM)  : {recall:.2f}")


# ── Hauptprogramm ────────────────────────────────────────────────

if __name__ == "__main__":
    sep = "=" * 60

    for af_file in AF_FILES:
        source_label = af_file.replace("generated_af_", "").upper()
        print(f"\n{sep}")
        print(f"  QUELLE: {source_label}  ({af_file}.pl)")
        print(sep)

        args, atts = load_af(af_file)
        all_ids = {a["id"] for a in args}
        print(f"  |Args|={len(args)}   |Att|={len(atts)}")

        # Grounded Extension (formal, deterministisch)
        try:
            grounded_sets = parse_sets(run_prolog(af_file, "show_grounded"),
                                       "Grounded Extension")
            grounded = set(grounded_sets[0]) if grounded_sets else set()
        except subprocess.TimeoutExpired:
            grounded = set()
            print("  [TIMEOUT] Grounded")

        # Preferred Extensions (formal)
        try:
            preferred_sets = parse_sets(run_prolog(af_file, "show_preferred"),
                                        "Preferred Extensions")
            # Vereinigung aller Preferred Extensions als "formal akzeptiert"
            preferred_union = {a for ext in preferred_sets for a in ext}
        except subprocess.TimeoutExpired:
            preferred_sets, preferred_union = [], set()
            print("  [TIMEOUT] Preferred")

        # Freie LLM-Bewertung (nur Argumente, keine Angriffe)
        print("\n  LLM wird befragt ...")
        llm_set = set(llm_free_eval(args, "Nuclear Energy"))

        # Ausgabe
        print(f"\n── Grounded Extension (formal) ──")
        print(f"  {sorted(grounded) or '∅'}")

        print(f"\n── Preferred Extensions (formal, {len(preferred_sets)} Ext.) ──")
        for ext in preferred_sets:
            print(f"  {ext}")

        print(f"\n── Freie LLM-Bewertung (ohne Kenntnis der Angriffe) ──")
        print(f"  {sorted(llm_set) or '∅'}")

        print(f"\n── Vergleich: LLM vs. Grounded Extension ──")
        compare(grounded, llm_set)

        print(f"\n── Vergleich: LLM vs. Preferred Extensions (je einzeln) ──")
        for i, ext in enumerate(preferred_sets, 1):
            j = jaccard(set(ext), llm_set)
            overlap = set(ext) & llm_set
            print(f"  Ext. {i}  Jaccard={j:.2f}  Overlap={sorted(overlap) or '∅'}")

    print(f"\n{sep}")
