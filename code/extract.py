"""
extract.py  —  LLM-basierte Extraktion eines Dung AAF aus Debattentexten
               mit der Uni Mainz KI-Chat API

Pipeline (angelehnt an Alfano et al. 2026, vereinfacht):
    Schritt 1: Argumente taggen  -> arg/1 Fakten
    Schritt 2: Angriffe erkennen -> att/2 Fakten
    Schritt 3: Prolog-Datei schreiben

Voraussetzungen:
    pip install openai
    API-Key unter https://ki-chat.uni-mainz.de -> Einstellungen -> Neuen Schlüssel erstellen
    export KI_API_KEY=<dein_schlüssel>
"""

import json
import os
import re
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()  # lädt .env aus dem aktuellen Verzeichnis

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)

# GPT OSS 120B für Extraktion und Angriffserkennung
# (Qwen3 235B Thinking verbraucht >17k Reasoning-Tokens pro Anfrage — zu teuer für diese Aufgabe)
MODEL_EXTRACT = "GPT OSS 120B"
MODEL_ATTACKS  = "GPT OSS 120B"


# =============================================================
#  SCHRITT 1: Argumente extrahieren
#  Input:  Liste von Sätzen aus UKP-Datensatz
#  Output: Liste von Dicts {id, text, stance}
# =============================================================

ARG_PROMPT = """\
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
        messages=[{
            "role": "user",
            "content": ARG_PROMPT.format(topic=topic, sentences=numbered)
        }],
        max_tokens=2048,
    )
    raw = response.choices[0].message.content.strip()
    # Markdown-Codeblöcke entfernen falls vorhanden
    raw = re.sub(r"```(?:json)?\s*|\s*```", "", raw).strip()
    return json.loads(raw)


# =============================================================
#  SCHRITT 2: Angriffe identifizieren
#  Input:  Argumentliste aus Schritt 1
#  Output: Liste von Tupeln (attacker_id, target_id)
#
#  Wooldridge et al. (Δ1-Ebene): Angriff ist eine Relation
#  zwischen Argumenten — nicht zwischen Fakten der Welt.
# =============================================================

ATT_PROMPT = """\
Du bekommst Argumente aus einer Debatte.
Identifiziere alle Angriffs-Relationen: A attackiert B,
wenn A die Prämisse oder Konklusion von B direkt widerlegt.

Antworte NUR mit einem JSON-Array, kein Markdown:
[
  {{"attacker": "con1", "target": "pro2"}},
  {{"attacker": "pro1", "target": "con1"}}
]

Regeln:
- Nur direkte Angriffe (keine rein thematischen Ähnlichkeiten)
- Gegenseitige Angriffe möglich
- Kein Selbstangriff

Argumente:
{arguments}"""


def extract_attacks(arguments: list[dict]) -> list[tuple[str, str]]:
    arg_text = "\n".join(
        f"[{a['id']}] ({a['stance']}) {a['text']}" for a in arguments
    )
    response = client.chat.completions.create(
        model=MODEL_ATTACKS,
        messages=[{
            "role": "user",
            "content": ATT_PROMPT.format(arguments=arg_text)
        }],
        max_tokens=4096,
    )
    raw = response.choices[0].message.content.strip()
    raw = re.sub(r"```(?:json)?\s*|\s*```", "", raw).strip()
    pairs = json.loads(raw)
    return [(p["attacker"], p["target"]) for p in pairs]


# =============================================================
#  SCHRITT 3: Prolog-Datei generieren
#  Format kompatibel mit prolog.pl (Cerutti et al.)
# =============================================================

def to_prolog(arguments: list[dict], attacks: list[tuple], topic: str) -> str:
    def safe(id_str: str) -> str:
        return re.sub(r"\W+", "_", id_str)

    lines = [
        f"% Automatisch generiert — Thema: {topic}",
        "% arg/1 Fakten",
    ]
    for a in arguments:
        lines.append(f"arg({safe(a['id'])}).  % [{a['stance']}] {a['text'][:80]}")

    lines.append("\n% att/2 Fakten  (Angriff-Relationen, Delta1-Ebene nach Wooldridge et al.)")
    for att, tgt in attacks:
        lines.append(f"att({safe(att)}, {safe(tgt)}).")

    return "\n".join(lines)


# =============================================================
#  HAUPTPROGRAMM  —  Beispiel mit Nuclear-Sätzen aus UKP
# =============================================================

if __name__ == "__main__":
    topic = "Nuclear energy"

    # In der echten Pipeline kommen diese aus dem UKP-CSV (ukp_sentential_argument_mining)
    sample_sentences = [
        "Nuclear power plants produce electricity without emitting greenhouse gases.",
        "Nuclear energy provides a stable baseload that renewables cannot match.",
        "Nuclear waste remains dangerously radioactive for thousands of years.",
        "The risk of catastrophic accidents like Chernobyl or Fukushima is unacceptable.",
        "Modern reactor designs have made meltdowns virtually impossible.",
        "Storing nuclear waste safely for millennia is an unsolved problem.",
        "Wind and solar are now cheaper than new nuclear plants.",
        "Nuclear plants take 10-20 years to build, too slow for the climate crisis.",
    ]

    print(f"=== Schritt 1: Argumente extrahieren (Modell: {MODEL_EXTRACT}) ===")
    args = extract_arguments(sample_sentences, topic)
    for a in args:
        print(f"  [{a['id']}] {a['stance']:3}  {a['text'][:70]}")

    print(f"\n=== Schritt 2: Angriffe identifizieren (Modell: {MODEL_ATTACKS}) ===")
    attacks = extract_attacks(args)
    for att, tgt in attacks:
        print(f"  att({att}, {tgt})")

    print("\n=== Schritt 3: Prolog-Output ===")
    prolog_code = to_prolog(args, attacks, topic)
    print(prolog_code)

    out_path = "generated_af.pl"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(":- use_module(library(lists)).\n\n")
        f.write(prolog_code)
        f.write("\n\n% Lade Semantiken aus prolog.pl:\n")
        f.write("% :- [prolog].\n")
        f.write("% ?- show_all.\n")
    print(f"\n-> {out_path} geschrieben")
