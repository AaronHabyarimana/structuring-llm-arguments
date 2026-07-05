# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2119_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:19:53

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 6 |
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
- Arguments before atomization: 6
- Arguments after atomization: 10

## Attack Extraction

- Pairs evaluated: 40
- Accepted pairs (accept/verify): 9
- Rejected/skipped: 31 (reject/verify-reject: 0, skip: 31)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 9
- Symmetric rebuttal edges: 3
- Total attacks: 12

## Graph Statistics

- Density: 0.1333
- Isolated nodes: 1 (0.1)
- SCCs: 7 (largest: 4)
- Cycles: True
- Attack type distribution: {'undermining': 6, 'rebuttal': 6}

## Formal Semantics

- Grounded: ['con58', 'con63', 'con71', 'con71b', 'con71c']
- Preferred: [['con58', 'con63', 'con71', 'con71b', 'con71c']]
- Stable: [['con58', 'con63', 'con71', 'con71b', 'con71c']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 6 | 10 | 40 | 12 | 0.1333 | 10.0% | 7 | 5 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1333 | 1.2 | 1.2 | 1 | 100.0% | 50.0% | 50.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 6 | — | 9.656 | — |
| attack_extraction | 4 | — | 22.926 | 0 |
| prolog_solver | — | — | 0.171 | — |
| **total** | 10 | 16239 | 32.812 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82b:con63` → **accept** — Con63 questions the security of nuclear waste, attacking the premise that disposal plans are safely in hand.
- `pro82:con71b` → **accept** — The claim of many deaths in a melt‑down directly opposes the conclusion that storage is safe.
- `pro82:con71c` → **accept** — Even a low‑probability scenario with massive fatalities contradicts the assertion of safety.
- `pro82:con63` → **accept** — The question challenges the premise that storage is secure against terrorist misuse.
- `pro15:con63` → **accept** — con63 questions waste security, challenging the premise that storage is robust

### Rejected / Skipped (max 5)
- `pro82b:pro4` → **skip** — They address different issues (waste disposal vs emissions) and do not contradict or attack each other.
- `pro82b:con71` → **skip** — Con71 discusses melt‑down mortality, which does not directly challenge the claim about disposal plans being ready.
- `pro82b:con71b` → **skip** — Con71b’s mortality statistics do not target the premise of having disposal plans in hand.
- `pro82b:con71c` → **skip** — Similarly, the death‑rate claim does not undermine the disposal‑plan claim.
- `pro82b:con58` → **skip** — Con58 argues about funding priorities, not directly challenging the adequacy of disposal plans.

