# Run Report: Death Penalty

Run-ID: `2026-06-06_1841_death_penalty_ukp_seed10`
Timestamp: 2026-06-06T18:41:14

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

- Pairs evaluated: 127
- Accepted attacks: 36
- Rejected/skipped: 91 (reject/verify-reject: 1, skip: 90)
- Verify calls: 1
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1324
- Isolated nodes: 2 (0.1176)
- SCCs: 17 (largest: 1)
- Cycles: False
- Attack type distribution: {'rebuttal': 14, 'undermining': 22}

## Formal Semantics

- Grounded: ['con211', 'con42', 'con72', 'pro27', 'pro27b', 'pro27c', 'pro27d']
- Preferred: [['con211', 'con42', 'con72', 'pro27', 'pro27b', 'pro27c', 'pro27d']]
- Stable: [['con211', 'con42', 'con72', 'pro27', 'pro27b', 'pro27c', 'pro27d']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 14 | 17 | 127 | 36 | 0.1324 | 11.8% | 17 | 7 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 0.1324 | 2.1176 | 2.1176 | 2 | 72.2% | 38.9% | 61.1% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 23.389 | — |
| attack_extraction | 15 | — | 93.597 | 0 |
| prolog_solver | — | — | 0.213 | — |
| **total** | 29 | 51854 | 117.325 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro74:pro60` → **accept** — B's claim that life is sacred directly contradicts A's conclusion that people will favor capital punishment.
- `pro74:con211` → **accept** — B challenges the premise that people can weigh arguments properly by highlighting systemic injustice.
- `pro74:con72` → **accept** — B asserts that 'eye for an eye' is simplistic, directly opposing A's implication that empathy leads to support for capital punishment.
- `pro74:con208` → **accept** — B characterizes the death penalty as revenge, undermining A's premise that empathy, not vengeance, drives support.
- `pro5:pro60` → **accept** — pro60’s claim that life is sacred directly opposes the implied conclusion that reinstating the death penalty is justified

### Rejected / Skipped (max 5)
- `pro74:pro5` → **skip** — B does not contradict or challenge A's premise or conclusion
- `pro74:pro55` → **skip** — B's claim about severity of punishment is unrelated to A's empathy premise
- `pro74:pro55b` → **skip** — B addresses necessity of punishment, not A's argument about empathy influencing support
- `pro74:pro62` → **skip** — B's fairness claim does not rebut or undermine A's conditional claim
- `pro74:pro62b` → **skip** — B's fairness statement is unrelated to A's premise about empathy

