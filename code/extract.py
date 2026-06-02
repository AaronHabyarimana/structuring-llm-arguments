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
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from openai import OpenAI, RateLimitError, BadRequestError
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
    base_url="https://ki-chat.uni-mainz.de/api",
    api_key=os.environ.get("KI_API_KEY", "DEIN_SCHLUESSEL_HIER"),
)

MODEL_EXTRACT = "GPT OSS 120B"
MODEL_ATTACKS  = "GPT OSS 120B"

CONFIDENCE_ACCEPT = 70    # ab hier: direkt akzeptieren, kein Verify nötig  
CONFIDENCE_VERIFY = 50    # ab hier:Verify-Schritt, bei Zustimmung akzeptieren

MAX_WORKERS   = 2                # parallele API-Calls — Rate-Limit der Uni-API
BATCH_SIZE    = 30                 # Paare pro Classify-Call
RETRY_DELAYS  = (2, 5, 12)       #Wartezeiten (s) bei 429, dann aufgeben

SOURCE = "ukp"  # "ukp" → load_ukp  |  "llm" → extract_arguments

UKP_DIR = Path(__file__).parent.parent / "UKP_sentential_argument_mining" / "data"


# SCHRITT 0a: UKP-Daten laden
# annotation: "Argument_for" -> pro, "Argument_against" -> con, "NoArgument" -> überspringen

def load_ukp(topic: str, split: str, limit: int,
             balanced: bool = True, seed: int = 10) -> list[dict]:
    """
    Lädt annotierte Argumente aus dem UKP-Datensatz.
    topic: Dateiname ohne .tsv, z.B. "nuclear_energy"
    split:"train", "test" oder "val"
    limit: Gesamtzahl geladener Argumente
    balanced: True → gleich viele pro/con (je limit//2), reproduzierbar mit seed
    seed:Zufalls-Seed für reproduzierbare Experimente
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
    n_pro/n_con: Anzahl Pro-/Contra-Argumente
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


def _atomize_one(a: dict, topic: str) -> list[dict]:
    """Atomisiert ein einzelnes Argument (für parallele Ausführung)."""
    content = _llm(ATOMIZE_PROMPT.format(
        topic=topic, id=a["id"], stance=a["stance"], text=a["text"]
    ))
    if not content:
        return [a]
    raw = re.sub(r"```(?:json)?\s*|\s*```", "", content.strip()).strip()
    try:
        atoms = json.loads(raw)
        if len(atoms) > 1:
            print(f"  [{a['id']}] → {len(atoms)} atomare Argumente")
        return atoms
    except json.JSONDecodeError:
        return [a]


def atomize_arguments(arguments: list[dict], topic: str) -> list[dict]:
    slot: dict[int, list[dict]] = {}
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
        futures = {ex.submit(_atomize_one, a, topic): i for i, a in enumerate(arguments)}
        for future in as_completed(futures):
            slot[futures[future]] = future.result()
    flat = [atom for i in sorted(slot) for atom in slot[i]]
    return _fix_atom_ids(flat)


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

BATCH_PAIR_PROMPT = """Propose attack candidates for the following argument pairs from a debate on "{topic}".

An attack exists when one argument:
- directly contradicts the conclusion of the other (rebuttal), OR
- undermines a premise the other relies on (undermining), OR
- shows the other's conclusion does not follow even if its premise is true (undercutting)

{pairs}

direction    = exactly one of: A_ATTACKS_B / B_ATTACKS_A / NONE
attack_type  = one of: rebuttal / undercutting / undermining / NONE
  rebuttal:     attacker directly contradicts the target's conclusion
  undercutting: attacker shows target's conclusion doesn't follow even if target's premise holds
  undermining:  attacker directly attacks a premise the target relies on
  If direction=NONE, attack_type MUST be NONE.
confidence   = integer 0-100: probability that ANY attack exists between the two arguments
  (0 = definitely no attack, 100 = definitely attack)
  If direction=NONE, confidence MUST be 0.

Respond ONLY with a JSON array, same order as the pairs above, no markdown:
[
  {{"pair": "id_a:id_b", "direction": "A_ATTACKS_B", "attack_type": "rebuttal", "confidence": 85, "reason": "one sentence"}},
  ...
]"""

SINGLE_PAIR_PROMPT = """Two arguments from a debate on "{topic}":

A=[{id_a}] ({stance_a}) {text_a}
B=[{id_b}] ({stance_b}) {text_b}

Propose an attack candidate if one exists. An attack exists when one argument:
- directly contradicts the conclusion of the other (rebuttal), OR
- undermines a premise the other relies on (undermining), OR
- shows the other's conclusion does not follow even if its premise is true (undercutting)

direction    = exactly one of: A_ATTACKS_B / B_ATTACKS_A / NONE
attack_type  = one of: rebuttal / undercutting / undermining / NONE
  rebuttal:     attacker directly contradicts the target's conclusion
  undercutting: attacker shows target's conclusion doesn't follow even if target's premise holds
  undermining:  attacker directly attacks a premise the target relies on
  If direction=NONE, attack_type MUST be NONE.
confidence   = integer 0-100: probability that ANY attack exists
  (0 = definitely no attack, 100 = definitely attack)
  If direction=NONE, confidence MUST be 0.

Respond ONLY with JSON, no markdown:
{{"direction": "A_ATTACKS_B", "attack_type": "rebuttal", "confidence": 85, "reason": "one sentence"}}"""

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
    for delay in (None, *RETRY_DELAYS):
        if delay:
            # Jitter verhindert dass mehrere Threads gleichzeitig wiederholen
            time.sleep(delay + random.uniform(0, delay * 0.5))
        try:
            response = client.chat.completions.create(
                model=MODEL_ATTACKS,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=max_tokens,
            )
            return response.choices[0].message.content
        except RateLimitError:
            pass
        except BadRequestError as e:
            if "Rate limit exceeded" in str(e):
                pass
            else:
                raise
    return None


def _parse_json(content: str) -> dict | list | None:
    # Verschiedene Reasoning-Tag-Formate entfernen (<think>, <thinking>, nicht geschlossen)
    cleaned = re.sub(r"<think(?:ing)?>.*?</think(?:ing)?>", "", content, flags=re.DOTALL)
    cleaned = re.sub(r"<think(?:ing)?>.*$", "", cleaned, flags=re.DOTALL)
    cleaned = re.sub(r"```(?:json)?\s*|\s*```", "", cleaned).strip()
    try:
        return json.loads(cleaned)
    except json.JSONDecodeError:
        pass
    # Fallback dict: erstes { bis letztes }
    start = cleaned.find("{")
    end = cleaned.rfind("}")
    if start != -1 and end > start:
        try:
            return json.loads(cleaned[start : end + 1])
        except json.JSONDecodeError:
            pass
    # Fallback list: erstes [ bis letztes ]
    start = cleaned.find("[")
    end = cleaned.rfind("]")
    if start != -1 and end > start:
        try:
            return json.loads(cleaned[start : end + 1])
        except json.JSONDecodeError:
            pass
    return None


def _classify_batch(pairs: list[tuple[dict, dict]], topic: str) -> dict[tuple, dict | None]:
    out: dict[tuple, dict | None] = {(a["id"], b["id"]): None for a, b in pairs}

    prompt = BATCH_PAIR_PROMPT.format(
        topic=topic,
        pairs="\n\n".join(
            f"Pair {a['id']}:{b['id']}\n"
            f"  A=[{a['id']}] ({a['stance']}) {a['text']}\n"
            f"  B=[{b['id']}] ({b['stance']}) {b['text']}"
            for a, b in pairs
        )
    )

    # Batch-Versuch (max 2 Versuche)
    for attempt in range(2):
        content = _llm(prompt, max_tokens=300 * len(pairs))
        if not content:
            continue
        parsed = _parse_json(content)
        if isinstance(parsed, list):
            for item in parsed:
                try:
                    aid, bid = item.get("pair", "").split(":", 1)
                    if (aid, bid) in out:
                        out[(aid, bid)] = item
                except Exception:
                    continue
            break  # Liste erhalten — fehlende Paare per Fallback
        # Kein gültiges JSON → nochmal versuchen

    # Fallback: Einzelaufrufe für noch fehlende Paare — sequentiell mit Pause
    missing = [(a, b) for a, b in pairs if out[(a["id"], b["id"])] is None]
    if missing:
        print(f"  [FALLBACK] {len(missing)} Paare einzeln klassifiziert")
        for a, b in missing:
            time.sleep(1)
            content = _llm(SINGLE_PAIR_PROMPT.format(
                topic=topic,
                id_a=a["id"], stance_a=a["stance"], text_a=a["text"],
                id_b=b["id"], stance_b=b["stance"], text_b=b["text"],
            ))
            if content:
                result = _parse_json(content)
                if isinstance(result, dict):
                    out[(a["id"], b["id"])] = result

    return out


def _verify_pair(a: dict, b: dict, direction: str, topic: str) -> bool:
    claimed = {
        "A_ATTACKS_B": f"[{a['id']}] attacks [{b['id']}]",
        "B_ATTACKS_A": f"[{b['id']}] attacks [{a['id']}]"
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
                      attack_type: str, confidence: int, reason: str,
                      seen: set, result: list) -> None:
    """Trägt akzeptierte Attack-Kandidaten in seen/result ein."""
    if direction in ("A_ATTACKS_B"):
        key = (a["id"], b["id"])
        if key not in seen:
            seen.add(key)
            result.append({"attacker": a["id"], "target": b["id"],
                           "type": attack_type, "confidence": confidence, "reason": reason})
    if direction in ("B_ATTACKS_A"):
        key = (b["id"], a["id"])
        if key not in seen:
            seen.add(key)
            result.append({"attacker": b["id"], "target": a["id"],
                           "type": attack_type, "confidence": confidence, "reason": reason})


def extract_attacks(arguments: list[dict], topic: str = "") -> list[dict]:
    """
    Gibt eine Liste akzeptierter Attack-Kandidaten zurück.
    Jeder Eintrag: {"attacker", "target", "type", "confidence", "reason"}
    Typen (rebuttal/undercutting/undermining) verbessern die Extraktion;
    für die Dung-Auswertung werden sie zu binären att/2-Fakten kollabiert.
    """
    seen: set[tuple] = set()
    result: list[dict] = []

    # Alle Paare prüfen — Cross-Stance-Filter entfernt, da UKP-Labels nicht
    # zuverlässig eine globale Debattenrichtung abbilden (P3).
    cross_pairs = [
        (a, b)
        for i, a in enumerate(arguments)
        for j, b in enumerate(arguments)
        if i < j
        and _base_id(a["id"]) != _base_id(b["id"])
    ]
    print(f"  [DEBUG] {len(cross_pairs)} Paare zu prüfen")

    # Phase 1: Classify in Batches — reduziert API-Calls von O(n²) auf O(n²/BATCH_SIZE)
    batches = [cross_pairs[i:i + BATCH_SIZE] for i in range(0, len(cross_pairs), BATCH_SIZE)]
    print(f"  [DEBUG] {len(cross_pairs)} Paare → {len(batches)} Batches à max {BATCH_SIZE}")

    classify: dict[tuple, tuple[dict, dict, dict | None]] = {}
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
        futures = {ex.submit(_classify_batch, batch, topic): batch for batch in batches}
        for future in as_completed(futures):
            batch = futures[future]
            batch_result = future.result()
            for a, b in batch:
                cl = batch_result.get((a["id"], b["id"]))
                classify[(a["id"], b["id"])] = (a, b, cl)

    # Phase 2: Verify-Calls für mittlere Konfidenz parallel
    to_verify = [
        (a, b, cl.get("direction", "NONE"))
        for a, b, cl in classify.values()
        if cl and CONFIDENCE_VERIFY <= int(cl.get("confidence", 0)) < CONFIDENCE_ACCEPT
        and cl.get("direction", "NONE") != "NONE"
    ]
    verified: dict[tuple, bool] = {}
    if to_verify:
        with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
            futures_v = {
                ex.submit(_verify_pair, a, b, d, topic): (a["id"], b["id"])
                for a, b, d in to_verify
            }
            for future in as_completed(futures_v):
                key = futures_v[future]
                verified[key] = future.result()

    # Phase 3: Kandidaten filtern und registrieren
    # Kollabierung: Typ/Confidence/Reason bleiben im Dict erhalten;
    # für Dung wird nur att(attacker, target) verwendet — bewusste Designentscheidung.
    for (aid, bid), (a, b, cl) in classify.items():
        if not cl:
            print(f"  [ERROR]  {aid}↔{bid} kein JSON")
            continue

        direction   = cl.get("direction", "NONE")
        attack_type = cl.get("attack_type", "NONE")
        confidence  = int(cl.get("confidence", 0))
        reason      = cl.get("reason", "")
        print(f"  [PAIR]   {aid}↔{bid} dir={direction} type={attack_type} conf={confidence}  '{reason}'")

        if direction == "NONE" or confidence < CONFIDENCE_VERIFY:
            print(f"  └─ SKIP (unter Threshold)")
        elif confidence >= CONFIDENCE_ACCEPT:
            _register_attacks(a, b, direction, attack_type, confidence, reason, seen, result)
            print(f"  └─ ACCEPT (conf≥{CONFIDENCE_ACCEPT})")
        elif verified.get((aid, bid), False):
            _register_attacks(a, b, direction, attack_type, confidence, reason, seen, result)
            print(f"  └─ ACCEPT nach Verify")
        else:
            print(f"  └─ REJECT (Verify verneint)")

    return result



# SCHRITT 2: Prolog-Datei generieren

def to_prolog(arguments: list[dict], attacks: list[dict], topic: str) -> str:
    """
    Erzeugt Prolog-Fakten für ein Dung AAF.
    att/2-Fakten sind bewusst binär (Dung 1995) — Typ/Confidence aus der
    LLM-Extraktion werden als Kommentare erhalten, fließen aber nicht in
    die formale Semantikberechnung ein (explizite Designentscheidung).
    """
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
    lines.append("% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)")
    for atk in attacks:
        type_info = f"[{atk['type']}] conf={atk['confidence']} — {atk['reason']}"
        lines.append(f"att({safe(atk['attacker'])}, {safe(atk['target'])}).  % {type_info}")

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

    print(f"\n=== Schritt 1: Attack-Kandidaten vorschlagen, filtern, kollabieren (Modell: {MODEL_ATTACKS}) ===")
    attacks = extract_attacks(args, topic=topic_label)

    for atk in attacks:
        print(f"  att({atk['attacker']}, {atk['target']})  [{atk['type']}] conf={atk['confidence']}")

    print("\n=== Schritt 2: Prolog-Output ===")
    prolog_code = to_prolog(args, attacks, topic_label)
    print(prolog_code)

    out_dir = Path(__file__).parent / "output"
    out_dir.mkdir(exist_ok=True)
    out_path = out_dir / f"generated_af_{SOURCE}.pl"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(prolog_code)
    print(f"\n-> {out_path} geschrieben")
