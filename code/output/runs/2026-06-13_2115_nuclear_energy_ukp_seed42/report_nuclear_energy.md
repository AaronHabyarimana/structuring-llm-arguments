# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2115_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:15:04

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
- Accepted pairs (accept/verify): 10
- Rejected/skipped: 51 (reject/verify-reject: 2, skip: 49)
- Verify calls: 4
- Verify accept rate: 50.0%
- Fallback calls (classify_single): 1
- Parse errors: 0

### Attack edges in graph

- Direct edges: 10
- Symmetric rebuttal edges: 3
- Total attacks: 13

## Graph Statistics

- Density: 0.0985
- Isolated nodes: 3 (0.25)
- SCCs: 8 (largest: 5)
- Cycles: True
- Attack type distribution: {'undermining': 7, 'rebuttal': 6}

## Formal Semantics

- Grounded: ['con58', 'con71', 'con71b', 'con71c', 'pro95']
- Preferred: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro82b', 'pro95']]
- Stable: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 8 | 12 | 61 | 13 | 0.0985 | 25.0% | 8 | 5 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.0985 | 1.0833 | 1.0833 | 3 | 100.0% | 46.2% | 53.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 8 | — | 10.453 | — |
| attack_extraction | 13 | — | 40.032 | 1 |
| prolog_solver | — | — | 0.113 | — |
| **total** | 21 | 28153 | 50.652 | 1 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con71b` → **verify-accept** — Con71b suggests high death tolls in meltdowns, challenging the premise that storage is safe.
- `pro82:con63` → **accept** — Con63 raises terrorist misuse of waste, questioning the security aspect of storage.
- `pro82:con36` → **accept** — Con36 claims nuclear waste remains an unresolved problem, directly contradicting the conclusion that storage is safe and secure.
- `pro82b:con63` → **verify-accept** — The question implies waste could be weaponized, challenging the premise that disposal plans are sufficient
- `pro82b:con36` → **accept** — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both claims assert storage is safe/robust, so no attack.
- `pro82:pro15b` → **skip** — Pro15b provides a factual detail about location, not contradicting safety claim.
- `pro82:pro4` → **skip** — Pro4 discusses emissions, unrelated to storage safety.
- `pro82:pro95` → **skip** — Pro95 addresses radiation harm, not the safety of storage.
- `pro82:con71` → **skip** — Con71 talks about mortality in meltdowns, not directly challenging storage safety.

