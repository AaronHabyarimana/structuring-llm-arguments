"""
make_thesis_tables.py — Konsistente Zahlen fuer die Thesis aus dem kanonischen
Ablations-Batch (output/ablation/2026-07-02_1037_*_seed42) und dem kanonischen
Gold-Lauf (output/ablation/2026-07-05_r3_nuclear_energy_seed42).

Alle Tabellen der Evaluation (Korpus, Cross-Topic, Typ-Verteilung, Ablation
inkl. "typed raw"-Arm, Gold-Vergleich) werden aus DENSELBEN Artefakten
berechnet, damit keine Zahlen aus verschiedenen Prompt-Versionen gemischt
werden.

Der "typed raw"-Arm (typed-Kanten OHNE die symmetrisierten Rebuttal-
Gegenkanten) wird hier per solve_af nachgerechnet — keine API-Calls.

Aufruf:  python make_thesis_tables.py
Output:  output/thesis_tables.md            (Markdown-Uebersicht)
         output/thesis_tables/tab-*.tex     (LaTeX-Fragmente; die Thesis bindet
                                             sie per \\input ein, Caption/Label
                                             bleiben in den Kapiteldateien)
"""

import csv
import json
import re
from pathlib import Path

from af_tool import solve_af
from eval_gold import load_gold, load_arm, prf

CODE = Path(__file__).parent
BATCH = sorted((CODE / "output" / "ablation").glob("2026-07-02_1037_*_seed42"))
GOLD_CSV = CODE / "output" / "gold" / "nuclear_energy_seed42" / "gold_template.csv"
GOLD_RUN = CODE / "output" / "ablation" / "2026-07-05_r3_nuclear_energy_seed42"
UKP = CODE.parent / "UKP_sentential_argument_mining" / "data"
TEX_DIR = CODE / "output" / "thesis_tables"

TEX_HEADER = ("% Auto-generiert von code/make_thesis_tables.py — nicht von Hand"
              " editieren.\n")

LABELS = {
    "abortion": "Abortion", "cloning": "Cloning", "death_penalty": "Death Penalty",
    "gun_control": "Gun Control", "marijuana_legalization": "Marijuana Legal.",
    "minimum_wage": "Minimum Wage", "nuclear_energy": "Nuclear Energy",
    "school_uniforms": "School Uniforms",
}
ORDER = ["abortion", "cloning", "death_penalty", "gun_control",
         "marijuana_legalization", "minimum_wage", "nuclear_energy",
         "school_uniforms"]


def base_id(id_: str) -> str:
    return re.sub(r"(?<=\d)[a-z]+$", "", id_)


def n_pairs(atoms):
    return sum(
        1 for i, a in enumerate(atoms) for j, b in enumerate(atoms)
        if i < j and base_id(a["id"]) != base_id(b["id"])
    )


def has_cycle(nodes, edges):
    adj = {n: [] for n in nodes}
    for a, t in edges:
        adj.setdefault(a, []).append(t)
    WHITE, GRAY, BLACK = 0, 1, 2
    color = {n: WHITE for n in adj}
    def dfs(u):
        color[u] = GRAY
        for v in adj.get(u, []):
            if color.get(v) == GRAY:
                return True
            if color.get(v) == WHITE and dfs(v):
                return True
        color[u] = BLACK
        return False
    return any(color[n] == WHITE and dfs(n) for n in list(adj))


def ukp_counts(topic):
    pro = con = 0
    with open(UKP / f"{topic}.tsv", encoding="utf-8", newline="") as f:
        for row in csv.DictReader(f, delimiter="\t", quoting=csv.QUOTE_NONE):
            if row["set"] != "test":
                continue
            if row["annotation"] == "Argument_for":
                pro += 1
            elif row["annotation"] == "Argument_against":
                con += 1
    return pro, con


def load_group(d: Path):
    atoms = json.loads((d / "arguments.json").read_text(encoding="utf-8"))
    comp = json.loads((d / "comparison.json").read_text(encoding="utf-8"))
    out = {"atoms": atoms, "comparison": comp}
    for arm in ("typed", "binary"):
        out[arm] = {
            "attacks": json.loads((d / arm / "attacks.json").read_text(encoding="utf-8")),
            "results": json.loads((d / arm / "results.json").read_text(encoding="utf-8")),
        }
    return out


def fmt_exts(res):
    p, s = res.get("preferred"), res.get("stable")
    return (len(p) if isinstance(p, list) else "-",
            len(s) if isinstance(s, list) else "-")


def topic_stats(d: Path) -> dict:
    """Alle Kennzahlen eines Batch-Topics fuer Markdown- und LaTeX-Ausgabe."""
    g = load_group(d)
    atoms, comp = g["atoms"], g["comparison"]
    atks = g["typed"]["attacks"]
    res = g["typed"]["results"]
    nodes = [a["id"] for a in atoms]
    edges = [(a["attacker"], a["target"]) for a in atks]
    incident = {n for e in edges for n in e}
    stance = {a["id"]: a["stance"] for a in atoms}
    raw = [a for a in atks if a.get("outcome") != "symmetric-rebuttal"]
    res_raw = solve_af(atoms, raw, topic=d.name)
    b_atks = g["binary"]["attacks"]
    npref, nstab = fmt_exts(res)
    pr_r, st_r = fmt_exts(res_raw)
    pr_b, st_b = fmt_exts(g["binary"]["results"])
    rt = comp["typed"]["runtime"].get("extract_s")
    dr = comp["directed_raw"]
    return {
        "comparison": comp,
        "n_atoms": len(atoms),
        "pairs": n_pairs(atoms),
        "acc": len(atks),
        "cyc": "yes" if has_cycle(nodes, edges) else "no",
        "iso": sum(1 for n in nodes if n not in incident),
        "grounded": len(res.get("grounded", [])),
        "u": res.get("u_size", "-"),
        "npref": npref, "nstab": nstab,
        "reb": sum(1 for a in atks if a["type"] == "rebuttal"),
        "und": sum(1 for a in atks if a["type"] == "undermining"),
        "cut": sum(1 for a in atks if a["type"] == "undercutting"),
        "sym": sum(1 for a in atks if a.get("outcome") == "symmetric-rebuttal"),
        "ver": sum(1 for a in atks if a.get("outcome") == "verify-accept"),
        "extract_s": f"{rt:.0f}" if isinstance(rt, (int, float)) else "-",
        "raw_edges": len(raw),
        "b_edges": len(b_atks),
        "j_raw": comp["jaccard_directed_raw"],
        "j_undir": comp["jaccard_undirected"],
        "inter": dr["intersection"],
        "t_only": len(dr["typed_only"]),
        "b_only": len(dr["binary_only"]),
        "pr_raw": pr_r, "st_raw": st_r,
        "pr_b": pr_b, "st_b": st_b,
        "grnd_raw": len(res_raw.get("grounded", [])),
        "grnd_b": len(g["binary"]["results"].get("grounded", [])),
        "same_t": sum(1 for a in atks if stance[a["attacker"]] == stance[a["target"]]),
        "same_b": sum(1 for a in b_atks if stance[a["attacker"]] == stance[a["target"]]),
    }


def gold_rows() -> list[tuple]:
    """(Arm, Ebene, n, TP, P, R, F1) des kanonischen Gold-Laufs (r3)."""
    gold_dir, gold_pairs, _ = load_gold(GOLD_CSV)
    typed = load_arm(GOLD_RUN / "typed")
    binary = load_arm(GOLD_RUN / "binary")
    return [
        ("typed",  "directed final",   *prf(typed["final"],  gold_dir)),
        ("",       "directed raw",     *prf(typed["raw"],    gold_dir)),
        ("",       "undirected pairs", *prf(typed["pairs"],  gold_pairs)),
        ("binary", "directed",         *prf(binary["final"], gold_dir)),
        ("",       "undirected pairs", *prf(binary["pairs"], gold_pairs)),
    ]


def write_tex(name: str, lines: list[str]) -> None:
    TEX_DIR.mkdir(parents=True, exist_ok=True)
    out = TEX_DIR / name
    out.write_text(TEX_HEADER + "\n".join(lines) + "\n", encoding="utf-8")
    print(f"-> {out}")


def write_latex(corpus: list[tuple], stats: dict) -> None:
    """Schreibt die LaTeX-Fragmente. Nur der tabular-Block, Caption und Label
    stehen in den Kapiteldateien der Thesis."""

    # ---- tab-corpus: UKP test split --------------------------------------
    lines = [r"\begin{tabular}{lrrr}", r"  \toprule",
             r"  Topic & Pro & Con & Total \\", r"  \midrule"]
    for label, p, c in corpus:
        lines.append(f"  {label:17s} & {p} & {c} & {p + c} \\\\")
    lines += [r"  \bottomrule", r"\end{tabular}"]
    write_tex("tab-corpus.tex", lines)

    # ---- tab-crosstopic: Kennzahlen des typed-Arms -----------------------
    lines = [r"\begin{tabular}{lrrrrrrrrr}", r"  \toprule",
             r"  Topic & Atoms & Pairs & Acc & Acc\% & Iso & Grnd & $|U|$ & \#Pr & \#St \\",
             r"  \midrule"]
    for t in ORDER:
        s = stats[t]
        lines.append(
            f"  {LABELS[t]:17s} & {s['n_atoms']} & {s['pairs']} & {s['acc']} & "
            f"{100 * s['acc'] / s['pairs']:.1f} & {s['iso']} & {s['grounded']} & "
            f"{s['u']} & {s['npref']} & {s['nstab']} \\\\")
    lines += [r"  \bottomrule", r"\end{tabular}"]
    write_tex("tab-crosstopic.tex", lines)

    # ---- tab-types: Typ-Verteilung + Extraktionszeit ---------------------
    lines = [r"\begin{tabular}{lrrrrrr}", r"  \toprule",
             r"  Topic & Reb & Und & Cut & Sym & Ver & Extract (s) \\",
             r"  \midrule"]
    for t in ORDER:
        s = stats[t]
        lines.append(
            f"  {LABELS[t]:17s} & {s['reb']} & {s['und']} & {s['cut']} & "
            f"{s['sym']} & {s['ver']} & {s['extract_s']} \\\\")
    lines += [r"  \bottomrule", r"\end{tabular}"]
    write_tex("tab-types.tex", lines)

    # ---- tab-ablation: typed / typed-raw / binary ------------------------
    lines = [
        r"\begin{tabular}{lrrrrrrrrrr}",
        r"  \toprule",
        r"  & \multicolumn{3}{c}{$|E|$} & \multicolumn{2}{c}{$J$}",
        r"  & \multicolumn{3}{c}{\#Pr} & \multicolumn{2}{c}{Same-st.} \\",
        r"  \cmidrule(lr){2-4}\cmidrule(lr){5-6}\cmidrule(lr){7-9}\cmidrule(lr){10-11}",
        r"  Topic & typ. & raw & bin. & dir. & undir. & typ. & raw & bin. & typ. & bin. \\",
        r"  \midrule",
    ]
    for t in ORDER:
        s = stats[t]
        lines.append(
            f"  {LABELS[t]:17s} & {s['acc']} & {s['raw_edges']} & {s['b_edges']} & "
            f"{s['j_raw']:.2f} & {s['j_undir']:.2f} & "
            f"{s['npref']} & {s['pr_raw']} & {s['pr_b']} & "
            f"{s['same_t']} & {s['same_b']} \\\\")
    lines += [r"  \bottomrule", r"\end{tabular}"]
    write_tex("tab-ablation.tex", lines)

    # ---- tab-gold: beide Arme gegen den Gold-Standard --------------------
    if GOLD_RUN.exists():
        lines = [r"\begin{tabular}{llrrrrr}", r"  \toprule",
                 r"  Arm & Level & $n$ & TP & Precision & Recall & F1 \\",
                 r"  \midrule"]
        prev_arm = "typed"
        for arm, level, n, tp, p, r, f in gold_rows():
            if arm and arm != prev_arm:
                lines.append(r"  \midrule")
                prev_arm = arm
            lines.append(
                f"  {arm:6s} & {level:17s} & {n} & {tp} & "
                f"{p:.3f} & {r:.3f} & {f:.3f} \\\\")
        lines += [r"  \bottomrule", r"\end{tabular}"]
        write_tex("tab-gold.tex", lines)
    else:
        print(f"[WARN] Gold-Lauf fehlt, tab-gold.tex nicht erzeugt: {GOLD_RUN}")


def main():
    corpus = [(LABELS[t], *ukp_counts(t)) for t in ORDER]
    stats = {}
    for d in BATCH:
        topic = d.name.replace("2026-07-02_1037_", "").replace("_seed42", "")
        stats[topic] = topic_stats(d)

    # ------------------------- Markdown-Uebersicht -------------------------
    lines = ["# Thesis-Tabellen (kanonischer Batch 2026-07-02_1037, seed 42, prompt v3)\n"]

    lines.append("## A. UKP test split: verfuegbare Argumente je Topic\n")
    lines.append("| Topic | Argument_for | Argument_against | total |")
    lines.append("|---|---:|---:|---:|")
    for label, p, c in corpus:
        lines.append(f"| {label} | {p} | {c} | {p + c} |")
    lines.append("")

    lines.append("## B. Cross-Topic (typed-Arm der Ablation = kanonische Pipeline)\n")
    lines.append("| Topic | Atoms | Pairs | Acc | Acc% | Cyc | Iso | Grnd | U | #Pr | #St | Reb | Und | Cut | Sym | VerAcc | Extract(s) |")
    lines.append("|---|---:|---:|---:|---:|:-:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    for t in ORDER:
        s = stats[t]
        lines.append(
            f"| {LABELS[t]} | {s['n_atoms']} | {s['pairs']} | {s['acc']} | "
            f"{100 * s['acc'] / s['pairs']:.1f} | {s['cyc']} | {s['iso']} | "
            f"{s['grounded']} | {s['u']} | {s['npref']} | {s['nstab']} | "
            f"{s['reb']} | {s['und']} | {s['cut']} | {s['sym']} | {s['ver']} | "
            f"{s['extract_s']} |")
    lines.append("")

    lines.append("## C. Ablation typed / typed-raw / binary (identisches A')\n")
    lines.append("| Topic | Edges t | t-raw | b | J-raw | J-undir | inter | t-only | b-only | Pr(t) | Pr(traw) | Pr(b) | St(t) | St(traw) | St(b) | Grnd(t) | Grnd(traw) | Grnd(b) | sameSt(t) | sameSt(b) |")
    lines.append("|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    for t in ORDER:
        s = stats[t]
        lines.append(
            f"| {LABELS[t]} | {s['acc']} | {s['raw_edges']} | {s['b_edges']} | "
            f"{s['j_raw']:.2f} | {s['j_undir']:.2f} | "
            f"{s['inter']} | {s['t_only']} | {s['b_only']} | "
            f"{s['npref']} | {s['pr_raw']} | {s['pr_b']} | "
            f"{s['nstab']} | {s['st_raw']} | {s['st_b']} | "
            f"{s['grounded']} | {s['grnd_raw']} | {s['grnd_b']} | "
            f"{s['same_t']} | {s['same_b']} |")
    lines.append("")

    lines.append("## D. Beispiel-Kanten (Abortion, typed_only / binary_only, Auszug)\n")
    comp = stats["abortion"]["comparison"]
    lines.append("typed_only:  " + ", ".join(comp["directed_raw"]["typed_only"][:8]))
    lines.append("")
    lines.append("binary_only: " + ", ".join(comp["directed_raw"]["binary_only"][:8]))
    lines.append("")

    out = CODE / "output" / "thesis_tables.md"
    out.write_text("\n".join(lines), encoding="utf-8")
    print(f"-> {out}")

    # ------------------------- LaTeX-Fragmente ----------------------------
    write_latex(corpus, stats)


if __name__ == "__main__":
    main()
