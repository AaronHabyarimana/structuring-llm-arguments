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
BATCH_SIZE    = 10                 # Paare pro Classify-Call
RETRY_DELAYS  = (2, 5, 12)       #Wartezeiten (s) bei 429, dann aufgeben

SOURCE = "ukp"  # "ukp" → load_ukp  |  "llm" → extract_arguments

# Default-Parameter für UKP-Läufe (zentral, damit run_config.json sie spiegeln kann)
UKP_SPLIT    = "test"
UKP_LIMIT    = 15
UKP_BALANCED = True
UKP_SEED     = 42
ATOMIZE      = True

# Prompt-Versionen — für reproduzierbare Prompt-Vergleiche in den Logs
PROMPT_VERSIONS = {
    "atomize":         "atomize_v3",   # v3: zitierte/konzessive Fremdpositionen nicht mehr promoten (Polaritäts-Flip)
    "classify_batch":  "classify_batch_v3",   # v3: deskriptiv≠normativ kann nicht rebutten (Kategorienfehler)
    "classify_single": "classify_single_v3",  # v3: deskriptiv≠normativ kann nicht rebutten (Kategorienfehler)
    "verify":          "verify_v3",            # v3: deskriptiv≠normativ kann nicht rebutten (Kategorienfehler)
    "generate":        "generate_v1",
}

# Rebuttals sind per Definition gegenseitig (Pollock 1992; ASPIC+): wenn die
# Konklusionen einander negieren, gilt der Angriff in beide Richtungen. Bei True
# wird für jeden akzeptierten Rebuttal die Gegenkante ergänzt (Symmetrisierung).
SYMMETRIZE_REBUTTALS = True

UKP_DIR = Path(__file__).parent.parent / "UKP_sentential_argument_mining" / "data"

# Logging-Hook: optionaler RunLogger (run_logger.RunLogger). Wenn None, verhält
# sich die Pipeline exakt wie zuvor (keine Verhaltensänderung).
_RUN_LOGGER = None


def set_run_logger(logger) -> None:
    """Setzt (oder entfernt mit None) den aktiven RunLogger für LLM-/Pair-Logging."""
    global _RUN_LOGGER
    _RUN_LOGGER = logger


# SCHRITT 0a: UKP-Daten laden
# annotation: "Argument_for" -> pro, "Argument_against" -> con, "NoArgument" -> überspringen

def load_ukp(topic: str, split: str, limit: int,
             balanced: bool = True, seed: int = UKP_SEED) -> list[dict]:
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
    # quoting=QUOTE_NONE: das UKP-TSV nutzt kein CSV-Quoting; ein einzelnes '"' im
    # Satz (z.B. ' " The cortex ...') würde sonst als Feld-Quote interpretiert und
    # verschmölze zig Folgezeilen in EIN sentence-Feld (Datenkorruption).
    with open(path, encoding="utf-8", newline="") as f:
        for row in csv.DictReader(f, delimiter="\t", quoting=csv.QUOTE_NONE):
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
    gen_prompt = LLM_GENERATE_PROMPT.format(topic=topic, n_pro=n_pro, n_con=n_con)
    t0 = time.time()
    response = client.chat.completions.create(
        model=MODEL_EXTRACT,
        messages=[{"role": "user", "content": gen_prompt}],
        temperature=0,
        max_tokens=2048,
    )
    content = response.choices[0].message.content
    if _RUN_LOGGER is not None:
        usage = None
        if getattr(response, "usage", None) is not None:
            try:
                usage = response.usage.model_dump()
            except Exception:
                usage = None
        _RUN_LOGGER.log_call(
            phase="generate", prompt=gen_prompt, raw_response=content,
            latency_s=time.time() - t0, model=MODEL_EXTRACT,
            prompt_version=PROMPT_VERSIONS.get("generate"), temperature=0,
            max_tokens=2048, usage=usage,
        )
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

Important: Only promote claims the speaker actually ASSERTS as their own.
- Concessive/contrastive clauses (markers: "but", "although", "while", "despite",
  "even though", "yet") are rhetorical hedges, NOT independent arguments. Keep them
  attached to the main claim or drop them — never make them a separate atom.
- Reported or conceded positions of the opposing side (e.g. "opponents argue X",
  "greens always argue X", "some claim X, but ...") are NOT the speaker's own claim.
  Do NOT promote them to a separate atom; drop them.
This prevents atoms that, read in isolation, carry the OPPOSITE stance of the speaker
(e.g. a pro-nuclear sentence must never yield a pro-renewable atom).

Self-containment rule: Every output argument MUST be understandable without
any surrounding context. If a fragment contains pronouns like "it", "them",
"this", "they" without a clear referent, replace the pronoun with the explicit
noun from the original sentence. If the referent cannot be recovered, drop
the fragment entirely.

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
    ), phase="atomize", input_ids=[a["id"]])
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
    # Original-Texte je Eingabe-ID merken, damit arguments.jsonl die Herkunft
    # eines atomaren Arguments (original_text, atomized_from) dokumentieren kann.
    originals = {a["id"]: a["text"] for a in arguments}

    slot: dict[int, list[dict]] = {}
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
        futures = {ex.submit(_atomize_one, a, topic): i for i, a in enumerate(arguments)}
        for future in as_completed(futures):
            slot[futures[future]] = future.result()
    flat = [atom for i in sorted(slot) for atom in slot[i]]
    fixed = _fix_atom_ids(flat)

    # Herkunftsfelder anhängen (base_id stellt Verbindung zum Original her).
    for atom in fixed:
        base = _base_id(atom["id"])
        atom["atomized_from"] = base
        atom.setdefault("original_text", originals.get(base, atom["text"]))
    return fixed


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
- asserts a conclusion logically incompatible with the other's conclusion — the one claim can be true only if the other is false (rebuttal), OR
- undermines a premise the other relies on (undermining), OR
- shows the other's conclusion does not follow even if its premise is true (undercutting)

{pairs}

direction    = exactly one of: A_ATTACKS_B / B_ATTACKS_A / NONE
attack_type  = one of: rebuttal / undercutting / undermining / NONE
  rebuttal:     the two conclusions are logically incompatible — they negate the SAME
                proposition, so one claim is true only if the other is false. Merely
                taking the opposing stance, addressing a different sub-topic, or
                "arguing for the other side" is NOT a rebuttal; there must be a direct
                contradiction between the two specific claims. A descriptive/empirical
                claim (what people believe or do, statistics, trends) and a normative
                claim (what ought to be) are NOT logically incompatible — they cannot
                rebut each other (at most undermining/undercutting). A rebuttal is
                inherently MUTUAL (it holds in both directions); pick either direction.
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
- asserts a conclusion logically incompatible with the other's conclusion — the one claim can be true only if the other is false (rebuttal), OR
- undermines a premise the other relies on (undermining), OR
- shows the other's conclusion does not follow even if its premise is true (undercutting)

direction    = exactly one of: A_ATTACKS_B / B_ATTACKS_A / NONE
attack_type  = one of: rebuttal / undercutting / undermining / NONE
  rebuttal:     the two conclusions are logically incompatible — they negate the SAME
                proposition, so one claim is true only if the other is false. Merely
                taking the opposing stance, addressing a different sub-topic, or
                "arguing for the other side" is NOT a rebuttal; there must be a direct
                contradiction between the two specific claims. A descriptive/empirical
                claim (what people believe or do, statistics, trends) and a normative
                claim (what ought to be) are NOT logically incompatible — they cannot
                rebut each other (at most undermining/undercutting). A rebuttal is
                inherently MUTUAL (it holds in both directions); pick either direction.
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
Do A and B assert logically incompatible conclusions that negate the same proposition,
so that one is true only if the other is false (rebuttal)? Opposing stance alone is NOT enough.
A descriptive claim (what people believe/do, statistics) and a normative claim (what ought
to be) are NOT logically incompatible and cannot rebut each other.
Does A show B's conclusion doesn't follow even if B's premise is true (undercutting)?
If any of these holds, confirm=true.

Respond ONLY with JSON, no markdown:
{{"confirms": true, "reason": "one sentence"}}"""


def _log_call(phase, prompt, raw, latency, *, input_ids=None, usage=None,
              error=None, max_tokens=None) -> None:
    """Leitet einen LLM-Call an den aktiven RunLogger weiter (no-op ohne Logger)."""
    if _RUN_LOGGER is None:
        return
    _RUN_LOGGER.log_call(
        phase=phase,
        prompt=prompt,
        raw_response=raw,
        latency_s=latency,
        model=MODEL_ATTACKS,
        prompt_version=PROMPT_VERSIONS.get(phase),
        input_ids=input_ids,
        temperature=0,
        max_tokens=max_tokens,
        usage=usage,
        error=error,
    )


def _llm(prompt: str, max_tokens: int = 1024,
         *, phase: str = "unknown", input_ids: list | None = None) -> str | None:
    """
    Zentraler LLM-Wrapper mit Retry. Loggt jeden einzelnen Versuch (Erfolg wie
    Fehler) über den optionalen RunLogger. Verhalten ohne Logger unverändert.
    """
    for delay in (None, *RETRY_DELAYS):
        if delay:
            # Jitter verhindert dass mehrere Threads gleichzeitig wiederholen
            time.sleep(delay + random.uniform(0, delay * 0.5))
        t0 = time.time()
        try:
            response = client.chat.completions.create(
                model=MODEL_ATTACKS,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=max_tokens,
            )
            content = response.choices[0].message.content
            usage = None
            if getattr(response, "usage", None) is not None:
                try:
                    usage = response.usage.model_dump()
                except Exception:
                    usage = None
            _log_call(phase, prompt, content, time.time() - t0,
                      input_ids=input_ids, usage=usage, max_tokens=max_tokens)
            return content
        except RateLimitError:
            _log_call(phase, prompt, None, time.time() - t0,
                      input_ids=input_ids, error="RateLimitError", max_tokens=max_tokens)
        except BadRequestError as e:
            if "Rate limit exceeded" in str(e):
                _log_call(phase, prompt, None, time.time() - t0,
                          input_ids=input_ids, error="BadRequestError: rate limit",
                          max_tokens=max_tokens)
            else:
                _log_call(phase, prompt, None, time.time() - t0,
                          input_ids=input_ids, error=f"BadRequestError: {e}",
                          max_tokens=max_tokens)
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
    batch_ids = [pid for a, b in pairs for pid in (a["id"], b["id"])]
    for attempt in range(2):
        content = _llm(prompt, max_tokens=300 * len(pairs),
                       phase="classify_batch", input_ids=batch_ids)
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
            ), phase="classify_single", input_ids=[a["id"], b["id"]])
            if content:
                result = _parse_json(content)
                if isinstance(result, dict):
                    out[(a["id"], b["id"])] = result

    return out


def _verify_pair(a: dict, b: dict, direction: str, topic: str) -> tuple[bool, str]:
    """Rückgabe: (confirms, reason) — reason für pair_decisions.jsonl erhalten."""
    claimed = {
        "A_ATTACKS_B": f"[{a['id']}] attacks [{b['id']}]",
        "B_ATTACKS_A": f"[{b['id']}] attacks [{a['id']}]"
    }.get(direction, direction)
    content = _llm(VERIFY_PROMPT.format(
        topic=topic,
        id_a=a["id"], stance_a=a["stance"], text_a=a["text"],
        id_b=b["id"], stance_b=b["stance"], text_b=b["text"],
        claimed=claimed,
    ), phase="verify", input_ids=[a["id"], b["id"]])
    if not content:
        return False, ""
    result = _parse_json(content)
    if not result:
        return False, ""
    return bool(result.get("confirms", False)), result.get("reason", "")


def _register_attacks(a: dict, b: dict, direction: str,
                      attack_type: str, confidence: int, reason: str,
                      seen: set, result: list, outcome: str = "accept") -> None:
    """Trägt akzeptierte Attack-Kandidaten in seen/result ein (inkl. outcome)."""
    if direction == "A_ATTACKS_B":
        key = (a["id"], b["id"])
        if key not in seen:
            seen.add(key)
            result.append({"attacker": a["id"], "target": b["id"],
                           "type": attack_type, "confidence": confidence,
                           "reason": reason, "outcome": outcome})
    if direction == "B_ATTACKS_A":
        key = (b["id"], a["id"])
        if key not in seen:
            seen.add(key)
            result.append({"attacker": b["id"], "target": a["id"],
                           "type": attack_type, "confidence": confidence,
                           "reason": reason, "outcome": outcome})


def _log_pair_decision(a: dict, b: dict, cl: dict | None, outcome: str,
                       verify_info: tuple | None = None) -> None:
    """
    Loggt EINE Paarentscheidung in pair_decisions.jsonl (auch NONE/skip/reject/
    parse_error). Bei direction=NONE sind attacker/target = None.
    """
    if _RUN_LOGGER is None:
        return
    cl = cl or {}
    direction   = cl.get("direction", "NONE")
    attack_type = cl.get("attack_type", "NONE")
    confidence  = int(cl.get("confidence", 0) or 0)
    reason      = cl.get("reason", "")

    if direction == "A_ATTACKS_B":
        attacker, target = a["id"], b["id"]
    elif direction == "B_ATTACKS_A":
        attacker, target = b["id"], a["id"]
    else:
        attacker, target = None, None

    verified_bool = bool(verify_info[0]) if verify_info else None
    verify_reason = verify_info[1] if verify_info else None

    _RUN_LOGGER.log_pair_decision({
        "pair":        f"{a['id']}:{b['id']}",
        "attacker":    attacker,
        "target":      target,
        "id_a":        a["id"],
        "id_b":        b["id"],
        "stance_a":    a["stance"],
        "stance_b":    b["stance"],
        "direction":   direction,
        "attack_type": attack_type,
        "confidence":  confidence,
        "reason":      reason,
        "outcome":     outcome,
        "verified":    verified_bool,
        "verify_reason": verify_reason,
        "same_stance": a["stance"] == b["stance"],
        "same_base":   _base_id(a["id"]) == _base_id(b["id"]),
    })


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
    verified: dict[tuple, tuple[bool, str]] = {}
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
            _log_pair_decision(a, b, None, "parse_error")
            continue

        direction   = cl.get("direction", "NONE")
        attack_type = cl.get("attack_type", "NONE")
        confidence  = int(cl.get("confidence", 0))
        reason      = cl.get("reason", "")
        print(f"  [PAIR]   {aid}↔{bid} dir={direction} type={attack_type} conf={confidence}  '{reason}'")

        verify_info = verified.get((aid, bid))  # (bool, reason) oder None

        if direction == "NONE" or confidence < CONFIDENCE_VERIFY:
            print(f"  └─ SKIP (unter Threshold)")
            _log_pair_decision(a, b, cl, "skip")
        elif confidence >= CONFIDENCE_ACCEPT:
            _register_attacks(a, b, direction, attack_type, confidence, reason,
                              seen, result, outcome="accept")
            print(f"  └─ ACCEPT (conf≥{CONFIDENCE_ACCEPT})")
            _log_pair_decision(a, b, cl, "accept")
        elif verify_info and verify_info[0]:
            _register_attacks(a, b, direction, attack_type, confidence, reason,
                              seen, result, outcome="verify-accept")
            print(f"  └─ ACCEPT nach Verify")
            _log_pair_decision(a, b, cl, "verify-accept", verify_info)
        else:
            print(f"  └─ REJECT (Verify verneint)")
            _log_pair_decision(a, b, cl, "verify-reject", verify_info)

    # Symmetrisierung: Rebuttals gelten per Definition gegenseitig (Pollock 1992;
    # ASPIC+). Für jeden akzeptierten Rebuttal die Gegenkante ergänzen, sofern die
    # Gegenrichtung nicht ohnehin schon (aus einer anderen Klassifikation) existiert.
    if SYMMETRIZE_REBUTTALS:
        added = []
        for atk in result:
            if atk["type"] != "rebuttal":
                continue
            rev = (atk["target"], atk["attacker"])
            if rev in seen:
                continue
            seen.add(rev)
            added.append({
                "attacker": atk["target"], "target": atk["attacker"],
                "type": "rebuttal", "confidence": atk["confidence"],
                "reason": f"[symmetric rebuttal] {atk['reason']}",
                "outcome": "symmetric-rebuttal",
            })
        if added:
            print(f"  [SYM] {len(added)} Rebuttal-Gegenkanten ergänzt")
        result.extend(added)

    # attacks.jsonl: akzeptierte Angriffe als gefilterte Kantenliste
    if _RUN_LOGGER is not None:
        for atk in result:
            _RUN_LOGGER.log_attack({
                "attacker": atk["attacker"], "target": atk["target"],
                "type": atk["type"], "confidence": atk["confidence"],
                "reason": atk["reason"], "outcome": atk.get("outcome", "accept"),
            })

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
    topic_label = "nuclear energy" 

    if SOURCE == "ukp":
        print(f"=== Schritt 0a: UKP-Daten laden (topic={topic_file}, split=test, limit=10) ===")
        args = load_ukp(topic_file, split="test", limit=15)

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
