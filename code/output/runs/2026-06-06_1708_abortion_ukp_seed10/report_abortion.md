# Run Report: Abortion

Run-ID: `2026-06-06_1708_abortion_ukp_seed10`
Timestamp: 2026-06-06T17:08:57

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
- Arguments after atomization: 15

## Attack Extraction

- Pairs evaluated: 99
- Accepted attacks: 16
- Rejected/skipped: 83 (reject/verify-reject: 3, skip: 80)
- Verify calls: 3
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0762
- Isolated nodes: 1 (0.0667)
- SCCs: 15 (largest: 1)
- Cycles: False
- Attack type distribution: {'rebuttal': 10, 'undermining': 5, 'undercutting': 1}

## Formal Semantics

- Grounded: ['con134', 'con134b', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro5']
- Preferred: [['con134', 'con134b', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro5']]
- Stable: [['con134', 'con134b', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro5']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 15 | 99 | 16 | 0.0762 | 6.7% | 15 | 9 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.0762 | 1.0667 | 1.0667 | 1 | 93.8% | 62.5% | 31.2% | 6.2% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 26.134 | — |
| attack_extraction | 13 | — | 67.806 | 0 |
| prolog_solver | — | — | 2.262 | — |
| **total** | 27 | 43722 | 96.385 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro5:con72` → **accept** — The claim that abortion burdens a woman's conscience directly opposes the implication that abortion is an acceptable solution for caring difficulties.
- `pro62:con42` → **accept** — B argues that the persistence of abortion does not justify its legality, directly contradicting A's implication that legality is acceptable because rates are unchanged
- `pro62:con9` → **accept** — B challenges the safety premise implied by A by presenting CDC data on abortion-related deaths
- `pro2:con20` → **accept** — B argues that presenting fetal development weakens the view that the fetus is not a person, directly contradicting A's conclusion.
- `pro2b:con72` → **accept** — B claims abortion burdens conscience and soul, directly contradicting A's claim that abortion is morally permissible.

### Rejected / Skipped (max 5)
- `pro5:con9c` → **skip** — The statements address unrelated topics and do not conflict.
- `pro5:con134` → **skip** — The arguments concern different issues and do not contradict or undermine each other.
- `pro5:con134b` → **skip** — No direct contradiction or premise attack is present between the two claims.
- `pro5:con20` → **skip** — The arguments focus on distinct aspects and do not attack one another.
- `pro62:pro2` → **skip** — Both are supportive arguments and do not oppose each other.

