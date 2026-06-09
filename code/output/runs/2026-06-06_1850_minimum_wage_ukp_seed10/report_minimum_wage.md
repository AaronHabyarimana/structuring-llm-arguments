# Run Report: Minimum Wage

Run-ID: `2026-06-06_1850_minimum_wage_ukp_seed10`
Timestamp: 2026-06-06T18:50:09

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 15 |
| Balanced | True |
| Seed | 10 |
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
- Arguments after atomization: 17

## Attack Extraction

- Pairs evaluated: 132
- Accepted attacks: 49
- Rejected/skipped: 83 (reject/verify-reject: 2, skip: 81)
- Verify calls: 5
- Verify accept rate: 60.0%
- Fallback calls (classify_single): 2
- Parse errors: 0

## Graph Statistics

- Density: 0.1801
- Isolated nodes: 2 (0.1176)
- SCCs: 17 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 41, 'rebuttal': 6, 'undercutting': 2}

## Formal Semantics

- Grounded: ['con104', 'con105', 'con106', 'con106b', 'con21', 'con36', 'con36b', 'pro5']
- Preferred: [['con104', 'con105', 'con106', 'con106b', 'con21', 'con36', 'con36b', 'pro5']]
- Stable: [['con104', 'con105', 'con106', 'con106b', 'con21', 'con36', 'con36b', 'pro5']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 14 | 17 | 132 | 49 | 0.1801 | 11.8% | 17 | 8 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 0.1801 | 2.8824 | 2.8824 | 2 | 71.4% | 12.2% | 83.7% | 4.1% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 20 | — | 52.839 | — |
| attack_extraction | 22 | — | 106.214 | 2 |
| prolog_solver | — | — | 0.262 | — |
| **total** | 42 | 59971 | 159.389 | 2 |

## Qualitative Examples

### Accepted (max 5)
- `pro74:con105` → **accept** — Con105 shows that raising the wage can increase a worker's net need for assistance, challenging the claim of saved government spending.
- `pro74:con106` → **verify-accept** — Con106 suggests higher wages may force layoffs, potentially increasing government aid costs, undermining the projected savings.
- `pro74:con106b` → **accept** — B claims layoffs will increase reliance on income‑support, challenging the premise that the wage hike will cut $7.6 B in spending.
- `pro74:con36` → **accept** — B argues higher labor cost in low‑cost regions, undermining the assumption that the increase will generate the reported savings.
- `pro74:con36b` → **accept** — B says low‑cost area firms cannot raise prices, questioning the premise that the wage rise will reduce government outlays.

### Rejected / Skipped (max 5)
- `pro74:pro5` → **skip** — The statements address different topics and do not contradict or challenge each other.
- `pro74:pro55` → **skip** — One reports fiscal savings, the other states a legal requirement; no direct conflict.
- `pro74:pro62` → **skip** — Pro62 critiques wealth distribution but does not refute the fiscal saving claim of pro74.
- `pro74:pro2` → **skip** — Pro2 offers an educational benefit unrelated to the spending reduction claim.
- `pro74:pro2b` → **skip** — Pro2b discusses dropout rates, which does not attack the fiscal argument.

