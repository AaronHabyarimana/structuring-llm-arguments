# Run Report: Gun Control

Run-ID: `2026-06-06_1843_gun_control_ukp_seed10`
Timestamp: 2026-06-06T18:43:11

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

- Pairs evaluated: 130
- Accepted attacks: 52
- Rejected/skipped: 74 (reject/verify-reject: 4, skip: 70)
- Verify calls: 5
- Verify accept rate: 20.0%
- Fallback calls (classify_single): 36
- Parse errors: 4

## Graph Statistics

- Density: 0.1912
- Isolated nodes: 0 (0.0)
- SCCs: 9 (largest: 9)
- Cycles: True
- Attack type distribution: {'rebuttal': 28, 'undermining': 22, 'undercutting': 2}

## Formal Semantics

- Grounded: ['pro110', 'pro110b', 'pro124', 'pro124b', 'pro147', 'pro148', 'pro4', 'pro9b', 'pro9c']
- Preferred: [['pro110', 'pro110b', 'pro124', 'pro124b', 'pro147', 'pro148', 'pro4', 'pro9b', 'pro9c']]
- Stable: [['pro110', 'pro110b', 'pro124', 'pro124b', 'pro147', 'pro148', 'pro4', 'pro9b', 'pro9c']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 14 | 17 | 130 | 52 | 0.1912 | 0.0% | 9 | 9 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 0.1912 | 3.0588 | 3.0588 | 0 | 84.6% | 53.8% | 42.3% | 3.8% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 20.013 | — |
| attack_extraction | 68 | — | 218.542 | 36 |
| prolog_solver | — | — | 0.244 | — |
| **total** | 82 | 59036 | 238.927 | 36 |

## Qualitative Examples

### Accepted (max 5)
- `pro147:con126` → **accept** — B's sarcastic question implies the Second Amendment should be unlimited, contradicting A's claim it is not unlimited.
- `pro9:pro110b` → **verify-accept** — Pro110b declares the pro‑gun argument false, directly contradicting Pro9's implication that weapons are a defensive tool.
- `pro9:pro124` → **accept** — Pro124 shifts blame to mental illness and legal access, challenging the premise that the weapons themselves are the primary problem highlighted by Pro9.
- `pro9:pro124b` → **accept** — Pro124b argues that restricting legal channels would reduce shooter access, undermining Pro9's claim about inherent weapon danger.
- `pro9:con126` → **accept** — A shows that even if the constitutional right exists, the conclusion that no gun restrictions should follow is not warranted due to the weapons' dangerous effects

### Rejected / Skipped (max 5)
- `pro147:pro9` → **skip** — Neither argument directly contradicts nor attacks the other's premise or conclusion
- `pro147:pro9b` → **skip** — The statements address weapon purpose, not the scope of the Second Amendment right
- `pro147:pro9c` → **skip** — B’s claim about utility does not rebut or undermine A’s claim about rights being limited
- `pro147:pro110` → **skip** — Statistical safety claim does not directly contradict or attack the notion of limited rights
- `pro147:pro110b` → **skip** — General critique of pro‑gun arguments does not target A’s specific claim about rights not being unlimited

