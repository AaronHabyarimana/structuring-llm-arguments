# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2222_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T22:22:49

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
- Arguments after atomization: 13

## Attack Extraction

- Pairs evaluated: 72
- Accepted pairs (accept/verify): 13
- Rejected/skipped: 59 (reject/verify-reject: 0, skip: 59)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 13
- Symmetric rebuttal edges: 8
- Total attacks: 21

## Graph Statistics

- Density: 0.1346
- Isolated nodes: 2 (0.1538)
- SCCs: 5 (largest: 9)
- Cycles: True
- Attack type distribution: {'undermining': 5, 'rebuttal': 16}

## Formal Semantics

- Grounded: ['con63', 'con71', 'pro15b', 'pro4', 'pro82b']
- Preferred: [['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro15b', 'pro4', 'pro82b'], ['con58', 'con63', 'con71', 'pro15b', 'pro4', 'pro82b', 'pro95'], ['con63', 'con71', 'pro15b', 'pro4', 'pro4b', 'pro82b', 'pro95']]
- Stable: [['con58', 'con63', 'con71', 'con71b', 'con71c', 'pro15b', 'pro4', 'pro82b'], ['con58', 'con63', 'con71', 'pro15b', 'pro4', 'pro82b', 'pro95'], ['con63', 'con71', 'pro15b', 'pro4', 'pro4b', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 8 | 13 | 72 | 21 | 0.1346 | 15.4% | 5 | 5 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1346 | 1.6154 | 1.6154 | 2 | 95.2% | 76.2% | 23.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 8 | — | 11.028 | — |
| attack_extraction | 8 | — | 46.773 | 0 |
| prolog_solver | — | — | 0.155 | — |
| **total** | 16 | 27290 | 58.006 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con63` → **accept** — The question about terrorist use challenges the premise that storage is secure.
- `pro82:con36` → **accept** — Claiming storage is safe directly contradicts the claim that nuclear waste remains an unresolved problem
- `pro82b:con36` → **accept** — B says nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
- `pro15:con63` → **accept** — B questions the safety of nuclear waste against terrorism, challenging the premise that storage is robust.
- `pro15:con36` → **accept** — A claims waste storage is robust, which contradicts B’s claim that nuclear waste remains an unresolved problem.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both claims support storage safety; no conflict or premise attack.
- `pro82:pro15b` → **skip** — Statement about location does not contradict or undermine safety claim.
- `pro82:pro4` → **skip** — Claims address different topics (storage safety vs CO2 emissions) and are not mutually exclusive.
- `pro82:pro4b` → **skip** — Support for nuclear power based on emissions does not rebut or undermine storage safety.
- `pro82:pro95` → **skip** — Radiation harm claim is compatible with storage being safe.

