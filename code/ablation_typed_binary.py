"""
ablation_typed_binary.py — RQ2-Ablation: typed vs. binary Attack-Prompting.

Fragestellung: Liefert das typed Prompting (rebuttal/undercutting/
undermining + Begründung) andere bzw. zuverlässigere Angriffe als reines
binäres Prompting (nur Angriff ja/nein + Richtung)?

Methodischer Kern: Jedes Topic wird einmal atomisiert. Dieselbe Atom-Menge
A' geht an beide Extraktions-Arme. Nur so misst der Vergleich den Effekt des
Prompts und nicht den der Atomisierung.

Pro Topic werden verglichen:
  * die Angriffs-Mengen (Jaccard, gerichtet roh / gerichtet final / ungerichtet),
  * die resultierenden formalen Frameworks (#grounded, #preferred, #stable).

Artefakte:
  output/ablation/<ts>_<topic>_seed<seed>/
      arguments.json              gemeinsame atomisierte A'
      typed/   ...                voller Run-Log des typed-Arms
      binary/  ...                voller Run-Log des binary-Arms
      comparison.json             Kennzahlen des Topic-Vergleichs
  output/ablation/aggregate_ablation.md / .csv   Cross-Topic-Tabelle

Aufruf:
    python ablation_typed_binary.py                      # alle 8 UKP-Topics
    python ablation_typed_binary.py nuclear_energy        # nur eines
"""

import csv
import json
import sys
import time
from datetime import datetime
from pathlib import Path

import extract
from extract import load_ukp, atomize_arguments, extract_attacks, to_prolog
from af_tool import solve_af
from run_logger import RunLogger, slugify
from chat import UKP_TOPICS

# Kanonische Config (vgl. Cross-Topic-Auswertung): balancierte 7+7 Argumente,
# Batch 10, Seed 42. Wird hier explizit gesetzt, damit der Ablations-Run
# unabhaengig von zwischenzeitlich geaenderten Modul-Defaults reproduzierbar ist.
extract.UKP_SPLIT    = "test"
extract.UKP_LIMIT    = 15
extract.UKP_BALANCED = True
extract.UKP_SEED     = 42
extract.BATCH_SIZE   = 10

ABLATION_DIR = Path(__file__).parent / "output" / "ablation"



# Kantenmengen und Vergleichsmetriken

def _directed_edges(attacks: list[dict], include_symmetric: bool = True) -> set:
    """Gerichtete Kanten (attacker, target). include_symmetric=False blendet die
    durch Rebuttal-Symmetrisierung ergaenzten Gegenkanten aus (Rohkanten)."""
    out = set()
    for atk in attacks:
        if not include_symmetric and atk.get("outcome") == "symmetric-rebuttal":
            continue
        out.add((atk["attacker"], atk["target"]))
    return out


def _undirected_pairs(attacks: list[dict]) -> set:
    """Ungerichtete Paare {a, b} aus den Rohkanten: 'wurde dieses Paar ueberhaupt
    als Konflikt markiert', unabhaengig von der Richtung."""
    return {
        frozenset((atk["attacker"], atk["target"]))
        for atk in attacks
        if atk.get("outcome") != "symmetric-rebuttal"
    }


def _jaccard(s1: set, s2: set) -> float:
    if not s1 and not s2:
        return 1.0
    return len(s1 & s2) / len(s1 | s2)


def _ext_counts(result: dict) -> dict:
    """Zieht grounded-Groesse und #preferred/#stable aus einem solve_af-Ergebnis."""
    pref = result.get("preferred")
    stab = result.get("stable")
    return {
        "grounded": len(result.get("grounded", []) or []),
        "n_preferred": len(pref) if isinstance(pref, list) else None,
        "n_stable": len(stab) if isinstance(stab, list) else None,
        "semantics": result.get("semantics", []),
    }


# Ein Arm (typed oder binary) auf gegebener Atom-Menge

def _run_arm(args: list[dict], topic_label: str, topic_file: str,
             group_dir: Path, typed: bool) -> dict:
    """Fuehrt einen Extraktions-Arm aus, loggt ihn als vollen Run und loest das AF.
    Rueckgabe: dict mit attacks, solve-result und abgeleiteten Kennzahlen."""
    variant  = "typed" if typed else "binary"
    arm_dir  = group_dir / variant
    logger   = RunLogger(run_id=f"{group_dir.name}_{variant}", run_dir=arm_dir)

    config = {
        "experiment":  "ablation_typed_binary",
        "variant":     variant,
        "typed":       typed,
        "topic_file":  topic_file,
        "topic_label": topic_label,
        "source":      "ukp",
        "seed":        extract.UKP_SEED,
        "limit":       extract.UKP_LIMIT,
        "batch_size":  extract.BATCH_SIZE,
        "conf_accept": extract.CONFIDENCE_ACCEPT,
        "conf_verify": extract.CONFIDENCE_VERIFY,
        "symmetrize_rebuttals": extract.SYMMETRIZE_REBUTTALS and typed,
        "n_atoms":     len(args),
    }
    logger.write_json("run_config.json", config)
    logger.write_json("arguments.json", args)

    extract.set_run_logger(logger)
    try:
        t0 = time.time()
        attacks = extract_attacks(args, topic=topic_label, typed=typed)
        extract_s = round(time.time() - t0, 3)
    finally:
        extract.set_run_logger(None)

    prolog_code = to_prolog(args, attacks, topic_label)
    logger.write_text(f"af_{slugify(topic_file)}_{variant}.pl", prolog_code)

    t0 = time.time()
    result = solve_af(args, attacks, topic=topic_label)
    solve_s = round(time.time() - t0, 3)

    logger.write_json("results.json", result)
    logger.write_json("attacks.json", attacks)

    return {
        "attacks": attacks,
        "result": result,
        "runtime": {"extract_s": extract_s, "solve_s": solve_s},
        "edges_final": _directed_edges(attacks, include_symmetric=True),
        "edges_raw":   _directed_edges(attacks, include_symmetric=False),
        "pairs":       _undirected_pairs(attacks),
    }


def _arm_is_done(arm_dir: Path) -> bool:
    """True, wenn ein Arm bereits vollstaendig gelaufen ist (Resume-Erkennung)."""
    return (arm_dir / "attacks.json").exists() and (arm_dir / "results.json").exists()


def _load_arm(arm_dir: Path) -> dict:
    """Laedt einen bereits gelaufenen Arm aus seinen Artefakten (kein API-Call)."""
    attacks = json.loads((arm_dir / "attacks.json").read_text(encoding="utf-8"))
    result  = json.loads((arm_dir / "results.json").read_text(encoding="utf-8"))
    return {
        "attacks": attacks,
        "result":  result,
        "runtime": {"extract_s": None, "solve_s": None},  # nicht erneut gemessen
        "edges_final": _directed_edges(attacks, include_symmetric=True),
        "edges_raw":   _directed_edges(attacks, include_symmetric=False),
        "pairs":       _undirected_pairs(attacks),
    }


def _arm(args: list[dict], topic_label: str, topic_file: str,
         group_dir: Path, typed: bool, resume: bool) -> dict:
    """Laedt den Arm, falls er (bei resume=True) schon fertig ist, sonst laeuft er."""
    variant = "typed" if typed else "binary"
    arm_dir = group_dir / variant
    if resume and _arm_is_done(arm_dir):
        print(f"  >> {variant}-Arm: bereits vorhanden, wird wiederverwendet")
        return _load_arm(arm_dir)
    print(f"  >> {variant}-Arm ...")
    arm = _run_arm(args, topic_label, topic_file, group_dir, typed=typed)
    print(f"     {len(arm['edges_final'])} Kanten (final), "
          f"{len(arm['edges_raw'])} roh")
    return arm


def _compare_and_write(group_dir: Path, topic_file: str, topic_label: str,
                       atoms: list[dict], typed: dict, binary: dict) -> dict:
    """Berechnet die Vergleichskennzahlen und schreibt comparison.json."""
    t_raw, b_raw   = typed["edges_raw"], binary["edges_raw"]
    t_fin, b_fin   = typed["edges_final"], binary["edges_final"]
    t_pair, b_pair = typed["pairs"], binary["pairs"]

    comparison = {
        "topic_file":  topic_file,
        "topic_label": topic_label,
        "n_atoms":     len(atoms),
        "typed": {
            "n_edges_raw":   len(t_raw),
            "n_edges_final": len(t_fin),
            **_ext_counts(typed["result"]),
            "runtime": typed["runtime"],
        },
        "binary": {
            "n_edges_raw":   len(b_raw),
            "n_edges_final": len(b_fin),
            **_ext_counts(binary["result"]),
            "runtime": binary["runtime"],
        },
        "jaccard_directed_raw":   round(_jaccard(t_raw, b_raw), 4),
        "jaccard_directed_final": round(_jaccard(t_fin, b_fin), 4),
        "jaccard_undirected":     round(_jaccard(t_pair, b_pair), 4),
        "directed_raw": {
            "intersection": len(t_raw & b_raw),
            "typed_only":   sorted(f"{a}->{t}" for a, t in (t_raw - b_raw)),
            "binary_only":  sorted(f"{a}->{t}" for a, t in (b_raw - t_raw)),
        },
        "undirected": {
            "intersection": len(t_pair & b_pair),
            "typed_only":   len(t_pair - b_pair),
            "binary_only":  len(b_pair - t_pair),
        },
    }
    (group_dir / "comparison.json").write_text(
        json.dumps(comparison, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"  Jaccard (gerichtet, roh) = {comparison['jaccard_directed_raw']} | "
          f"ungerichtet = {comparison['jaccard_undirected']}")
    return comparison


def resume_topic(group_dir: Path) -> dict:
    """Vervollstaendigt einen unterbrochenen Topic-Lauf: nutzt die geteilten Atome
    und fertige Arme, laeuft nur die fehlenden Arme nach, vergleicht."""
    args_path = group_dir / "arguments.json"
    if not args_path.exists():
        raise FileNotFoundError(f"Keine arguments.json in {group_dir} — nichts zum Fortsetzen.")
    atoms = json.loads(args_path.read_text(encoding="utf-8"))
    # topic_file aus dem Gruppennamen ableiten: <ts>_<topic>_seed<seed>
    cfg = group_dir / "typed" / "run_config.json"
    if cfg.exists():
        c = json.loads(cfg.read_text(encoding="utf-8"))
        topic_file, topic_label = c["topic_file"], c["topic_label"]
    else:
        topic_file = group_dir.name.split("_seed")[0].split("_", 2)[-1]
        topic_label = topic_file.replace("_", " ").title()
    print(f"\n{'#' * 64}\n# Resume: {topic_label} ({group_dir.name})\n{'#' * 64}")
    print(f"  geteilte A' (Atome): {len(atoms)}")
    typed  = _arm(atoms, topic_label, topic_file, group_dir, typed=True,  resume=True)
    binary = _arm(atoms, topic_label, topic_file, group_dir, typed=False, resume=True)
    return _compare_and_write(group_dir, topic_file, topic_label, atoms, typed, binary)


# Ein Topic: einmal atomisieren, beide Arme, vergleichen

def run_topic(topic_file: str, topic_label: str, ts: str,
              resume: bool = False) -> dict:
    print(f"\n{'#' * 64}\n# Ablation: {topic_label} ({topic_file})\n{'#' * 64}")

    group_dir = ABLATION_DIR / f"{ts}_{slugify(topic_file)}_seed{extract.UKP_SEED}"
    group_dir.mkdir(parents=True, exist_ok=True)

    # --- einmal laden + atomisieren, A' an beide Arme -----------------------
    # Bei resume=True die bereits geteilten Atome wiederverwenden statt neu zu
    # atomisieren (spart einen LLM-Pass und haelt A' identisch).
    args_path = group_dir / "arguments.json"
    if resume and args_path.exists():
        atoms = json.loads(args_path.read_text(encoding="utf-8"))
        print(f"  A' wiederverwendet: {len(atoms)} Atome")
    else:
        print("  Lade UKP-Argumente und atomisiere (einmalig, geteilt) ...")
        raw_args = load_ukp(topic_file, split=extract.UKP_SPLIT,
                            limit=extract.UKP_LIMIT, balanced=extract.UKP_BALANCED,
                            seed=extract.UKP_SEED)
        atoms = atomize_arguments(raw_args, topic_label)
        print(f"  {len(raw_args)} Argumente -> {len(atoms)} Atome (A')")
        args_path.write_text(
            json.dumps(atoms, ensure_ascii=False, indent=2), encoding="utf-8")

    # --- beide Arme (bei resume fertige Arme wiederverwenden) ---------------
    typed  = _arm(atoms, topic_label, topic_file, group_dir, typed=True,  resume=resume)
    binary = _arm(atoms, topic_label, topic_file, group_dir, typed=False, resume=resume)

    return _compare_and_write(group_dir, topic_file, topic_label, atoms, typed, binary)


# Cross-Topic-Aggregation

def write_aggregate(rows: list[dict]) -> None:
    ABLATION_DIR.mkdir(parents=True, exist_ok=True)
    md = ABLATION_DIR / "aggregate_ablation.md"
    cv = ABLATION_DIR / "aggregate_ablation.csv"

    header = ["Topic", "Atoms",
              "Edges(t)", "Edges(b)", "J-raw", "J-undir",
              "Pref(t)", "Pref(b)", "Stab(t)", "Stab(b)"]
    lines = ["# RQ2 Ablation: Typed vs. Binary Prompting\n",
             "Cross-topic comparison on identical atom sets per topic. "
             "``J-raw`` is the Jaccard similarity of the directed raw attack "
             "edges, ``J-undir`` the Jaccard of the undirected conflict pairs.\n",
             "| " + " | ".join(header) + " |",
             "|" + "|".join(["---"] * len(header)) + "|"]
    for r in rows:
        t, b = r["typed"], r["binary"]
        lines.append("| " + " | ".join(str(x) for x in [
            r["topic_label"], r["n_atoms"],
            t["n_edges_final"], b["n_edges_final"],
            r["jaccard_directed_raw"], r["jaccard_undirected"],
            t["n_preferred"], b["n_preferred"],
            t["n_stable"], b["n_stable"],
        ]) + " |")
    md.write_text("\n".join(lines) + "\n", encoding="utf-8")

    with open(cv, "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(header)
        for r in rows:
            t, b = r["typed"], r["binary"]
            w.writerow([r["topic_label"], r["n_atoms"],
                        t["n_edges_final"], b["n_edges_final"],
                        r["jaccard_directed_raw"], r["jaccard_undirected"],
                        t["n_preferred"], b["n_preferred"],
                        t["n_stable"], b["n_stable"]])
    print(f"\n-> {md}\n-> {cv}")


def _resume_main(arg: str) -> None:
    """--resume <group_dir | name>: unterbrochenen Topic-Lauf vervollstaendigen."""
    p = Path(arg)
    group_dir = p if p.is_absolute() or p.exists() else (ABLATION_DIR / arg)
    if not group_dir.exists():
        print(f"Gruppen-Ordner nicht gefunden: {group_dir}")
        return
    row = resume_topic(group_dir)
    write_aggregate([row])
    print("\n=== Resume fertig ===")


def main(argv: list[str]) -> None:
    if argv and argv[0] == "--resume":
        if len(argv) < 2:
            print("Aufruf: python ablation_typed_binary.py --resume <group_dir>")
            return
        _resume_main(argv[1])
        return

    topics = UKP_TOPICS
    if argv:
        wanted = set(argv)
        topics = [(f, l) for (f, l) in UKP_TOPICS if f in wanted]
        unknown = wanted - {f for f, _ in UKP_TOPICS}
        if unknown:
            print(f"[WARN] Unbekannte Topics ignoriert: {sorted(unknown)}")
    if not topics:
        print("Keine gueltigen Topics. Verfuegbar:",
              ", ".join(f for f, _ in UKP_TOPICS))
        return

    ts = datetime.now().strftime("%Y-%m-%d_%H%M")
    print(f"=== RQ2-Ablation typed vs. binary ueber {len(topics)} Topic(s) ===")
    rows = []
    for i, (tf, tl) in enumerate(topics, 1):
        print(f"\n[{i}/{len(topics)}]")
        try:
            rows.append(run_topic(tf, tl, ts))
        except Exception as e:  # noqa: BLE001
            print(f"  [FEHLER] {tf}: {e}")

    if rows:
        write_aggregate(rows)
    print("\n=== Ablation fertig ===")


if __name__ == "__main__":
    main(sys.argv[1:])
