# Run Report: Nuclear Energy

Run-ID: `2026-06-13_1854_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T18:54:27

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 8 |
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
- Arguments before atomization: 8
- Arguments after atomization: 12

## Attack Extraction

- Pairs evaluated: 61
- Accepted pairs (accept/verify): 11
- Rejected/skipped: 50 (reject/verify-reject: 0, skip: 50)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 1
- Parse errors: 0

### Attack edges in graph

- Direct edges: 11
- Symmetric rebuttal edges: 5
- Total attacks: 16

## Graph Statistics

- Density: 0.1212
- Isolated nodes: 2 (0.1667)
- SCCs: 7 (largest: 5)
- Cycles: True
- Attack type distribution: {'undermining': 5, 'rebuttal': 10, 'undercutting': 1}

## Formal Semantics

- Grounded: ['con63', 'con71', 'con71b', 'con71c', 'pro95']
- Preferred: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro82b', 'pro95'], ['con63', 'con71', 'con71b', 'con71c', 'pro4', 'pro82b', 'pro95']]
- Stable: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro82b', 'pro95'], ['con63', 'con71', 'con71b', 'con71c', 'pro4', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 8 | 12 | 61 | 16 | 0.1212 | 16.7% | 7 | 5 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1212 | 1.3333 | 1.3333 | 2 | 100.0% | 62.5% | 31.2% | 6.2% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 8 | — | 12.319 | — |
| attack_extraction | 9 | — | 42.279 | 1 |
| prolog_solver | — | — | 1.632 | — |
| **total** | 17 | 26524 | 56.326 | 1 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con63` → **accept** — B questions the security of waste, attacking the premise that storage is safe
- `pro82:con36` → **accept** — B claims waste remains an unresolved problem, directly contradicting A's claim of safe, secure storage
- `pro82b:con36` → **accept** — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
- `pro15:con71b` → **accept** — Con71b’s claim of many deaths in a significant fraction of melt‑downs contradicts the conclusion that storage is robust.
- `pro15:con71c` → **accept** — Con71c challenges the premise that storage is safe by highlighting a catastrophic outcome, even if very rare.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both claims affirm storage safety, no conflict or challenge
- `pro82:pro15b` → **skip** — B provides a factual detail that does not contradict A's safety claim
- `pro82:pro4` → **skip** — B discusses emissions and public stance, unrelated to A's safety assertion
- `pro82:pro95` → **skip** — B talks about low‑level radiation harm, which does not oppose A's safety claim
- `pro82:con71` → **skip** — B gives melt‑down mortality statistics, not a direct challenge to storage safety

