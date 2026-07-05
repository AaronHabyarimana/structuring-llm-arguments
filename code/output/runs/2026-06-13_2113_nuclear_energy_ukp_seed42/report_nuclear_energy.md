# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2113_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:13:44

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
- Accepted pairs (accept/verify): 9
- Rejected/skipped: 52 (reject/verify-reject: 0, skip: 52)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 1
- Parse errors: 0

### Attack edges in graph

- Direct edges: 9
- Symmetric rebuttal edges: 3
- Total attacks: 12

## Graph Statistics

- Density: 0.0909
- Isolated nodes: 4 (0.3333)
- SCCs: 9 (largest: 4)
- Cycles: True
- Attack type distribution: {'rebuttal': 6, 'undermining': 6}

## Formal Semantics

- Grounded: ['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95']
- Preferred: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro82b', 'pro95']]
- Stable: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 8 | 12 | 61 | 12 | 0.0909 | 33.3% | 9 | 6 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.0909 | 1.0 | 1.0 | 4 | 100.0% | 50.0% | 50.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 8 | — | 11.622 | — |
| attack_extraction | 9 | — | 40.243 | 1 |
| prolog_solver | — | — | 0.656 | — |
| **total** | 17 | 26364 | 52.622 | 1 |

## Qualitative Examples

### Accepted (max 5)
- `pro82b:con36` → **accept** — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
- `pro82:con63` → **accept** — The question suggests waste could be weaponized, challenging the premise that storage is secure.
- `pro82:con36` → **accept** — Claiming nuclear waste is an unresolved problem directly contradicts the conclusion that storage is safe and secure.
- `pro15b:con63` → **accept** — The question implies that underground waste could be used by terrorists, challenging the safety premise of the storage claim.
- `pro15b:con36` → **accept** — It asserts that nuclear waste remains an unresolved problem, directly attacking the premise that underground storage resolves waste issues.

### Rejected / Skipped (max 5)
- `pro82b:pro15` → **skip** — Both statements support nuclear waste management and are compatible, no logical conflict.
- `pro82b:pro15b` → **skip** — Statement about disposal plans and storage depth do not contradict each other.
- `pro82b:pro4` → **skip** — One addresses disposal plans, the other public stance on CO2 emissions; they are unrelated.
- `pro82b:pro95` → **skip** — Claims about disposal plans and low-level radiation safety are compatible.
- `pro82b:con71` → **skip** — Melt‑down mortality statistics do not directly oppose the claim about disposal plans.

