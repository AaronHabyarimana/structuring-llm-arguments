"""
run_logger.py  —  Reproduzierbare Experiment- und Logging-Schicht

Diese Datei kapselt das gesamte Logging der Pipeline (extract.py / chat.py),
damit Zwischenschritte und Ergebnisse pro Run nachvollziehbar gespeichert werden.
Ziel: Fehleranalyse, Prompt-Vergleiche, Laufzeit-Auswertung und Tabellen für die
Bachelorarbeit / ein IJCLR-artiges Samplepaper.

Designprinzipien:
  * Keine schweren externen Dependencies (SCC per Tarjan selbst implementiert).
  * Pro Run ein eigener Ordner output/runs/<run_id>/ mit allen Artefakten.
  * Thread-sicher, weil LLM-Calls über ThreadPoolExecutor laufen.
"""

import hashlib
import json
import re
import threading
import uuid
from datetime import datetime
from pathlib import Path


# ---------------------------------------------------------------------------
# Pfade & Run-ID
# ---------------------------------------------------------------------------

CODE_DIR = Path(__file__).parent
RUNS_DIR = CODE_DIR / "output" / "runs"


def slugify(text: str) -> str:
    """Macht aus beliebigem Text einen dateinamen-tauglichen Slug."""
    s = re.sub(r"\W+", "_", str(text).strip().lower()).strip("_")
    return s or "x"


def generate_run_id(topic_file: str, source: str, seed: int | None) -> str:
    """
    Erzeugt eine reproduzierbar lesbare Run-ID, z. B.:
        2026-06-05_1742_nuclear_energy_ukp_seed10
    """
    ts = datetime.now().strftime("%Y-%m-%d_%H%M")
    seed_part = f"_seed{seed}" if seed is not None else ""
    return f"{ts}_{slugify(topic_file)}_{slugify(source)}{seed_part}"


# Minimaler JSON-Parser (Duplikat aus extract.py, hier um Zirkular-Import
# zu vermeiden). Wird nur für best-effort parse_ok in calls.jsonl genutzt.
# ---------------------------------------------------------------------------

def _best_effort_parse(content: str):
    if not content:
        return None
    cleaned = re.sub(r"<think(?:ing)?>.*?</think(?:ing)?>", "", content, flags=re.DOTALL)
    cleaned = re.sub(r"<think(?:ing)?>.*$", "", cleaned, flags=re.DOTALL)
    cleaned = re.sub(r"```(?:json)?\s*|\s*```", "", cleaned).strip()
    for opener, closer in (("{", "}"), ("[", "]")):
        try:
            return json.loads(cleaned)
        except json.JSONDecodeError:
            pass
        start, end = cleaned.find(opener), cleaned.rfind(closer)
        if start != -1 and end > start:
            try:
                return json.loads(cleaned[start:end + 1])
            except json.JSONDecodeError:
                pass
    return None


# RunLogger

class RunLogger:
    """
    Hält alle Run-Artefakte im Speicher UND schreibt sie inkrementell als
    JSONL/JSON in den Run-Ordner. Die In-Memory-Listen werden vom Report-
    Generator weiterverwendet (keine erneute Datei-Parse nötig).
    """

    def __init__(self, run_id: str, run_dir: Path):
        self.run_id = run_id
        self.dir = Path(run_dir)
        self.dir.mkdir(parents=True, exist_ok=True)

        self._lock = threading.Lock()
        self._call_counter = 0

        # In-Memory-Akkumulation (für Report ohne Re-Parse)
        self.calls: list[dict] = []
        self.pair_decisions: list[dict] = []
        self.arguments: list[dict] = []
        self.attacks: list[dict] = []

        # Dateipfade
        self.calls_path = self.dir / "calls.jsonl"
        self.pairs_path = self.dir / "pair_decisions.jsonl"
        self.args_path = self.dir / "arguments.jsonl"
        self.attacks_path = self.dir / "attacks.jsonl"

    # -- low-level helpers ---------------------------------------------------

    def _append_jsonl(self, path: Path, record: dict) -> None:
        """Hängt ein JSON-Objekt thread-sicher als eine Zeile an (ensure_ascii=False)."""
        line = json.dumps(record, ensure_ascii=False)
        with self._lock:
            with open(path, "a", encoding="utf-8") as f:
                f.write(line + "\n")

    def write_json(self, name: str, obj: dict) -> Path:
        """Schreibt ein JSON-Objekt hübsch formatiert in den Run-Ordner."""
        path = self.dir / name
        with open(path, "w", encoding="utf-8") as f:
            json.dump(obj, f, ensure_ascii=False, indent=2)
        return path

    def write_text(self, name: str, text: str) -> Path:
        path = self.dir / name
        with open(path, "w", encoding="utf-8") as f:
            f.write(text)
        return path

    # -- 4. calls.jsonl ------------------------------------------------------

    def log_call(
        self,
        phase: str,
        prompt: str,
        raw_response: str | None,
        latency_s: float,
        model: str,
        *,
        prompt_version: str | None = None,
        input_ids: list[str] | None = None,
        temperature: float = 0,
        max_tokens: int | None = None,
        usage: dict | None = None,
        error: str | None = None,
    ) -> None:
        """
        Loggt einen einzelnen LLM-Call (auch fehlgeschlagene: RateLimit, BadRequest,
        Timeout, Parse-Fehler). prompt_hash = SHA256 des Prompts.
        """
        with self._lock:
            self._call_counter += 1
            call_id = f"{self._call_counter:05d}_{uuid.uuid4().hex[:8]}"

        parsed = _best_effort_parse(raw_response) if raw_response else None
        record = {
            "run_id": self.run_id,
            "call_id": call_id,
            "timestamp": datetime.now().isoformat(timespec="seconds"),
            "phase": phase,
            "prompt_version": prompt_version,
            "model": model,
            "temperature": temperature,
            "max_tokens": max_tokens,
            "input_ids": input_ids or [],
            "prompt_hash": hashlib.sha256((prompt or "").encode("utf-8")).hexdigest(),
            "prompt": prompt,
            "raw_response": raw_response,
            "parsed": parsed,
            "parse_ok": parsed is not None,
            "latency_s": round(latency_s, 3),
            "usage": usage,
            "error": error,
        }
        self.calls.append(record)
        self._append_jsonl(self.calls_path, record)

    # -- 5. pair_decisions.jsonl --------------------------------------------

    def log_pair_decision(self, record: dict) -> None:
        record = {"run_id": self.run_id, **record}
        self.pair_decisions.append(record)
        self._append_jsonl(self.pairs_path, record)

    # -- 6. attacks.jsonl ----------------------------------------------------

    def log_attack(self, record: dict) -> None:
        record = {"run_id": self.run_id, **record}
        self.attacks.append(record)
        self._append_jsonl(self.attacks_path, record)

    # -- 3. arguments.jsonl --------------------------------------------------

    def log_argument(self, record: dict) -> None:
        record = {"run_id": self.run_id, **record}
        self.arguments.append(record)
        self._append_jsonl(self.args_path, record)


# ---------------------------------------------------------------------------
# Graph-Statistiken (Abschnitt 9)
# ---------------------------------------------------------------------------

def _tarjan_scc(nodes: list[str], adj: dict[str, list[str]]) -> list[list[str]]:
    """
    Tarjan's Algorithmus für strongly connected components.
    Iterativ implementiert (keine Rekursionsgrenze), keine externe Dependency.
    """
    index_counter = [0]
    index: dict[str, int] = {}
    lowlink: dict[str, int] = {}
    on_stack: dict[str, bool] = {}
    stack: list[str] = []
    sccs: list[list[str]] = []

    for root in nodes:
        if root in index:
            continue
        # work-stack: (node, iterator-position)
        work = [(root, 0)]
        while work:
            node, i = work[-1]
            if i == 0:
                index[node] = lowlink[node] = index_counter[0]
                index_counter[0] += 1
                stack.append(node)
                on_stack[node] = True
            recurse = False
            neighbours = adj.get(node, [])
            while i < len(neighbours):
                w = neighbours[i]
                if w not in index:
                    work[-1] = (node, i + 1)
                    work.append((w, 0))
                    recurse = True
                    break
                elif on_stack.get(w):
                    lowlink[node] = min(lowlink[node], index[w])
                i += 1
            if recurse:
                continue
            if lowlink[node] == index[node]:
                comp = []
                while True:
                    w = stack.pop()
                    on_stack[w] = False
                    comp.append(w)
                    if w == node:
                        break
                sccs.append(comp)
            work.pop()
            if work:
                parent, _ = work[-1]
                lowlink[parent] = min(lowlink[parent], lowlink[node])
    return sccs


def compute_graph_stats(arguments: list[dict], attacks: list[dict]) -> dict:
    """
    Berechnet Graphmetriken aus Argumenten und (akzeptierten) Angriffen.
    Keine externe Dependency. Erwartet attacks mit 'attacker'/'target' und
    optional 'type'; arguments mit 'id'/'stance'.
    """
    ids = [a["id"] for a in arguments]
    id_set = set(ids)
    stance = {a["id"]: a.get("stance", "?") for a in arguments}
    n = len(ids)

    # Nur Angriffe zwischen bekannten Knoten zählen (robust gegen ID-Drift)
    edges = [
        (atk["attacker"], atk["target"])
        for atk in attacks
        if atk.get("attacker") in id_set and atk.get("target") in id_set
    ]
    m = len(edges)

    in_deg = {i: 0 for i in ids}
    out_deg = {i: 0 for i in ids}
    adj: dict[str, list[str]] = {i: [] for i in ids}
    n_self = 0
    cross = same = 0
    type_counts: dict[str, int] = {}

    for atk in attacks:
        att, tgt = atk.get("attacker"), atk.get("target")
        t = atk.get("type", "NONE") or "NONE"
        type_counts[t] = type_counts.get(t, 0) + 1
        if att not in id_set or tgt not in id_set:
            continue
        out_deg[att] += 1
        in_deg[tgt] += 1
        adj[att].append(tgt)
        if att == tgt:
            n_self += 1
        if stance.get(att) == stance.get(tgt):
            same += 1
        else:
            cross += 1

    isolated = [i for i in ids if in_deg[i] == 0 and out_deg[i] == 0]
    sccs = _tarjan_scc(ids, adj)
    largest = max((len(c) for c in sccs), default=0)
    # Zyklus: SCC mit >1 Knoten ODER eine Selbstkante
    has_cycles = any(len(c) > 1 for c in sccs) or n_self > 0

    def ratio(x: int, total: int) -> float:
        return round(x / total, 4) if total else 0.0

    return {
        "n_args": n,
        "n_attacks": m,
        "density": ratio(m, n * (n - 1)) if n > 1 else 0.0,
        "avg_in_degree": round(sum(in_deg.values()) / n, 4) if n else 0.0,
        "avg_out_degree": round(sum(out_deg.values()) / n, 4) if n else 0.0,
        "isolated_nodes": isolated,
        "isolated_ratio": ratio(len(isolated), n),
        "cross_stance_attacks": cross,
        "same_stance_attacks": same,
        "cross_stance_ratio": ratio(cross, m),
        "same_stance_ratio": ratio(same, m),
        "attack_type_counts": type_counts,
        "attack_type_ratios": {k: ratio(v, m) for k, v in type_counts.items()},
        "n_scc": len(sccs),
        "largest_scc_size": largest,
        "has_cycles": has_cycles,
        "n_self_attacks": n_self,
    }


# ---------------------------------------------------------------------------
# Report-Generator (Abschnitt 10)
# ---------------------------------------------------------------------------

def _decision_counts(decisions: list[dict]) -> dict:
    """Aggregiert Pair-Decisions nach outcome für den Report."""
    counts: dict[str, int] = {}
    for d in decisions:
        o = d.get("outcome", "?")
        counts[o] = counts.get(o, 0) + 1
    return counts


def _call_counts(calls: list[dict]) -> dict:
    """Aggregiert LLM-Calls nach Phase + Token-Summe."""
    by_phase: dict[str, int] = {}
    tokens = 0
    errors = 0
    for c in calls:
        by_phase[c["phase"]] = by_phase.get(c["phase"], 0) + 1
        usage = c.get("usage") or {}
        tokens += int(usage.get("total_tokens", 0) or 0)
        if c.get("error"):
            errors += 1
    return {"by_phase": by_phase, "total_tokens": tokens, "errors": errors}


def _pct(x: int, total: int) -> str:
    return f"{100.0 * x / total:.1f}%" if total else "—"


def build_report(
    config: dict,
    logger: RunLogger,
    results: dict,
    graph_stats: dict,
) -> str:
    """
    Erzeugt den Markdown-Report report_<topic>.md.
    Direkt als Grundlage für Tabellen/Ergebnistext in der Bachelorarbeit nutzbar.
    """
    topic_label = config.get("topic_label", config.get("topic_file", "Topic"))
    dec = logger.pair_decisions
    counts = _decision_counts(dec)
    calls = _call_counts(logger.calls)

    accepted = counts.get("accept", 0) + counts.get("verify-accept", 0)
    rejected = counts.get("reject", 0) + counts.get("verify-reject", 0)
    skipped = counts.get("skip", 0)
    parse_err = counts.get("parse_error", 0)
    n_verify = counts.get("verify-accept", 0) + counts.get("verify-reject", 0)
    verify_rate = _pct(counts.get("verify-accept", 0), n_verify)

    # Tatsächliche Graph-Kanten (logger.attacks == attacks.jsonl == graph n_attacks).
    # Symmetrisierte Rebuttals werden via log_attack ergänzt, aber NICHT als
    # pair_decision geloggt — daher hier separat aus logger.attacks zählen,
    # damit die Summe mit dem Graphen übereinstimmt.
    atk_counts = _decision_counts(logger.attacks)
    n_direct_edges = atk_counts.get("accept", 0) + atk_counts.get("verify-accept", 0)
    n_symmetric = atk_counts.get("symmetric-rebuttal", 0)
    n_edges_total = len(logger.attacks)

    n_before = config.get("n_args_before_atomize", "?")
    n_after = graph_stats.get("n_args", "?")
    n_pairs = len(dec)
    n_attacks = graph_stats.get("n_attacks", 0)
    fallbacks = calls["by_phase"].get("classify_single", 0)

    grounded = results.get("grounded") or []
    preferred = results.get("preferred")
    stable = results.get("stable")
    n_pref = len(preferred) if isinstance(preferred, list) else "n/a"
    n_stable = len(stable) if isinstance(stable, list) else "n/a"

    tc = graph_stats.get("attack_type_counts", {})
    rebut = _pct(tc.get("rebuttal", 0), n_attacks)
    under_m = _pct(tc.get("undermining", 0), n_attacks)
    under_c = _pct(tc.get("undercutting", 0), n_attacks)
    cross_pct = _pct(graph_stats.get("cross_stance_attacks", 0), n_attacks)

    rt = results.get("runtime_s", {})

    # Qualitative Beispiele
    def _examples(predicate, k=5):
        out = []
        for d in dec:
            if predicate(d):
                out.append(d)
            if len(out) >= k:
                break
        return out

    accepted_ex = _examples(lambda d: d.get("outcome") in ("accept", "verify-accept"))
    rejected_ex = _examples(
        lambda d: d.get("outcome") in ("reject", "verify-reject", "skip")
    )

    def _fmt_ex(rows):
        if not rows:
            return "- (keine)\n"
        lines = []
        for d in rows:
            pair = d.get("pair", "?")
            out = d.get("outcome", "?")
            reason = (d.get("reason") or d.get("verify_reason") or "").strip()
            lines.append(f"- `{pair}` → **{out}** — {reason}")
        return "\n".join(lines) + "\n"

    md = f"""# Run Report: {topic_label}

Run-ID: `{config.get('run_id')}`
Timestamp: {config.get('timestamp')}

## Configuration

| Key | Value |
|---|---|
| Source | {config.get('source')} |
| Split | {config.get('split')} |
| Limit | {config.get('limit')} |
| Balanced | {config.get('balanced')} |
| Seed | {config.get('seed')} |
| Atomize | {config.get('atomize')} |
| Batch size | {config.get('batch_size')} |
| Max workers | {config.get('max_workers')} |
| Confidence accept | {config.get('confidence_accept')} |
| Confidence verify | {config.get('confidence_verify')} |
| Model (extract) | {config.get('model_extract')} |
| Model (attacks) | {config.get('model_attacks')} |

## Dataset / Arguments

- Source: {config.get('source')}
- Split: {config.get('split')}
- Arguments before atomization: {n_before}
- Arguments after atomization: {n_after}

## Attack Extraction

- Pairs evaluated: {n_pairs}
- Accepted pairs (accept/verify): {accepted}
- Rejected/skipped: {rejected + skipped} (reject/verify-reject: {rejected}, skip: {skipped})
- Verify calls: {n_verify}
- Verify accept rate: {verify_rate}
- Fallback calls (classify_single): {fallbacks}
- Parse errors: {parse_err}

### Attack edges in graph

- Direct edges: {n_direct_edges}
- Symmetric rebuttal edges: {n_symmetric}
- Total attacks: {n_edges_total}

## Graph Statistics

- Density: {graph_stats.get('density')}
- Isolated nodes: {len(graph_stats.get('isolated_nodes', []))} ({graph_stats.get('isolated_ratio')})
- SCCs: {graph_stats.get('n_scc')} (largest: {graph_stats.get('largest_scc_size')})
- Cycles: {graph_stats.get('has_cycles')}
- Attack type distribution: {graph_stats.get('attack_type_counts')}

## Formal Semantics

- Grounded: {grounded}
- Preferred: {preferred if preferred is not None else 'n/a (nicht berechnet/timeout)'}
- Stable: {stable if stable is not None else 'n/a (nicht berechnet/timeout)'}

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| {topic_label} | {n_before} | {n_after} | {n_pairs} | {n_attacks} | {graph_stats.get('density')} | {_pct(len(graph_stats.get('isolated_nodes', [])), n_after if isinstance(n_after, int) else 0)} | {graph_stats.get('n_scc')} | {len(grounded)} | {n_pref} |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| {topic_label} | {graph_stats.get('density')} | {graph_stats.get('avg_in_degree')} | {graph_stats.get('avg_out_degree')} | {len(graph_stats.get('isolated_nodes', []))} | {cross_pct} | {rebut} | {under_m} | {under_c} |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | {calls['by_phase'].get('atomize', 0)} | — | {rt.get('atomize', '—')} | — |
| attack_extraction | {calls['by_phase'].get('classify_batch', 0) + calls['by_phase'].get('classify_single', 0) + calls['by_phase'].get('verify', 0)} | — | {rt.get('attack_extraction', '—')} | {fallbacks} |
| prolog_solver | — | — | {rt.get('prolog_solver', '—')} | — |
| **total** | {len(logger.calls)} | {calls['total_tokens']} | {rt.get('total', '—')} | {fallbacks} |

## Qualitative Examples

### Accepted (max 5)
{_fmt_ex(accepted_ex)}
### Rejected / Skipped (max 5)
{_fmt_ex(rejected_ex)}
"""
    return md
