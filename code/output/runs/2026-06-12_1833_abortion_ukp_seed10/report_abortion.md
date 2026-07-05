# Run Report: Abortion

Run-ID: `2026-06-12_1833_abortion_ukp_seed10`
Timestamp: 2026-06-12T18:33:58

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
- Arguments after atomization: 19

## Attack Extraction

- Pairs evaluated: 161
- Accepted attacks: 35
- Rejected/skipped: 120 (reject/verify-reject: 0, skip: 120)
- Verify calls: 2
- Verify accept rate: 100.0%
- Fallback calls (classify_single): 44
- Parse errors: 6

## Graph Statistics

- Density: 0.1491
- Isolated nodes: 2 (0.1053)
- SCCs: 9 (largest: 11)
- Cycles: True
- Attack type distribution: {'rebuttal': 32, 'undermining': 10, 'undercutting': 9}

## Formal Semantics

- Grounded: ['con126b', 'con42', 'con84', 'con84b', 'con84c', 'con84d', 'pro124', 'pro9']
- Preferred: [['con126', 'con126b', 'con126c', 'con134', 'con134b', 'con42', 'con72', 'con84', 'con84b', 'con84c', 'con84d', 'con9', 'pro124', 'pro9'], ['con126', 'con126b', 'con126c', 'con42', 'con84', 'con84b', 'con84c', 'con84d', 'pro110', 'pro124', 'pro9'], ['con126b', 'con20', 'con42', 'con72', 'con84', 'con84b', 'con84c', 'con84d', 'con9', 'pro119', 'pro124', 'pro9'], ['con126b', 'con42', 'con84', 'con84b', 'con84c', 'con84d', 'pro110', 'pro119', 'pro124', 'pro9']]
- Stable: [['con126', 'con126b', 'con126c', 'con134', 'con134b', 'con42', 'con72', 'con84', 'con84b', 'con84c', 'con84d', 'con9', 'pro124', 'pro9'], ['con126', 'con126b', 'con126c', 'con42', 'con84', 'con84b', 'con84c', 'con84d', 'pro110', 'pro124', 'pro9'], ['con126b', 'con20', 'con42', 'con72', 'con84', 'con84b', 'con84c', 'con84d', 'con9', 'pro119', 'pro124', 'pro9'], ['con126b', 'con42', 'con84', 'con84b', 'con84c', 'con84d', 'pro110', 'pro119', 'pro124', 'pro9']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 19 | 161 | 51 | 0.1491 | 10.5% | 9 | 8 | 4 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.1491 | 2.6842 | 2.6842 | 2 | 98.0% | 62.7% | 19.6% | 17.6% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 20.475 | — |
| attack_extraction | 78 | — | 248.258 | 44 |
| prolog_solver | — | — | 0.15 | — |
| **total** | 92 | 66797 | 268.986 | 44 |

## Qualitative Examples

### Accepted (max 5)
- `pro110:con20` → **accept** — B asserts it is reckless and morally wrong to treat the fetus as lacking a right to life, directly contradicting A's claim that the fetus has no right to life.
- `pro110:con72` → **accept** — Pro110 denies any right to life, while con72 asserts a governmental duty to protect that life, making their conclusions mutually exclusive.
- `pro110:con9` → **accept** — Con9 presumes a point where human identity begins, implying a right to life, which conflicts with pro110's claim that the fetus never has such a right.
- `pro110:con134` → **accept** — Con134 states identity begins at day 14, contradicting pro110's assertion that the fetus is never a person with a right to life.
- `pro110:con134b` → **accept** — Con134b claims abortion becomes impermissible after two weeks, implying personhood, opposing pro110's denial of any fetal rights.

### Rejected / Skipped (max 5)
- `pro9:con126` → **skip** — Conclusions address different issues (child prospects vs fetal relationship) and do not directly contradict or attack premises.
- `pro9:con126b` → **skip** — B focuses on moral status of abortion; A discusses planned child outcomes, no direct conflict.
- `pro9:con126c` → **skip** — B argues consent/duty; A argues preparedness of caregivers—no clear rebuttal, undercutting, or undermining.
- `pro9:con84` → **skip** — B raises health risks of abortion; A discusses benefits of planned children—different topics, no direct attack.
- `pro9:con84b` → **skip** — Medical risk claim does not directly challenge A's premise about caregiver preparedness.

