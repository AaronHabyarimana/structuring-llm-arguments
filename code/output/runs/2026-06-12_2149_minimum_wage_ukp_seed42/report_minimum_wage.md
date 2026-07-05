# Run Report: Minimum Wage

Run-ID: `2026-06-12_2149_minimum_wage_ukp_seed42`
Timestamp: 2026-06-12T21:49:25

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
- Arguments after atomization: 23

## Attack Extraction

- Pairs evaluated: 238
- Accepted attacks: 48
- Rejected/skipped: 185 (reject/verify-reject: 4, skip: 181)
- Verify calls: 7
- Verify accept rate: 42.9%
- Fallback calls (classify_single): 41
- Parse errors: 5

## Graph Statistics

- Density: 0.1087
- Isolated nodes: 5 (0.2174)
- SCCs: 15 (largest: 9)
- Cycles: True
- Attack type distribution: {'undermining': 34, 'undercutting': 7, 'rebuttal': 14}

## Formal Semantics

- Grounded: ['con14', 'con14b', 'con87', 'con87b', 'con87c', 'pro15', 'pro29b', 'pro32']
- Preferred: [['con12', 'con14', 'con14b', 'con18', 'con87', 'con87b', 'con87c', 'con87d', 'con87e', 'pro15', 'pro29b', 'pro32'], ['con14', 'con14b', 'con87', 'con87b', 'con87c', 'pro15', 'pro29b', 'pro32', 'pro36', 'pro4', 'pro95b']]
- Stable: [['con12', 'con14', 'con14b', 'con18', 'con87', 'con87b', 'con87c', 'con87d', 'con87e', 'pro15', 'pro29b', 'pro32'], ['con14', 'con14b', 'con87', 'con87b', 'con87c', 'pro15', 'pro29b', 'pro32', 'pro36', 'pro4', 'pro95b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 14 | 23 | 238 | 55 | 0.1087 | 21.7% | 15 | 8 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Minimum Wage | 0.1087 | 2.3913 | 2.3913 | 5 | 80.0% | 25.5% | 61.8% | 12.7% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 21.279 | — |
| attack_extraction | 86 | — | 295.255 | 41 |
| prolog_solver | — | — | 0.143 | — |
| **total** | 100 | 91267 | 316.743 | 41 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con14` → **accept** — Con argues jobs may be outsourced, threatening the availability of teen jobs that pro assumes.
- `pro82:con14b` → **accept** — Con claims outsourcing reduces American jobs, undermining the premise that teens will have jobs to work fewer hours.
- `pro82:con87d` → **accept** — Con suggests the wage hike is merely a bandage, challenging the inference that it will meaningfully benefit teens.
- `pro82:con87e` → **accept** — Con declares the wage hike ineffective, undercutting the pro conclusion that it will give teens more study time.
- `pro82:con70` → **accept** — Con predicts full cost pass‑through to consumers, undermining the premise that higher wages translate to higher net earnings for teens.

### Rejected / Skipped (max 5)
- `pro82:con87` → **skip** — Con attacks politicians' motives, not the pro conclusion or its premises.
- `pro82:con87b` → **skip** — Focuses on alleged exploitation, which does not rebut or undermine the pro claim.
- `pro82:con87c` → **skip** — States public unintelligence, unrelated to the pro argument's claim about teen study time.
- `pro82:pro4` → **skip** — pro4 discusses productivity versus wage growth and does not directly contradict or attack pro82’s claim about teen study time.
- `pro82:pro95` → **skip** — pro95 highlights low wages for many workers, which supports rather than attacks the pro82 argument.

