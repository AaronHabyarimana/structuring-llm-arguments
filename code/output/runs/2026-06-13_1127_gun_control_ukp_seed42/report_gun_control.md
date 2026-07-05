# Run Report: Gun Control

Run-ID: `2026-06-13_1127_gun_control_ukp_seed42`
Timestamp: 2026-06-13T11:27:38

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 15 |
| Balanced | True |
| Seed | 42 |
| Atomize | True |
| Batch size | 10 |
| Max workers | 2 |
| Confidence accept | 70 |
| Confidence verify | 50 |
| Model (extract) | GPT OSS 120B |
| Model (attacks) | GPT OSS 120B |

## Dataset / Arguments

- Source: ukp
- Split: test
- Arguments before atomization: 14
- Arguments after atomization: 23

## Attack Extraction

- Pairs evaluated: 244
- Accepted pairs (accept/verify): 20
- Rejected/skipped: 220 (reject/verify-reject: 11, skip: 209)
- Verify calls: 11
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 35
- Parse errors: 4

### Attack edges in graph

- Direct edges: 20
- Symmetric rebuttal edges: 6
- Total attacks: 26

## Graph Statistics

- Density: 0.0514
- Isolated nodes: 8 (0.3478)
- SCCs: 16 (largest: 8)
- Cycles: True
- Attack type distribution: {'undermining': 14, 'rebuttal': 12}

## Formal Semantics

- Grounded: ['con23', 'con23b', 'con56', 'con9', 'con9b', 'pro27', 'pro29b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7']
- Preferred: [['con109', 'con109b', 'con23', 'con23b', 'con56', 'con60b', 'con9', 'con9b', 'pro27', 'pro29b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7'], ['con23', 'con23b', 'con56', 'con60b', 'con9', 'con9b', 'pro27', 'pro27b', 'pro29b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71', 'pro71b'], ['con23', 'con23b', 'con56', 'con9', 'con9b', 'pro27', 'pro27b', 'pro29b', 'pro36', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71', 'pro71b']]
- Stable: [['con109', 'con109b', 'con23', 'con23b', 'con56', 'con60b', 'con9', 'con9b', 'pro27', 'pro29b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7'], ['con23', 'con23b', 'con56', 'con60b', 'con9', 'con9b', 'pro27', 'pro27b', 'pro29b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71', 'pro71b'], ['con23', 'con23b', 'con56', 'con9', 'con9b', 'pro27', 'pro27b', 'pro29b', 'pro36', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71', 'pro71b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 14 | 23 | 244 | 26 | 0.0514 | 34.8% | 16 | 12 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 0.0514 | 1.1304 | 1.1304 | 8 | 100.0% | 46.2% | 53.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 24.599 | — |
| attack_extraction | 85 | — | 292.287 | 35 |
| prolog_solver | — | — | 0.203 | — |
| **total** | 99 | 101639 | 317.25 | 35 |

## Qualitative Examples

### Accepted (max 5)
- `pro29:con23` → **accept** — Con23 challenges the premise that stricter gun laws reduce deaths, which underlies pro29's implication
- `pro29:con109` → **accept** — Con109 disputes the premise that gun presence leads to negative child outcomes
- `pro29:con109b` → **accept** — Con109b similarly attacks the premise linking guns to harm by highlighting positive associations
- `pro29:con8` → **accept** — Con8 provides a counterexample that strict laws may not lower homicide rates, undermining the implied premise of pro29
- `pro29:con56` → **accept** — Con56 cites public belief that guns provide protection, challenging the premise that guns are solely harmful to children

### Rejected / Skipped (max 5)
- `pro29:pro7` → **skip** — The claims address different aspects (child accident rates vs. hypocrisy of gun enthusiasts) and do not directly contradict or attack each other's premises.
- `pro29:pro71` → **skip** — One provides a statistic on child deaths, the other critiques the interpretation of the Second Amendment; no logical incompatibility or premise attack is evident.
- `pro29:pro71b` → **skip** — The arguments focus on different topics (child accident rates vs. expansion of gun rights) and do not undermine or rebut each other.
- `pro29:pro63` → **skip** — Pro63’s claim that cars can kill does not directly refute the statistic about child gun accidents nor attack its premises.
- `pro29:pro63b` → **skip** — The statement about cars being unsuitable substitutes does not contradict or undermine the child‑accident statistic.

