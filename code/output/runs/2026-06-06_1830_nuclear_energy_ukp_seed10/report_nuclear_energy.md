# Run Report: Nuclear Energy

Run-ID: `2026-06-06_1830_nuclear_energy_ukp_seed10`
Timestamp: 2026-06-06T18:30:13

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
- Arguments after atomization: 22

## Attack Extraction

- Pairs evaluated: 222
- Accepted attacks: 52
- Rejected/skipped: 170 (reject/verify-reject: 14, skip: 156)
- Verify calls: 19
- Verify accept rate: 26.3%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1126
- Isolated nodes: 3 (0.1364)
- SCCs: 22 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 37, 'rebuttal': 8, 'undercutting': 7}

## Formal Semantics

- Grounded: ['con126', 'con134', 'con134b', 'con168', 'con72', 'con72b', 'con84', 'con9b', 'pro2', 'pro55b', 'pro5b', 'pro62', 'pro74']
- Preferred: [['con126', 'con134', 'con134b', 'con168', 'con72', 'con72b', 'con84', 'con9b', 'pro2', 'pro55b', 'pro5b', 'pro62', 'pro74']]
- Stable: [['con126', 'con134', 'con134b', 'con168', 'con72', 'con72b', 'con84', 'con9b', 'pro2', 'pro55b', 'pro5b', 'pro62', 'pro74']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 14 | 22 | 222 | 52 | 0.1126 | 13.6% | 22 | 13 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1126 | 2.3636 | 2.3636 | 3 | 92.3% | 15.4% | 71.2% | 13.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 24.983 | — |
| attack_extraction | 76 | — | 290.94 | 0 |
| prolog_solver | — | — | 0.231 | — |
| **total** | 90 | 77873 | 316.27 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro5:pro2` → **accept** — The safety concerns about Soviet-designed reactors challenge the premise that nuclear is safer than hydro and liquefied gas.
- `pro5:con126` → **accept** — The con argument recommends renewables instead, directly contradicting the pro claim that other sources are the biggest killers and implying nuclear is unnecessary.
- `pro5:con72` → **accept** — It asserts catastrophic environmental contamination from nuclear, challenging the premise that hydro and gas are the greatest killers.
- `pro5:con72b` → **accept** — It highlights catastrophic health costs of mining, undermining the pro premise that hydro and gas are the worst hazards.
- `pro5:con168` → **accept** — It points out radiation management problems, attacking the pro claim that other sources are the biggest threats.

### Rejected / Skipped (max 5)
- `pro74:pro60b` → **skip** — Emission reduction does not address cost effectiveness.
- `pro74:con126` → **skip** — Claiming nuclear emissions are very low challenges the conclusion that renewables should be preferred.
- `pro74:con72` → **skip** — Low emissions do not refute claims of catastrophic environmental contamination.
- `pro74:con72b` → **skip** — Emission data is unrelated to miners' health costs.
- `pro74:con168` → **skip** — Emission levels do not address difficulties of handling radiation waste.

