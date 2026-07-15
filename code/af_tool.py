"""
af_tool.py  —  Dung-AF-Solver als OpenAI-kompatibles LLM-Tool

Wraps den Prolog-Solver als Function-Call-Tool.
Schranke: preferred + stable werden nur berechnet, wenn der unentschiedene Kern
|U| <= MAX_UNDECIDED ist (Enumeration ist in |U| exponentiell, nicht in n);
sonst nur grounded (polynomiell, immer schnell).

Verwendung:
    from af_tool import TOOL_DEFINITION, handle_tool_call, solve_af
"""

import json
import os
import re
import shutil
import subprocess
import tempfile
from pathlib import Path

CODE_DIR = Path(__file__).parent

# SWI-Prolog-Binary: Env-Variable SWIPL > PATH > Windows-Standardpfad
SWIPL = (os.environ.get("SWIPL")
         or shutil.which("swipl")
         or r"C:\Program Files\swipl\bin\swipl.exe")

# Schranke fuer preferred/stable: NICHT die Gesamt-Argumentzahl n (irrelevant —
# well-founded AFs mit n=60 loesen in 0,12s), sondern die Groesse des
# unentschiedenen Kerns |U| (Argumente in Zyklen). Die Enumeration ist in |U|
# exponentiell; gemessen: |U|=16 ~7s, |U|=18 ~25-50s, |U|>=20 > 60s. MaxU=18
# bleibt sicher unter dem Timeout; der Timeout faengt pathologisch dichte U ab.
MAX_UNDECIDED   = 18      # |U|-Schranke fuer preferred/stable (sonst nur grounded)
DEFAULT_TIMEOUT = 120     # Sekunden — zweites Netz fuer dichte U-Kerne


# TOOL-DEFINITION  (OpenAI function-calling Format) -----------

TOOL_DEFINITION = {
    "type": "function",
    "function": {
        "name": "solve_argumentation_framework",
        "description": (
            "Computes the formal extensions of a Dung Abstract Argumentation Framework (AAF) "
            "using grounded, preferred, and stable semantics (Dung 1995). "
            "Returns which arguments are formally 'accepted'. "
            "Call this after identifying arguments and attack relations from a debate text."
        ),
        "parameters": {
            "type": "object",
            "properties": {
                "arguments": {
                    "type": "array",
                    "description": "List of arguments with unique ID, text content, and stance",
                    "items": {
                        "type": "object",
                        "properties": {
                            "id":     {"type": "string",
                                       "description": "Unique identifier, e.g. 'pro1', 'con2'"},
                            "text":   {"type": "string",
                                       "description": "The argument text"},
                            "stance": {"type": "string", "enum": ["pro", "con"]},
                        },
                        "required": ["id", "text", "stance"],
                    },
                },
                "attacks": {
                    "type": "array",
                    "description": "List of attack relations as [attacker_id, target_id] pairs",
                    "items": {
                        "type": "array",
                        "items": {"type": "string"},
                        "minItems": 2,
                        "maxItems": 2,
                    },
                },
                "topic": {
                    "type": "string",
                    "description": "Debate topic for context (e.g. 'Nuclear Energy')",
                },
            },
            "required": ["arguments", "attacks"],
        },
    },
}


# KERN-FUNKTION -----------------------------------------------

def _build_pl(arguments: list[dict], attacks: list, topic: str = "") -> str:
    def safe(s: str) -> str:
        cleaned = re.sub(r"\W+", "_", s).strip("_")
        return cleaned or "arg_unknown"

    lines = [f"% AF — Thema: {topic}", "% arg/1 Fakten"]
    for a in arguments:
        lines.append(
            f"arg({safe(a['id'])}).  % [{a.get('stance', '?')}] {a.get('text', '')}"
        )
    lines.append("")
    lines.append("% att/2 Fakten")
    for att in attacks:
        if isinstance(att, dict):
            attacker, target = att["attacker"], att["target"]
        else:
            attacker, target = att[0], att[1]
        lines.append(f"att({safe(str(attacker))}, {safe(str(target))}).")
    return "\n".join(lines)


def _parse_json_line(output: str) -> dict | None:
    for line in output.splitlines():
        line = line.strip()
        if line.startswith("{"):
            try:
                return json.loads(line)
            except json.JSONDecodeError:
                pass
    return None


def solve_af(
    arguments: list[dict],
    attacks: list,
    topic: str = "",
    timeout: int = DEFAULT_TIMEOUT,
) -> dict:
    """
    Berechnet Dung-Extensions für ein AF.

    Rückgabe-Dict:
      grounded   – Liste akzeptierter Argument-IDs (immer vorhanden)
      preferred  – Liste von Extensions (Listen) oder null bei großem AF
      stable     – Liste von Extensions (Listen) oder null bei großem AF
      n_args     – Anzahl Argumente
      n_attacks  – Anzahl Angriffe
      semantics  – Liste berechneter Semantiken
      error      – Fehlermeldung (nur bei Fehler)
    """
    n = len(arguments)

    pl_content = _build_pl(arguments, attacks, topic)

    with tempfile.NamedTemporaryFile(
        mode="w", suffix=".pl", encoding="utf-8",
        delete=False, dir=CODE_DIR,
    ) as f:
        f.write(pl_content)
        tmp_path = Path(f.name)

    def _run(goal: str) -> dict | None:
        af_name = tmp_path.stem
        prolog_pl = str(CODE_DIR / "prolog.pl").replace("\\", "/")
        init = (
            f"set_prolog_flag(af_source,'{af_name}'),"
            f"consult('{prolog_pl}'),"
            f"{goal},halt."
        )
        try:
            r = subprocess.run(
                [SWIPL, "-g", init, "-t", "halt"],
                capture_output=True, text=True,
                cwd=str(CODE_DIR), timeout=timeout,
            )
            return _parse_json_line(r.stdout)
        except subprocess.TimeoutExpired:
            return None

    try:
        # Versuch 1: grounded-first mit |U|-Schranke. Der Solver berechnet G
        # (polynomiell, immer schnell), bestimmt den unentschiedenen Kern U und
        # enumeriert preferred/stable nur, wenn |U| <= MAX_UNDECIDED. Sonst gibt er
        # grounded + u_size zurück (preferred/stable=null). n ist irrelevant.
        result = _run(f"show_json_gf_guard({MAX_UNDECIDED})")

        # Fallback: Enumeration trotz Schranke im Timeout hängengeblieben
        # (pathologisch dichter U-Kern) → nur grounded.
        if result is None:
            result = _run("show_json_grounded")
            if result is not None:
                result["preferred"] = None
                result["stable"]    = None
                result["warning"]   = "preferred/stable timed out"

        if result is not None:
            result["n_args"]    = n
            result["n_attacks"] = len(attacks)
            if result.get("preferred") is not None:
                result["semantics"] = ["grounded", "preferred", "stable"]
            else:
                result["semantics"] = ["grounded"]
                # Grund differenzieren: |U|-Schranke vs. Timeout
                if result.get("warning") is None and result.get("u_size") is not None:
                    result["warning"] = (
                        f"|U|={result['u_size']} > {MAX_UNDECIDED}: nur grounded "
                        f"(preferred/stable exponentiell)"
                    )
            return result

        return {
            "error":     f"Timeout nach {timeout}s — AF zu groß für gewählte Semantik",
            "n_args":    n,
            "n_attacks": len(attacks),
        }

    finally:
        tmp_path.unlink(missing_ok=True)


def handle_tool_call(tool_args: dict) -> str:
    """
    Verarbeitet einen LLM-Tool-Call-Payload und gibt JSON-String zurück.
    Direkt als tool_result-Content verwendbar.
    """
    result = solve_af(
        arguments=tool_args.get("arguments", []),
        attacks=tool_args.get("attacks", []),
        topic=tool_args.get("topic", ""),
    )
    return json.dumps(result, ensure_ascii=False)


# DEMO --------------------------------------------------------

if __name__ == "__main__":
    demo_args = [
        {"id": "pro1", "text": "Nuclear energy is low-carbon.", "stance": "pro"},
        {"id": "pro2", "text": "Modern reactors are safe.", "stance": "pro"},
        {"id": "con1", "text": "Nuclear waste is dangerous.", "stance": "con"},
        {"id": "con2", "text": "Construction costs are too high.", "stance": "con"},
    ]
    demo_attacks = [
        ["con1", "pro1"],
        ["pro2", "con1"],
        ["con2", "pro1"],
    ]

    print("=== AF-Solver Demo ===")
    result = solve_af(demo_args, demo_attacks, topic="Nuclear Energy")
    print(json.dumps(result, indent=2, ensure_ascii=False))

    print("\n=== Tool-Definition (für OpenAI client) ===")
    print(json.dumps(TOOL_DEFINITION, indent=2, ensure_ascii=False))
