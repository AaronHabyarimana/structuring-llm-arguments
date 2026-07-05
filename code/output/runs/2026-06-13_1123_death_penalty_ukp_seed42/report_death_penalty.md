# Run Report: Death Penalty

Run-ID: `2026-06-13_1123_death_penalty_ukp_seed42`
Timestamp: 2026-06-13T11:23:11

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
- Arguments after atomization: 18

## Attack Extraction

- Pairs evaluated: 148
- Accepted pairs (accept/verify): 47
- Rejected/skipped: 97 (reject/verify-reject: 4, skip: 93)
- Verify calls: 4
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 38
- Parse errors: 4

### Attack edges in graph

- Direct edges: 47
- Symmetric rebuttal edges: 14
- Total attacks: 61

## Graph Statistics

- Density: 0.1993
- Isolated nodes: 1 (0.0556)
- SCCs: 6 (largest: 13)
- Cycles: True
- Attack type distribution: {'undermining': 32, 'rebuttal': 28, 'undercutting': 1}

## Formal Semantics

- Grounded: ['pro4b', 'pro82']
- Preferred: [['con140', 'con174', 'con189', 'con190', 'con229', 'con27', 'con36', 'pro4b', 'pro82'], ['pro15', 'pro15b', 'pro32', 'pro32b', 'pro32c', 'pro4', 'pro4b', 'pro82', 'pro95'], ['pro32', 'pro32b', 'pro32c', 'pro36', 'pro4', 'pro4b', 'pro82']]
- Stable: [['con140', 'con174', 'con189', 'con190', 'con229', 'con27', 'con36', 'pro4b', 'pro82'], ['pro15', 'pro15b', 'pro32', 'pro32b', 'pro32c', 'pro4', 'pro4b', 'pro82', 'pro95'], ['pro32', 'pro32b', 'pro32c', 'pro36', 'pro4', 'pro4b', 'pro82']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 14 | 18 | 148 | 61 | 0.1993 | 5.6% | 6 | 2 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 0.1993 | 3.3889 | 3.3889 | 1 | 91.8% | 45.9% | 52.5% | 1.6% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 21.827 | — |
| attack_extraction | 71 | — | 244.321 | 38 |
| prolog_solver | — | — | 0.429 | — |
| **total** | 85 | 66167 | 266.724 | 38 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:pro29` → **accept** — Shows that some criminals desire execution, undermining the premise that the death penalty is a threat to criminals
- `pro15:con229` → **accept** — The study’s claim of widespread trial errors attacks the premise that deserved punishment can be justly applied.
- `pro15:con140` → **accept** — Sanctioning killing as pay‑back directly contradicts the claim that deserved punishment morally restores order.
- `pro15b:pro36` → **accept** — Pro36 suggests death may not be sufficient deterrent, challenging the premise that deserved punishment fully compensates for harm.
- `pro15:pro36` → **accept** — pro36 questions the moral adequacy of death as final punishment, challenging pro15's premise that deserved punishment restores moral order

### Rejected / Skipped (max 5)
- `pro82:con36` → **skip** — The statements address different aspects (defendant preference vs wrongful execution) and do not directly contradict or undermine each other.
- `pro82:con189` → **skip** — One notes defendant insistence, the other highlights irreversibility; no direct logical conflict or premise attack.
- `pro82:con27` → **skip** — Different focus (defendant desire vs wrongful convictions) without direct rebuttal or undermining.
- `pro82:con174` → **skip** — Proverb about inequality does not directly contradict or attack the claim about defendant insistence.
- `pro82:con190` → **skip** — A fairness question about brain defects does not directly oppose the claim that some defendants want execution.

