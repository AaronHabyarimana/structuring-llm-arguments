"""
eval_gold.py — RQ3: Extraktion gegen den Gold-Standard auswerten.

Vergleicht die Attack-Kanten eines Ablations-Laufs (typed- und/oder binary-Arm)
mit den von Hand annotierten Gold-Labels und berechnet Precision/Recall/F1
gerichtet (final und roh, d.h. ohne symmetrisierte Rebuttal-Gegenkanten) sowie
ungerichtet (Konfliktpaar erkannt ja/nein). Zusaetzlich werden alle falsch
positiven und falsch negativen Kanten gelistet (Fehleranalyse fuer die Thesis).

Voraussetzung: Der Lauf verwendet dieselbe eingefrorene Atom-Menge A', aus der
das Gold-Template erzeugt wurde (gold_template.py), sonst passen die Paare nicht.
Das Skript prueft das und bricht bei Abweichungen ab.

Aufruf:
    python eval_gold.py --run output/ablation/2026-07-02_1037_nuclear_energy_seed42
    python eval_gold.py --run <group_dir> --gold output/gold/nuclear_energy_seed42/gold_template.csv
"""

import argparse
import contextlib
import csv
import io
import json
import sys
from pathlib import Path

CODE_DIR = Path(__file__).parent
DEFAULT_GOLD = CODE_DIR / "output" / "gold" / "nuclear_energy_seed42" / "gold_template.csv"

VALID_LABELS = {"none", "a_attacks_b", "b_attacks_a", "both"}


def load_gold(csv_path: Path) -> tuple[set, set, set]:
    """Liest die Gold-CSV. Rueckgabe: (gerichtete Kanten, Konfliktpaare, Paar-Universum)."""
    rows = list(csv.DictReader(open(csv_path, encoding="utf-8-sig")))
    directed, pairs, universe = set(), set(), set()
    for r in rows:
        a, b, lab = r["a_id"], r["b_id"], (r["label"] or "").strip()
        universe.add(frozenset((a, b)))
        if lab not in VALID_LABELS:
            raise ValueError(f"Ungueltiges/fehlendes Label in {r['pair_id']}: '{lab}' "
                             f"— erst mit gold_template.py --validate pruefen.")
        if lab == "a_attacks_b":
            directed.add((a, b))
        elif lab == "b_attacks_a":
            directed.add((b, a))
        elif lab == "both":
            directed.update([(a, b), (b, a)])
        if lab != "none":
            pairs.add(frozenset((a, b)))
    return directed, pairs, universe


def load_arm(arm_dir: Path) -> dict:
    """Laedt attacks.json eines Arms und leitet Kantenmengen ab."""
    attacks = json.loads((arm_dir / "attacks.json").read_text(encoding="utf-8"))
    final = {(x["attacker"], x["target"]) for x in attacks}
    raw = {(x["attacker"], x["target"]) for x in attacks
           if x.get("outcome") != "symmetric-rebuttal"}
    pairs = {frozenset((x["attacker"], x["target"])) for x in attacks
             if x.get("outcome") != "symmetric-rebuttal"}
    return {"attacks": attacks, "final": final, "raw": raw, "pairs": pairs}


def prf(pred: set, gold: set) -> tuple[int, int, float, float, float]:
    tp = len(pred & gold)
    p = tp / len(pred) if pred else 0.0
    r = tp / len(gold) if gold else 0.0
    f = 2 * p * r / (p + r) if p + r else 0.0
    return len(pred), tp, p, r, f


def eval_arm(name: str, arm: dict, gold_dir: set, gold_pairs: set, universe: set) -> None:
    outside = {frozenset(e) for e in arm["final"]} - universe
    if outside:
        print(f"  [!] {len(outside)} Kanten liegen ausserhalb der Gold-Paarmenge — "
              f"laeuft der Vergleich auf dem richtigen (eingefrorenen) A'?")
    print(f"\n===== {name} =====")
    print(f"  {'Ebene':22s} {'n':>4s} {'TP':>4s} {'P':>7s} {'R':>7s} {'F1':>7s}")
    for label, pred, gold in (("gerichtet final", arm["final"], gold_dir),
                              ("gerichtet roh", arm["raw"], gold_dir),
                              ("ungerichtet (Paare)", arm["pairs"], gold_pairs)):
        n, tp, p, r, f = prf(pred, gold)
        print(f"  {label:22s} {n:4d} {tp:4d} {p:7.3f} {r:7.3f} {f:7.3f}")

    by_edge = {(x["attacker"], x["target"]): x for x in arm["attacks"]}
    fp = sorted(arm["final"] - gold_dir)
    fn = sorted(gold_dir - arm["final"])
    print(f"  Falsch positiv ({len(fp)}):")
    for e in fp:
        x = by_edge[e]
        print(f"    {e[0]:9s}-> {e[1]:9s} conf={x['confidence']:3d} "
              f"out={x.get('outcome', '?')} type={x.get('type')}")
    print(f"  Falsch negativ ({len(fn)}):")
    for e in fn:
        print(f"    {e[0]:9s}-> {e[1]}")


def main() -> None:
    ap = argparse.ArgumentParser(description="Extraktion gegen Gold-Standard auswerten (RQ3)")
    ap.add_argument("--run", type=Path, required=True,
                    help="Gruppenordner eines Ablations-Laufs (enthaelt typed/ und/oder binary/)")
    ap.add_argument("--gold", type=Path, default=DEFAULT_GOLD,
                    help=f"Gold-CSV (Default: {DEFAULT_GOLD.relative_to(CODE_DIR)})")
    args = ap.parse_args()

    gold_dir, gold_pairs, universe = load_gold(args.gold)

    # Ausgabe auf Konsole UND in <run>/gold_eval.txt festhalten (fuer die Thesis).
    buf = io.StringIO()

    class _Tee(io.TextIOBase):
        def write(self, s):
            sys.__stdout__.write(s)
            buf.write(s)
            return len(s)

        def flush(self):
            sys.__stdout__.flush()

    with contextlib.redirect_stdout(_Tee()):
        print(f"Gold: {args.gold}")
        print(f"  {len(gold_dir)} gerichtete Kanten, {len(gold_pairs)} Konfliktpaare, "
              f"{len(universe)} Paare gesamt")

        arms = [d for d in ("typed", "binary") if (args.run / d / "attacks.json").exists()]
        if arms:
            for arm in arms:
                eval_arm(arm, load_arm(args.run / arm), gold_dir, gold_pairs, universe)
        elif (args.run / "attacks.json").exists():
            # auch ein einzelner Run-Ordner mit attacks.json direkt wird akzeptiert
            eval_arm(args.run.name, load_arm(args.run), gold_dir, gold_pairs, universe)
        else:
            raise FileNotFoundError(f"Keine attacks.json unter {args.run} gefunden.")

    out = args.run / "gold_eval.txt"
    out.write_text(buf.getvalue(), encoding="utf-8")
    print(f"\n-> {out}")


if __name__ == "__main__":
    main()
