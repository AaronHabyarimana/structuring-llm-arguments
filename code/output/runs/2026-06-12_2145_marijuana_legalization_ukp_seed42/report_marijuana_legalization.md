# Run Report: Marijuana Legalization

Run-ID: `2026-06-12_2145_marijuana_legalization_ukp_seed42`
Timestamp: 2026-06-12T21:45:07

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
- Arguments after atomization: 19

## Attack Extraction

- Pairs evaluated: 163
- Accepted attacks: 11
- Rejected/skipped: 152 (reject/verify-reject: 11, skip: 141)
- Verify calls: 12
- Verify accept rate: 8.3%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0439
- Isolated nodes: 7 (0.3684)
- SCCs: 15 (largest: 4)
- Cycles: True
- Attack type distribution: {'undercutting': 2, 'rebuttal': 8, 'undermining': 5}

## Formal Semantics

- Grounded: ['con12', 'con70', 'con87', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82']
- Preferred: [['con115', 'con12', 'con18', 'con70', 'con87', 'con95', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82'], ['con115', 'con12', 'con70', 'con87', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro82'], ['con12', 'con18', 'con70', 'con87', 'con95', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro4d', 'pro82'], ['con12', 'con70', 'con87', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro4d', 'pro82']]
- Stable: [['con115', 'con12', 'con18', 'con70', 'con87', 'con95', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82'], ['con115', 'con12', 'con70', 'con87', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro82'], ['con12', 'con18', 'con70', 'con87', 'con95', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro4d', 'pro82'], ['con12', 'con70', 'con87', 'pro15', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro4d', 'pro82']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 14 | 19 | 163 | 15 | 0.0439 | 36.8% | 15 | 12 | 4 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 0.0439 | 0.7895 | 0.7895 | 7 | 100.0% | 53.3% | 33.3% | 13.3% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 41 | — | 122.253 | — |
| attack_extraction | 35 | — | 135.222 | 0 |
| prolog_solver | — | — | 0.148 | — |
| **total** | 76 | 56741 | 257.669 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro15:con14` → **accept** — The claim that legalization increases child accessibility challenges the conclusion that legalization leads to improved regulation.
- `pro4b:con18` → **accept** — B claims habitual users are stupid, contradicting A's implied pro‑legalization conclusion about reducing social costs.
- `pro4b:con95` → **accept** — B asserts lasting IQ loss from use, opposing A's pro‑legalization stance on social benefits.
- `pro4b:con14` → **accept** — B argues legalization raises child access, directly conflicting with A's argument that prohibition's social costs justify legalization.
- `pro4d:con115` → **accept** — Pro4d claims prohibition wastes resources (implying legalization is beneficial) while con115 asserts legalization harms the community, making the conclusions mutually exclusive.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both arguments are compatible pro claims; no logical conflict or premise attack.
- `pro82:pro15b` → **skip** — Tax‑revenue claim does not contradict or undermine dispute‑settlement claim.
- `pro82:pro4` → **skip** — Editorial advocacy is unrelated to the creation of dispute‑settlement mechanisms.
- `pro82:pro4b` → **skip** — Addressing social costs does not conflict with or attack the dispute‑settlement claim.
- `pro82:pro4c` → **skip** — Discussion of racist history does not oppose the claim about dispute mechanisms.

