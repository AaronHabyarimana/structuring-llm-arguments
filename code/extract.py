"""
extract.py  —  LLM-basierte Extraktion eines Dung AAF aus Debattentexten
               mit der Uni Mainz KI-Chat API

Pipeline (angelehnt an Alfano et al. 2026, vereinfacht):
    Schritt 0a: UKP-Daten laden  — Stance bereits gold-annotiert, kein LLM nötig
    Schritt 0b: (alternativ) Argumente per LLM generieren/taggen (extract_arguments)
    Schritt 1:  Angriffe erkennen mit iterativem Refinement (extract_attacks)
    Schritt 2:  Prolog-Datei schreiben

Voraussetzungen:
    pip install openai python-dotenv
    API-Key unter https://ki-chat.uni-mainz.de -> Einstellungen -> Neuen Schlüssel erstellen
    export KI_API_KEY=<dein_schlüssel>
"""

import csv
import json
import os
import re
from pathlib import Path
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)

# (Qwen3 235B Thinking verbraucht >17k Reasoning-Tokens pro Anfrage — zu teuer für diese Aufgabe)
MODEL_EXTRACT = "GPT OSS 120B"
MODEL_ATTACKS  = "GPT OSS 120B"

UKP_DIR = Path(__file__).parent.parent / "UKP_sentential_argument_mining" / "data"


# SCHRITT 0a: UKP-Daten laden
# Stance ist bereits gold-annotiert — kein LLM nötig.
# annotation: "Argument_for" -> pro, "Argument_against" -> con, "NoArgument" -> überspringen

def load_ukp(topic: str, split: str = "test", limit: int = None) -> list[dict]:
    """
    Lädt annotierte Argumente aus dem UKP-Datensatz.
    topic: Dateiname ohne .tsv, z.B. "nuclear_energy"
    split: "train", "test" oder "val"
    limit: max. Anzahl Argumente (None = alle)
    """
    path = UKP_DIR / f"{topic}.tsv"
    args = []
    pro_i = con_i = 1
    with open(path, encoding="utf-8") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            if row["set"] != split or row["annotation"] == "NoArgument":
                continue
            stance = "pro" if row["annotation"] == "Argument_for" else "con"
            id_ = f"{stance}{pro_i if stance == 'pro' else con_i}"
            if stance == "pro":
                pro_i += 1
            else:
                con_i += 1
            args.append({"id": id_, "text": row["sentence"], "stance": stance})
            if limit and len(args) >= limit:
                break
    return args


# SCHRITT 0b: Argumente per LLM aus freien Sätzen extrahieren (falls kein UKP)
# Nützlich für LLM-generierte Argumente oder andere Datensätze ohne Gold-Labels.

ARG_PROMPT = """
Du bekommst Sätze aus einer Debatte zum Thema "{topic}".
Identifiziere alle Sätze, die ein klares Argument darstellen.
Kein Fakt ohne Wertung, keine Fragen, keine reinen Beschreibungen.

Antworte NUR mit einem JSON-Array, kein Markdown:
[
  {{"id": "pro1", "text": "...", "stance": "pro"}},
  {{"id": "con1", "text": "...", "stance": "con"}}
]

Regeln:
- stance ist "pro" (für das Thema) oder "con" (dagegen)
- IDs haben Form pro1, pro2, ... / con1, con2, ...
- Nur echte Argumente aufnehmen

Sätze:
{sentences}"""


def extract_arguments(sentences: list[str], topic: str) -> list[dict]:
    numbered = "\n".join(f"{i+1}. {s}" for i, s in enumerate(sentences))
    response = client.chat.completions.create(
        model=MODEL_EXTRACT,
        messages=[{"role": "user", "content": ARG_PROMPT.format(topic=topic, sentences=numbered)}],
        max_tokens=2048,
    )
    raw = response.choices[0].message.content.strip()
    raw = re.sub(r"```(?:json)?\s*|\s*```", "", raw).strip()
    return json.loads(raw)


# SCHRITT 1: Angriffe identifizieren
# Dung (1995): att(A,B) — A greift B an.
# Taxonomie nach Pollock (1992) / ASPIC+ (Modgil & Prakken, 2014):
#   rebuttal:    A bestreitet Konklusion von B
#   undercutting: A untergräbt Prämisse-Konklusion-Verbindung von B
#   undermining: A greift eine Prämisse von B direkt an

ATT_PROMPT = """
Du bekommst Argumente aus einer Debatte zum Thema Kernenergie.
Identifiziere Angriffs-Relationen: A attackiert B, wenn A dem Inhalt von B
direkt widerspricht oder eine zentrale Behauptung von B entkräftet.

Kein Angriff liegt vor wenn:
- A und B unterschiedliche Aspekte behandeln (z.B. Kosten vs. Sicherheit)
- A ein allgemeines Statement ist, das B nicht direkt betrifft

Antworte NUR mit einem JSON-Array, kein Markdown:
[
  {{"attacker": "con1", "target": "pro2"}},
  {{"attacker": "pro1", "target": "con1"}}
]

Regeln:
- Gegenseitige Angriffe möglich
- Kein Selbstangriff
- Jedes Argument sollte wenn möglich mindestens einen Angreifer haben

Argumente:
{arguments}"""


def _parse_attacks(raw: str) -> list[dict]:
    raw = re.sub(r"```(?:json)?\s*|\s*```", "", raw).strip()
    return json.loads(raw)


def extract_attacks(arguments: list[dict]) -> list[tuple[str, str]]:
    arg_text = "\n".join(
        f"[{a['id']}] ({a['stance']}) {a['text']}" for a in arguments
    )
    response = client.chat.completions.create(
        model=MODEL_ATTACKS,
        messages=[{"role": "user", "content": ATT_PROMPT.format(arguments=arg_text)}],
        max_tokens=4096,
    )
    pairs = _parse_attacks(response.choices[0].message.content)

    # Deduplizieren, Selbstangriffe entfernen
    seen = set()
    result = []
    for p in pairs:
        key = (p["attacker"], p["target"])
        if key not in seen and p["attacker"] != p["target"]:
            seen.add(key)
            result.append(key)
    return result


# SCHRITT 2: Prolog-Datei generieren

def to_prolog(arguments: list[dict], attacks: list[tuple], topic: str) -> str:
    def safe(s: str) -> str:
        cleaned = re.sub(r"\W+", "_", s).strip("_")
        return cleaned if cleaned else "arg_unknown"

    lines = [
        f"% Automatisch generiert — Thema: {topic}",
        "% arg/1 Fakten",
    ]
    for a in arguments:
        lines.append(f"arg({safe(a['id'])}).  % [{a['stance']}] {a['text'][:80]}")

    lines.append("\n% att/2 Fakten  (Angriff-Relationen nach Dung 1995)")
    for att, tgt in attacks:
        lines.append(f"att({safe(att)}, {safe(tgt)}).")

    return "\n".join(lines)


# HAUPTPROGRAMM

if __name__ == "__main__":
    topic_file  = "nuclear_energy"
    topic_label = "Nuclear energy"

    # --- alte Beispielargumente (manuell, zu klein für sinnvolle Extensions) ---
    # sample_sentences = [
    #     "Nuclear power plants produce electricity without emitting greenhouse gases.",
    #     "Nuclear energy provides a stable baseload that renewables cannot match.",
    #     "Nuclear waste remains dangerously radioactive for thousands of years.",
    #     "The risk of catastrophic accidents like Chernobyl or Fukushima is unacceptable.",
    #     "Modern reactor designs have made meltdowns virtually impossible.",
    #     "Storing nuclear waste safely for millennia is an unsolved problem.",
    #     "Wind and solar are now cheaper than new nuclear plants.",
    #     "Nuclear plants take 10-20 years to build, too slow for the climate crisis.",
    # ]
    # args = extract_arguments(sample_sentences, topic_label)

    print(f"=== Schritt 0: UKP-Daten laden (topic={topic_file}, split=test, limit=20) ===")
    args = load_ukp(topic_file, split="test", limit=20)
    for a in args:
        print(f"  [{a['id']}] {a['stance']:3}  {a['text'][:70]}")

    print(f"\n=== Schritt 1: Angriffe identifizieren mit Refinement (Modell: {MODEL_ATTACKS}) ===")
    attacks = extract_attacks(args)
    for att, tgt in attacks:
        print(f"  att({att}, {tgt})")

    print("\n=== Schritt 2: Prolog-Output ===")
    prolog_code = to_prolog(args, attacks, topic_label)
    print(prolog_code)

    out_path = Path(__file__).parent / "generated_af.pl"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(":- use_module(library(lists)).\n\n")
        f.write(prolog_code)
        f.write("\n\n% Lade Semantiken aus prolog.pl:\n")
        f.write("% :- [prolog].\n")
        f.write("% ?- show_all.\n")
    print(f"\n-> {out_path} geschrieben")
