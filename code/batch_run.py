"""
batch_run.py — Führt die Pipeline über alle UKP-Topics aus (Schritt 2).

Jeder Topic erzeugt einen eigenen Run-Ordner output/runs/<run_id>/ mit allen
Artefakten (run_config, arguments, calls, pair_decisions, attacks, .pl, results,
graph_stats, runtime, report). Danach baut aggregate.py die Cross-Topic-Tabelle.

Aufruf:
    python batch_run.py                          # alle 8 Topics
    python batch_run.py nuclear_energy abortion  # nur Teilmenge
"""

import sys
import time

from chat import UKP_TOPICS, run_pipeline


def main(argv: list[str]) -> None:
    topics = UKP_TOPICS
    if argv:
        wanted = set(argv)
        topics = [(f, l) for (f, l) in UKP_TOPICS if f in wanted]
        unknown = wanted - {f for f, _ in UKP_TOPICS}
        if unknown:
            print(f"[WARN] Unbekannte Topics ignoriert: {sorted(unknown)}")
    if not topics:
        print("Keine gültigen Topics. Verfügbar:",
              ", ".join(f for f, _ in UKP_TOPICS))
        return

    print(f"=== Batch-Run über {len(topics)} Topic(s) (source=ukp) ===")
    t0 = time.time()
    summary = []
    for i, (topic_file, topic_label) in enumerate(topics, 1):
        print(f"\n{'#' * 60}")
        print(f"# [{i}/{len(topics)}] {topic_label}  ({topic_file})")
        print(f"{'#' * 60}")
        ts = time.time()
        try:
            args, attacks, result = run_pipeline(
                topic_file, topic_label, "ukp", enable_logging=True
            )
            sem = "+".join(result.get("semantics", []) or [])
            summary.append((topic_file, len(args), len(attacks), sem,
                            round(time.time() - ts, 1), "ok"))
        except Exception as e:                       # noqa: BLE001
            print(f"  [FEHLER] {topic_file}: {e}")
            summary.append((topic_file, "-", "-", "-",
                            round(time.time() - ts, 1), f"ERROR: {e}"))

    print(f"\n{'=' * 60}")
    print(f"=== Batch fertig in {time.time() - t0:.0f}s ===")
    print(f"{'Topic':24} {'#Atoms':>7} {'#Att':>5} {'Semantics':20} {'Zeit':>7}  Status")
    for tf, na, nat, sem, dt, st in summary:
        print(f"{tf:24} {str(na):>7} {str(nat):>5} {sem:20} {dt:>6}s  {st}")
    print("\n→ Nächster Schritt: python aggregate.py")


if __name__ == "__main__":
    main(sys.argv[1:])
