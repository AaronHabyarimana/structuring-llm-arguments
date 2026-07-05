# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2117_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:17:53

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
- Arguments after atomization: 8

## Attack Extraction

- Pairs evaluated: 25
- Accepted pairs (accept/verify): 6
- Rejected/skipped: 19 (reject/verify-reject: 1, skip: 18)
- Verify calls: 2
- Verify accept rate: 50.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 6
- Symmetric rebuttal edges: 2
- Total attacks: 8

## Graph Statistics

- Density: 0.1429
- Isolated nodes: 1 (0.125)
- SCCs: 6 (largest: 3)
- Cycles: True
- Attack type distribution: {'undermining': 4, 'rebuttal': 4}

## Formal Semantics

- Grounded: ['con58', 'con63', 'con71', 'con71b', 'con71c']
- Preferred: [['con58', 'con63', 'con71', 'con71b', 'con71c']]
- Stable: [['con58', 'con63', 'con71', 'con71b', 'con71c']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 6 | 8 | 25 | 8 | 0.1429 | 12.5% | 6 | 5 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1429 | 1.0 | 1.0 | 1 | 100.0% | 50.0% | 50.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 20 | — | 59.764 | — |
| attack_extraction | 5 | — | 17.687 | 0 |
| prolog_solver | — | — | 0.126 | — |
| **total** | 25 | 11280 | 77.643 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro15:con63` → **accept** — The terrorist‑risk question challenges the premise that waste storage is safe and robust.
- `pro4:con71b` → **accept** — A high death estimate per melt‑down directly opposes the conclusion that nuclear power should be supported.
- `pro4:con71c` → **accept** — The claim of massive fatalities in rare meltdowns contradicts the pro stance that nuclear merits support.
- `pro4:con63` → **accept** — The terrorist‑risk question attacks the safety premise underlying the pro argument for nuclear energy.
- `pro4:con58` → **verify-accept** — Suggesting subsidies could be better spent elsewhere challenges the premise that nuclear investment is necessary for CO₂ reduction.

### Rejected / Skipped (max 5)
- `pro15:con71c` → **skip** — The claim about waste storage robustness does not directly conflict with or undermine the statistical death estimate from melt‑downs.
- `pro15:con58` → **skip** — A financial argument about subsidies does not target the safety premise of waste storage.
- `pro4:con71` → **skip** — Both statements can be true together; the low‑death estimate does not contradict the claim that nuclear is emission‑free and merits support.
- `con71:con63` → **skip** — One argument gives a death‑rate estimate, the other raises a terrorism question; they do not directly rebut or undermine each other.
- `con71:con58` → **skip** — A statistical safety claim and a financial allocation claim address different issues and do not attack each other.

