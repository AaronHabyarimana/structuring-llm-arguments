"""
gold_template.py — Annotations-Template und Validierung fuer den Gold-Standard (RQ3).

Erzeugt aus einem EINGEFRORENEN A' (arguments.json eines Ablations-/Pipeline-Laufs)
die exakt gleiche Paarmenge, die extract_attacks bewertet, als CSV mit leerer
Label-Spalte. So ist per Konstruktion garantiert, dass Gold-Paare == bewertete
Paare (siehe verifizierte _base_id-Regel).

Die Paarregel wird NICHT dupliziert, sondern via `_base_id` aus extract importiert.

Aufruf:
    # Template erzeugen (Default: eingefrorenes Nuclear-A' vom 2026-07-02-Batch)
    python gold_template.py

    # anderes A' angeben
    python gold_template.py --args output/ablation/<group>/arguments.json

    # ausgefuellte CSV pruefen (gueltige Labels, Vollstaendigkeit, Verteilung)
    python gold_template.py --validate output/gold/nuclear_energy_seed42/gold_template.csv

Label-Werte (Spalte `label`, von Hand auszufuellen):
    none          kein Angriff zwischen A und B
    a_attacks_b   A greift B an   (a_id -> b_id)
    b_attacks_a   B greift A an   (b_id -> a_id)
    both          beidseitiger Angriff (zwei gerichtete Kanten)
"""

import argparse
import csv
import json
from collections import Counter
from pathlib import Path

from extract import _base_id  # dieselbe Regel wie in extract_attacks

VALID_LABELS = {"none", "a_attacks_b", "b_attacks_a", "both"}

CODE_DIR = Path(__file__).parent
DEFAULT_ARGS = (CODE_DIR / "output" / "ablation" /
                "2026-07-02_1037_nuclear_energy_seed42" / "arguments.json")

FIELDS = ["pair_id", "a_id", "a_stance", "a_text",
          "b_id", "b_stance", "b_text", "label", "note"]


def enumerate_pairs(atoms: list[dict]) -> list[tuple[dict, dict]]:
    """Exakt die Paarmenge aus extract_attacks: i<j, ohne Atome desselben
    Ursprungsarguments (_base_id-Ausschluss)."""
    return [
        (a, b)
        for i, a in enumerate(atoms)
        for j, b in enumerate(atoms)
        if i < j and _base_id(a["id"]) != _base_id(b["id"])
    ]


def build_template(args_path: Path, out_path: Path) -> None:
    atoms = json.loads(args_path.read_text(encoding="utf-8"))
    pairs = enumerate_pairs(atoms)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    # utf-8-sig, damit Excel Sonderzeichen korrekt anzeigt.
    with open(out_path, "w", newline="", encoding="utf-8-sig") as f:
        w = csv.DictWriter(f, fieldnames=FIELDS)
        w.writeheader()
        for a, b in pairs:
            w.writerow({
                "pair_id": f"{a['id']}__{b['id']}",
                "a_id": a["id"], "a_stance": a["stance"], "a_text": a["text"],
                "b_id": b["id"], "b_stance": b["stance"], "b_text": b["text"],
                "label": "", "note": "",
            })

    print(f"  A'         : {args_path}  ({len(atoms)} Atome)")
    print(f"  Paare      : {len(pairs)}")
    print(f"  Template   : {out_path}")
    print(f"\n  Label-Werte: {', '.join(sorted(VALID_LABELS))}")
    print("  A greift B = a_attacks_b (a_id -> b_id), B greift A = b_attacks_a.")


def validate(csv_path: Path, args_path: Path) -> None:
    atoms = json.loads(args_path.read_text(encoding="utf-8"))
    expected = {f"{a['id']}__{b['id']}" for a, b in enumerate_pairs(atoms)}

    rows = list(csv.DictReader(open(csv_path, encoding="utf-8-sig")))
    seen = {r["pair_id"] for r in rows}
    missing = expected - seen
    extra = seen - expected

    dist = Counter()
    bad_label, empty = [], []
    for r in rows:
        lab = (r.get("label") or "").strip()
        if not lab:
            empty.append(r["pair_id"])
        elif lab not in VALID_LABELS:
            bad_label.append((r["pair_id"], lab))
        else:
            dist[lab] += 1

    print(f"  CSV         : {csv_path}")
    print(f"  Zeilen      : {len(rows)}  (erwartete Paare: {len(expected)})")
    print(f"  fehlend     : {len(missing)}   ueberzaehlig: {len(extra)}")
    print(f"  leer        : {len(empty)}   ungueltiges Label: {len(bad_label)}")
    print(f"  Verteilung  : {dict(dist)}")
    n_edges = dist['a_attacks_b'] + dist['b_attacks_a'] + 2 * dist['both']
    print(f"  Gold-Kanten (gerichtet): {n_edges}")

    problems = missing or extra or bad_label or empty
    if problems:
        if missing:    print(f"    [!] fehlende Paare (Auszug): {sorted(missing)[:5]}")
        if extra:      print(f"    [!] unbekannte Paare (Auszug): {sorted(extra)[:5]}")
        if bad_label:  print(f"    [!] ungueltige Labels (Auszug): {bad_label[:5]}")
        if empty:      print(f"    [!] noch nicht gelabelt: {len(empty)} Zeilen")
        print("\n  => NOCH NICHT VOLLSTAENDIG/GUELTIG")
    else:
        print("\n  => OK: vollstaendig und alle Labels gueltig")


def main() -> None:
    ap = argparse.ArgumentParser(description="Gold-Annotations-Template (RQ3)")
    ap.add_argument("--args", type=Path, default=DEFAULT_ARGS,
                    help="Pfad zum eingefrorenen arguments.json (A')")
    ap.add_argument("--out", type=Path, default=None,
                    help="Ziel-CSV (Default: output/gold/<topic>_seed<seed>/gold_template.csv)")
    ap.add_argument("--validate", type=Path, default=None,
                    help="Ausgefuellte CSV pruefen statt Template erzeugen")
    args = ap.parse_args()

    if args.validate:
        validate(args.validate, args.args)
        return

    out = args.out
    if out is None:
        # Zielname aus dem Gruppenordner ableiten: <ts>_<topic>_seed<seed>
        group = args.args.parent.name
        stem = group.split("_", 2)[-1] if "_" in group else group  # <topic>_seed<seed>
        out = CODE_DIR / "output" / "gold" / stem / "gold_template.csv"
    build_template(args.args, out)


if __name__ == "__main__":
    main()
