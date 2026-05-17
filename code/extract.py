"""
extract.py  —  LLM-basierte Extraktion eines Dung AAF aus Debattentexten
               mit der Uni Mainz KI-Chat API

Pipeline (angelehnt an Alfano et al. 2026, vereinfacht):
    Schritt 0a: UKP-Daten laden (Argumente mit stance pro/con, keine NoArgument)
    Schritt 0b: (alternativ) Argumente per LLM generieren/taggen (extract_arguments)
    Schritt 1:  Angriffe erkennen (extract_attacks)
    Schritt 2:  Prolog-Datei schreiben

Voraussetzungen:
    pip install openai python-dotenv
    API-Key unter https://ki-chat.uni-mainz.de -> Einstellungen -> Neuen Schlüssel erstellen
    export KI_API_KEY=<dein_schlüssel>
"""

import csv
import json
import os
import random
import re
from pathlib import Path
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)

# (Qwen3 235B Thinking verbraucht >17k Reasoning-Tokens pro Anfrage)
MODEL_EXTRACT = "GPT OSS 120B"
MODEL_ATTACKS  = "GPT OSS 120B"

CONFIDENCE_ACCEPT = 0.7   # ab hier: direkt akzeptieren, kein Verify nötig
CONFIDENCE_VERIFY = 0.5   # ab hier: Verify-Schritt, bei Zustimmung akzeptieren
                          # darunter: verwerfen

SOURCE = "llm"  # "ukp" → load_ukp  |  "llm" → extract_arguments

UKP_DIR = Path(__file__).parent.parent / "UKP_sentential_argument_mining" / "data"


# SCHRITT 0a: UKP-Daten laden
# annotation: "Argument_for" -> pro, "Argument_against" -> con, "NoArgument" -> überspringen

def load_ukp(topic: str, split: str, limit: int,
             balanced: bool = True, seed: int = 10) -> list[dict]:
    """
    Lädt annotierte Argumente aus dem UKP-Datensatz.
    topic:    Dateiname ohne .tsv, z.B. "nuclear_energy"
    split:    "train", "test" oder "val"
    limit:    Gesamtzahl geladener Argumente
    balanced: True → gleich viele pro/con (je limit//2), reproduzierbar mit seed
    seed:     Zufalls-Seed für reproduzierbare Experimente
    """
    path = UKP_DIR / f"{topic}.tsv"
    pros, cons = [], []
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
            (pros if stance == "pro" else cons).append(
                {"id": id_, "text": row["sentence"], "stance": stance}
            )

    rng = random.Random(seed)
    if balanced and limit:
        half = limit // 2
        sample_pro = rng.sample(pros, min(half, len(pros)))
        sample_con = rng.sample(cons, min(half, len(cons)))
        return sample_pro + sample_con
    all_args = pros + cons
    return rng.sample(all_args, min(limit, len(all_args)))

# SCHRITT 0b: Argumente per LLM generieren (Zero-Shot)

LLM_GENERATE_PROMPT = """Generate {n_pro} pro and {n_con} con arguments about "{topic}".
Each argument must express exactly one claim and take a clear stance.
Do not bundle multiple claims into one sentence.

Respond ONLY with a JSON array, no markdown:
[
  {{"id": "pro1", "text": "...", "stance": "pro"}},
  {{"id": "con1", "text": "...", "stance": "con"}}
]"""


def extract_arguments(topic: str, n_pro: int = 5, n_con: int = 5) -> list[dict]:
    """
    Generiert Argumente zu einem Thema per LLM (Zero-Shot).
    topic: Thema der Debatte, z.B. "Nuclear Energy"
    n_pro/n_con: Anzahl gewünschter Pro-/Contra-Argumente
    """
    response = client.chat.completions.create(
        model=MODEL_EXTRACT,
        messages=[{"role": "user", "content": LLM_GENERATE_PROMPT.format(
            topic=topic, n_pro=n_pro, n_con=n_con
        )}],
        temperature=0.7,
        max_tokens=2048,
    )
    content = response.choices[0].message.content
    if not content:
        return []
    cleaned = re.sub(r"<think(?:ing)?>.*?</think(?:ing)?>", "", content, flags=re.DOTALL)
    cleaned = re.sub(r"<think(?:ing)?>.*$", "", cleaned, flags=re.DOTALL)
    cleaned = re.sub(r"```(?:json)?\s*|\s*```", "", cleaned).strip()
    try:
        return json.loads(cleaned)
    except json.JSONDecodeError:
        start, end = cleaned.find("["), cleaned.rfind("]")
        if start != -1 and end > start:
            try:
                return json.loads(cleaned[start:end + 1])
            except json.JSONDecodeError:
                pass
    print(f"  [ERROR] JSON-Parsing fehlgeschlagen: {content[:120]}")
    return []


# SCHRITT 0c: Argumente atomisieren
# Compound-Argumente (mehrere Behauptungen in einem Satz) werden in
# atomare Argumente aufgespalten, damit Angriffs-Relationen präziser erkannt werden.

ATOMIZE_PROMPT = """You receive an argument from a debate on "{topic}".
Check whether it bundles multiple distinct claims into one sentence.
If yes, split it into atomic arguments (one claim each), preserving the stance.
If it already expresses a single claim, return it unchanged.

Important: Concessive fragments ("Although X", "While X", "Despite X") are rhetorical
hedges, NOT independent arguments. Drop them entirely — only keep the main claim.

Self-containment rule: Every output argument MUST be understandable without
any surrounding context. If a fragment contains pronouns like "it", "them",
"this", "they" without a clear referent, replace the pronoun with the explicit
noun from the original sentence. If the referent cannot be recovered, drop
the fragment entirely.

Argumentative content rule: Only keep claims that take a position or make
an evaluative assertion. Pure factual statements without evaluative content
(e.g. "X once spoke about Y") are not arguments — drop them.

Argument [{id}] ({stance}):
{text}

Respond ONLY with a JSON array, no markdown. Use IDs like "{id}", "{id}b", "{id}c", ...:
[
  {{"id": "{id}",  "text": "...", "stance": "{stance}"}},
  {{"id": "{id}b", "text": "...", "stance": "{stance}"}}
]"""


def atomize_arguments(arguments: list[dict], topic: str) -> list[dict]:
    result = []
    for a in arguments:
        response = client.chat.completions.create(
            model=MODEL_ATTACKS,
            messages=[{"role": "user", "content": ATOMIZE_PROMPT.format(
                topic=topic, id=a["id"], stance=a["stance"], text=a["text"]
            )}],
            temperature=0,
            max_tokens=1024,
        )
        content = response.choices[0].message.content
        if not content:
            result.append(a)
            continue
        raw = re.sub(r"```(?:json)?\s*|\s*```", "", content.strip()).strip()
        try:
            atoms = json.loads(raw)
            result.extend(atoms)
            if len(atoms) > 1:
                print(f"  [{a['id']}] → {len(atoms)} atomare Argumente")
        except json.JSONDecodeError:
            result.append(a)
    return _fix_atom_ids(result)


def _base_id(id_: str) -> str:
    """Extrahiert die Basis-ID: 'pro2b' → 'pro2', 'con1d' → 'con1'."""
    return re.sub(r'(?<=\d)[a-z]+$', '', id_)


def _fix_atom_ids(arguments: list[dict]) -> list[dict]:
    """Benennt Argumente um, bei denen ID-Prefix (pro/con) und Stance nicht übereinstimmen."""
    existing = {a["id"] for a in arguments}
    result = []
    for a in arguments:
        id_, stance = a["id"], a["stance"]
        prefix = "pro" if id_.startswith("pro") else "con" if id_.startswith("con") else None
        if prefix and prefix != stance:
            suffix = id_[len(prefix):]
            new_id = stance + suffix
            while new_id in existing:
                new_id += "x"
            existing.discard(id_)
            existing.add(new_id)
            print(f"  [ID-RENAME] {id_} [{stance}] → {new_id}")
            a = {**a, "id": new_id}
        result.append(a)
    return result


# SCHRITT 1: Angriffe identifizieren — paarweise Klassifikation + Verifikation
# Dung (1995): att(A,B) — A greift B an.
# Taxonomie nach Pollock (1992) / ASPIC+ (Modgil & Prakken, 2014):
#   rebuttal:    A bestreitet Konklusion von B
#   undercutting: A untergräbt Prämisse-Konklusion-Verbindung von B
#   undermining: A greift eine Prämisse von B direkt an

PAIR_PROMPT = """Two arguments from a debate on "{topic}":

[{id_a}] ({stance_a}) {text_a}
[{id_b}] ({stance_b}) {text_b}

Is there an attack relation? An attack exists when one argument:
- directly contradicts a claim of the other (rebuttal), OR
- undermines a premise the other relies on (undermining), OR
- shows the other's conclusion does not follow even if its premise is true (undercutting)

confidence = probability that an attack relation exists (0.0 = definitely no attack)

Examples of confidence values:
- Clear direct contradiction → 0.90
- Probable attack with some interpretation needed → 0.70
- Weak or tangential relation → 0.50
- Clearly no conflict → 0.10

Respond ONLY with JSON, no markdown:
{{"direction": "A_ATTACKS_B", "confidence": 0.85, "reason": "one sentence"}}

direction must be exactly one of: A_ATTACKS_B / B_ATTACKS_A / MUTUAL / NONE"""

VERIFY_PROMPT = """Two arguments from a debate on "{topic}":

[{id_a}] ({stance_a}) {text_a}
[{id_b}] ({stance_b}) {text_b}

A previous analysis claims: {claimed}

Does this attack relation genuinely hold?
Does A undermine a premise B relies on (undermining)?
Does A directly contradict B's conclusion (rebuttal)?
Does A show B's conclusion doesn't follow even if B's premise is true (undercutting)?
If any of these holds, confirm=true.

Respond ONLY with JSON, no markdown:
{{"confirms": true, "reason": "one sentence"}}"""


def _llm(prompt: str, max_tokens: int = 1024) -> str | None:
    response = client.chat.completions.create(
        model=MODEL_ATTACKS,
        messages=[{"role": "user", "content": prompt}],
        temperature=0,
        max_tokens=max_tokens,
    )
    return response.choices[0].message.content


def _parse_json(content: str) -> dict | None:
    # Verschiedene Reasoning-Tag-Formate entfernen (<think>, <thinking>, nicht geschlossen)
    cleaned = re.sub(r"<think(?:ing)?>.*?</think(?:ing)?>", "", content, flags=re.DOTALL)
    cleaned = re.sub(r"<think(?:ing)?>.*$", "", cleaned, flags=re.DOTALL)
    cleaned = re.sub(r"```(?:json)?\s*|\s*```", "", cleaned).strip()
    try:
        return json.loads(cleaned)
    except json.JSONDecodeError:
        pass
    # Fallback: erstes { bis letztes } extrahieren — robuster als Regex mit [^{}]
    start = cleaned.find("{")
    end = cleaned.rfind("}")
    if start != -1 and end > start:
        try:
            return json.loads(cleaned[start : end + 1])
        except json.JSONDecodeError:
            pass
    return None


def _classify_pair(a: dict, b: dict, topic: str) -> dict | None:
    content = _llm(PAIR_PROMPT.format(
        topic=topic,
        id_a=a["id"], stance_a=a["stance"], text_a=a["text"],
        id_b=b["id"], stance_b=b["stance"], text_b=b["text"],
    ))
    if not content:
        return None
    result = _parse_json(content)
    if result is None:
        # Zeigt die ersten 120 Zeichen der Rohausgabe zur Diagnose
        preview = content[:120].replace("\n", " ")
        print(f"  [RAW]    {preview}")
    return result


def _verify_pair(a: dict, b: dict, direction: str, topic: str) -> bool:
    claimed = {
        "A_ATTACKS_B": f"[{a['id']}] attacks [{b['id']}]",
        "B_ATTACKS_A": f"[{b['id']}] attacks [{a['id']}]",
        "MUTUAL":      f"[{a['id']}] and [{b['id']}] attack each other mutually",
    }.get(direction, direction)
    content = _llm(VERIFY_PROMPT.format(
        topic=topic,
        id_a=a["id"], stance_a=a["stance"], text_a=a["text"],
        id_b=b["id"], stance_b=b["stance"], text_b=b["text"],
        claimed=claimed,
    ))
    if not content:
        return False
    result = _parse_json(content)
    return bool(result.get("confirms", False)) if result else False


def _register_attacks(a: dict, b: dict, direction: str,
                      seen: set, result: list) -> None:
    """Trägt verifizierte Angriffe in seen/result ein."""
    if direction in ("A_ATTACKS_B", "MUTUAL"):
        key = (a["id"], b["id"])
        if key not in seen:
            seen.add(key)
            result.append(key)
    if direction in ("B_ATTACKS_A", "MUTUAL"):
        key = (b["id"], a["id"])
        if key not in seen:
            seen.add(key)
            result.append(key)


def extract_attacks(arguments: list[dict], topic: str = "") -> list[tuple[str, str]]:
    seen: set[tuple] = set()
    result: list[tuple] = []

    # Nur Cross-Stance-Paare — gleiche Stance greift sich in Dung-AAFs nicht an
    cross_pairs = [
        (a, b)
        for i, a in enumerate(arguments)
        for j, b in enumerate(arguments)
        if i < j
        and a["stance"] != b["stance"]
        and _base_id(a["id"]) != _base_id(b["id"])
    ]
    print(f"  [DEBUG] {len(cross_pairs)} Kreuz-Stance-Paare zu prüfen")

    for a, b in cross_pairs:
        classification = _classify_pair(a, b, topic)
        if not classification:
            print(f"  [ERROR]  {a['id']}↔{b['id']} kein JSON")
            continue

        direction = classification.get("direction", "NONE")
        confidence = float(classification.get("confidence", 0.0))
        reason = classification.get("reason", "")
        print(f"  [PAIR]   {a['id']}↔{b['id']} dir={direction} conf={confidence:.2f}  '{reason}'")

        if direction == "NONE" or confidence < CONFIDENCE_VERIFY:
            print(f"  └─ SKIP (unter Threshold)")
            continue

        if confidence >= CONFIDENCE_ACCEPT:
            # Hohe Konfidenz: direkt akzeptieren
            _register_attacks(a, b, direction, seen, result)
            print(f"  └─ ACCEPT (conf≥{CONFIDENCE_ACCEPT})")
        else:
            # Mittlere Konfidenz: Verify-Schritt
            confirmed = _verify_pair(a, b, direction, topic)
            if confirmed:
                _register_attacks(a, b, direction, seen, result)
                print(f"  └─ ACCEPT nach Verify")
            else:
                print(f"  └─ REJECT (Verify verneint)")

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
        lines.append(f"arg({safe(a['id'])}).  % [{a['stance']}] {a['text']}")

    lines.append("")
    lines.append("% att/2 Fakten  (Angriff-Relationen nach Dung 1995)")
    for att, tgt in attacks:
        lines.append(f"att({safe(att)}, {safe(tgt)}).")

    return "\n".join(lines)


# HAUPTPROGRAMM

if __name__ == "__main__":
    topic_file  = "nuclear_energy"
    topic_label = "Nuclear Energy"

    if SOURCE == "ukp":
        print(f"=== Schritt 0a: UKP-Daten laden (topic={topic_file}, split=test, limit=10) ===")
        args = load_ukp(topic_file, split="test", limit=10)

        for a in args:
            print(f"  [{a['id']}] {a['stance']:3}  {a['text'][:70]}")

        print(f"\n=== Schritt 0b: Argumente atomisieren (Modell: {MODEL_ATTACKS}) ===")
        args = atomize_arguments(args, topic_label)
        print(f"  {len(args)} atomare Argumente gesamt")

    else:
        print(f"=== Schritt 0: Argumente per LLM generieren (topic={topic_label}, 5 pro + 5 con) ===")
        args = extract_arguments(topic_label, n_pro=7, n_con=7)

        for a in args:
            print(f"  [{a['id']}] {a['stance']:3}  {a['text'][:70]}")

    print(f"\n=== Schritt 1: Angriffe identifizieren (Modell: {MODEL_ATTACKS}) ===")
    attacks = extract_attacks(args, topic=topic_label)

    for att, tgt in attacks:
        print(f"  att({att}, {tgt})")

    print("\n=== Schritt 2: Prolog-Output ===")
    prolog_code = to_prolog(args, attacks, topic_label)
    print(prolog_code)

    out_path = Path(__file__).parent / f"generated_af_{SOURCE}.pl"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(prolog_code)
    print(f"\n-> {out_path} geschrieben")
