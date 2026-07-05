# Run Report: Autonomous Vehicles

Run-ID: `2026-06-09_2057_autonomous_vehicles_llm`
Timestamp: 2026-06-09T20:57:41

## Configuration

| Key | Value |
|---|---|
| Source | llm |
| Split | None |
| Limit | 20 |
| Balanced | None |
| Seed | None |
| Atomize | False |
| Batch size | 10 |
| Max workers | 2 |
| Confidence accept | 70 |
| Confidence verify | 50 |
| Model (extract) | GPT OSS 120B |
| Model (attacks) | GPT OSS 120B |

## Dataset / Arguments

- Source: llm
- Split: None
- Arguments before atomization: 20
- Arguments after atomization: 20

## Attack Extraction

- Pairs evaluated: 190
- Accepted attacks: 50
- Rejected/skipped: 140 (reject/verify-reject: 8, skip: 132)
- Verify calls: 10
- Verify accept rate: 20.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1316
- Isolated nodes: 1 (0.05)
- SCCs: 20 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 48, 'undercutting': 2}

## Formal Semantics

- Grounded: ['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro4']
- Preferred: [['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro4']]
- Stable: [['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro4']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Autonomous Vehicles | 20 | 20 | 190 | 50 | 0.1316 | 5.0% | 20 | 9 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Autonomous Vehicles | 0.1316 | 2.5 | 2.5 | 1 | 92.0% | 0.0% | 96.0% | 4.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 0 | — | — | — |
| attack_extraction | 29 | — | 108.817 | 0 |
| prolog_solver | — | — | 0.893 | — |
| **total** | 30 | 50072 | 116.861 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro1:con1` → **accept** — Con argument cites cybersecurity vulnerabilities that could cause accidents, challenging the safety premise of pro1.
- `pro1:con3` → **accept** — The weather‑performance issue challenges the premise that autonomous vehicles can safely reduce accidents
- `pro1:con9` → **accept** — Potential sensor failures undermine the premise that autonomous vehicles will lower accident rates
- `pro2:con1` → **accept** — Cybersecurity vulnerabilities could prevent the reliable vehicle‑spacing optimization that underlies the capacity claim.
- `pro2:con3` → **accept** — Poor performance in unpredictable weather could disrupt the precise spacing needed for increased capacity.

### Rejected / Skipped (max 5)
- `pro1:pro2` → **skip** — No direct conflict or premise attack identified.
- `pro1:pro3` → **skip** — No direct conflict or premise attack identified.
- `pro1:pro4` → **skip** — No direct conflict or premise attack identified.
- `pro1:pro5` → **skip** — No direct conflict or premise attack identified.
- `pro1:pro6` → **skip** — No direct conflict or premise attack identified.

