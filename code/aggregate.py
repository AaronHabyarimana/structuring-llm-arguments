"""
aggregate.py — Cross-Run-Aggregator (Schritt 2).

Liest alle output/runs/<run_id>/ ein, wählt pro Topic den jüngsten Run und
erzeugt eine Vergleichstabelle über alle Topics — als Markdown (für die
Bachelorarbeit / das Paper) und als CSV (für eigene Auswertung).

Aufruf:
    python aggregate.py
"""

import csv
import json
import sys
from pathlib import Path

if sys.stdout.encoding and sys.stdout.encoding.lower() != "utf-8":
    sys.stdout.reconfigure(encoding="utf-8")

from run_logger import RUNS_DIR

OUT_DIR = Path(__file__).parent / "output"
ACCEPT_OUTCOMES = {"accept", "verify-accept"}


def _read_json(path: Path):
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception:                                # noqa: BLE001
        return None


def _read_jsonl(path: Path) -> list[dict]:
    out = []
    if path.exists():
        for line in path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if line:
                try:
                    out.append(json.loads(line))
                except json.JSONDecodeError:
                    pass
    return out


def collect_runs() -> dict[str, dict]:
    """{topic_file: run_record} — pro Topic der jüngste Run (run_id sortierbar)."""
    runs: dict[str, dict] = {}
    for run_dir in sorted(RUNS_DIR.glob("*")):
        if not run_dir.is_dir():
            continue
        cfg = _read_json(run_dir / "run_config.json")
        res = _read_json(run_dir / "results.json")
        if not cfg or not res:
            continue
        topic = cfg.get("topic_file", run_dir.name)
        rid = cfg.get("run_id", run_dir.name)
        if topic in runs and runs[topic]["run_id"] >= rid:
            continue
        runs[topic] = {
            "run_id": rid,
            "cfg": cfg,
            "res": res,
            "decisions": _read_jsonl(run_dir / "pair_decisions.jsonl"),
        }
    return runs


def build_row(rec: dict) -> dict:
    cfg, res, dec = rec["cfg"], rec["res"], rec["decisions"]
    gs = res.get("graph_stats", {})
    n_pairs = len(dec)
    n_acc = sum(1 for d in dec if d.get("outcome") in ACCEPT_OUTCOMES)
    pref, stab = res.get("preferred"), res.get("stable")
    grounded = res.get("grounded") or []
    tc = gs.get("attack_type_counts", {})
    rt = res.get("runtime_s", {})
    return {
        "topic": cfg.get("topic_label", cfg.get("topic_file")),
        "n_args": cfg.get("n_args_before_atomize", "?"),
        "n_atoms": res.get("n_args", gs.get("n_args", "?")),
        "n_pairs": n_pairs,
        "n_acc": n_acc,
        "acc_pct": round(100 * n_acc / n_pairs, 1) if n_pairs else 0.0,
        "density": gs.get("density"),
        "iso": len(gs.get("isolated_nodes", [])),
        "n_scc": gs.get("n_scc"),
        "cycles": gs.get("has_cycles"),
        "grounded": len(grounded),
        "n_pref": len(pref) if isinstance(pref, list) else "n/a",
        "n_stable": len(stab) if isinstance(stab, list) else "n/a",
        "semantics": "+".join(res.get("semantics") or []),
        "cross_ratio": gs.get("cross_stance_ratio"),
        "rebuttal": tc.get("rebuttal", 0),
        "undermining": tc.get("undermining", 0),
        "undercutting": tc.get("undercutting", 0),
        "runtime": rt.get("total"),
        "run_id": rec["run_id"],
    }


def _md_table(headers: list[str], rows: list[list]) -> str:
    align = ["---"] + ["---:"] * (len(headers) - 1)
    out = ["| " + " | ".join(headers) + " |",
           "|" + "|".join(align) + "|"]
    for r in rows:
        out.append("| " + " | ".join(str(c) for c in r) + " |")
    return "\n".join(out)


def build_markdown(rows: list[dict]) -> str:
    exp = _md_table(
        ["Topic", "#Args", "#Atoms", "#Pairs", "#Acc", "Acc%",
         "Density", "Iso", "#SCC", "Cycles", "Grounded", "#Pref", "#Stable", "Semantics"],
        [[r["topic"], r["n_args"], r["n_atoms"], r["n_pairs"], r["n_acc"],
          r["acc_pct"], r["density"], r["iso"], r["n_scc"], r["cycles"],
          r["grounded"], r["n_pref"], r["n_stable"], r["semantics"]] for r in rows],
    )
    typ = _md_table(
        ["Topic", "Cross-Stance", "Rebuttal", "Undermining", "Undercutting", "Runtime(s)"],
        [[r["topic"], r["cross_ratio"], r["rebuttal"], r["undermining"],
          r["undercutting"], r["runtime"]] for r in rows],
    )
    # Topics, die nur grounded berechnen konnten — Ursache differenzieren:
    # zyklisch/dicht (echte Grenze) vs. azyklisch (vermutlich Run vor der
    # grounded-first-Reduktion → einfach neu ausführen).
    grounded_only = [r for r in rows if r["n_pref"] == "n/a"]
    note = ""
    if grounded_only:
        note = ("\n> **Hinweis:** preferred/stable nicht berechnet für: "
                f"{', '.join(r['topic'] for r in grounded_only)}.\n")
        cyclic = [r["topic"] for r in grounded_only if r["cycles"]]
        acyclic = [r["topic"] for r in grounded_only if not r["cycles"]]
        if cyclic:
            note += (f"> Davon zyklisch/dicht — preferred-Enumeration im Zeitlimit "
                     f"zu teuer (echte Grenze): {', '.join(cyclic)}.\n")
        if acyclic:
            note += (f"> Davon azyklisch — sollte mit grounded-first-Reduktion "
                     f"durchlaufen; vermutlich Run vor der Optimierung, neu "
                     f"ausführen: {', '.join(acyclic)}.\n")
    return (
        f"# UKP Cross-Topic Results ({len(rows)} Topics)\n\n"
        "## Experiment Table\n\n" + exp + "\n\n"
        "## Attack Types & Runtime\n\n" + typ + "\n" + note
    )


def main() -> None:
    runs = collect_runs()
    if not runs:
        print(f"Keine Runs in {RUNS_DIR} gefunden.")
        return
    rows = [build_row(runs[t]) for t in sorted(runs)]

    OUT_DIR.mkdir(exist_ok=True)
    md_path = OUT_DIR / "aggregate_report.md"
    md_path.write_text(build_markdown(rows), encoding="utf-8")

    csv_path = OUT_DIR / "aggregate.csv"
    fields = [k for k in rows[0] if k != "run_id"] + ["run_id"]
    with open(csv_path, "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)

    print(f"{len(rows)} Topic(s) aggregiert:")
    for r in rows:
        print(f"  {r['topic']:22} atoms={r['n_atoms']:>3} att={r['n_acc']:>3} "
              f"sem={r['semantics']:20} cycles={r['cycles']}")
    print(f"\n→ {md_path}")
    print(f"→ {csv_path}")


if __name__ == "__main__":
    main()
