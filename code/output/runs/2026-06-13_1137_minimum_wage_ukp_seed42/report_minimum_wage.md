# Run Report: Minimum Wage

Run-ID: `2026-06-13_1137_minimum_wage_ukp_seed42`
Timestamp: 2026-06-13T11:37:29

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
- Arguments after atomization: 22

## Attack Extraction

- Pairs evaluated: 221
- Accepted pairs (accept/verify): 55
- Rejected/skipped: 162 (reject/verify-reject: 6, skip: 156)
- Verify calls: 9
- Verify accept rate: 33.3%
- Fallback calls (classify_single): 38
- Parse errors: 4

### Attack edges in graph

- Direct edges: 55
- Symmetric rebuttal edges: 4
- Total attacks: 59

## Graph Statistics

- Density: 0.1277
- Isolated nodes: 2 (0.0909)
- SCCs: 18 (largest: 3)
- Cycles: True
- Attack type distribution: {'undermining': 37, 'undercutting': 14, 'rebuttal': 8}

## Formal Semantics

- Grounded: ['con14b', 'con87', 'con87b', 'con87c', 'pro95', 'pro95b']
- Preferred: [['con12', 'con14', 'con14b', 'con18', 'con76', 'con76b', 'con87', 'con87b', 'con87c', 'pro36', 'pro95', 'pro95b'], ['con12', 'con14b', 'con87', 'con87b', 'con87c', 'pro29', 'pro36', 'pro4', 'pro95', 'pro95b'], ['con14b', 'con70', 'con70b', 'con87', 'con87b', 'con87c', 'pro29', 'pro4', 'pro4b', 'pro95', 'pro95b']]
- Stable: [['con12', 'con14', 'con14b', 'con18', 'con76', 'con76b', 'con87', 'con87b', 'con87c', 'pro36', 'pro95', 'pro95b'], ['con12', 'con14b', 'con87', 'con87b', 'con87c', 'pro29', 'pro36', 'pro4', 'pro95', 'pro95b'], ['con14b', 'con70', 'con70b', 'con87', 'con87b', 'con87c', 'pro29', 'pro4', 'pro4b', 'pro95', 'pro95b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 14 | 22 | 221 | 59 | 0.1277 | 9.1% | 18 | 6 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 0.1277 | 2.6818 | 2.6818 | 2 | 88.1% | 13.6% | 62.7% | 23.7% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 25.706 | — |
| attack_extraction | 85 | — | 295.156 | 38 |
| prolog_solver | — | — | 0.213 | — |
| **total** | 99 | 96362 | 321.213 | 38 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con18` → **accept** — Con18 challenges the premise that higher wages will simply reduce teen hours by suggesting employers may replace workers with automation
- `pro82:con14` → **accept** — Con argues firms may outsource, threatening the premise that teens will retain jobs to work fewer hours.
- `pro82:con14b` → **accept** — Con claims outsourcing reduces American jobs, undermining the premise that teen employment will persist.
- `pro82:con87c` → **accept** — Con says a wage hike is only a bandage, suggesting the pro conclusion about teen study time does not follow.
- `pro82:con12` → **accept** — Con asserts higher wages force firms to cut staff, undermining the premise that teens can keep jobs and work fewer hours.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — No logical incompatibility or premise conflict
- `pro82:pro4` → **skip** — Arguments address different aspects; no attack
- `pro82:pro4b` → **skip** — No contradiction or premise challenge
- `pro82:pro95` → **skip** — Pro95 supports need for higher wages, not an attack
- `pro82:pro95b` → **skip** — Provides context, not a rebuttal or undermining

