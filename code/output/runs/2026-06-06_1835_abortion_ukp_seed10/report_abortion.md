# Run Report: Abortion

Run-ID: `2026-06-06_1835_abortion_ukp_seed10`
Timestamp: 2026-06-06T18:35:30

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
- Arguments after atomization: 14

## Attack Extraction

- Pairs evaluated: 85
- Accepted attacks: 21
- Rejected/skipped: 64 (reject/verify-reject: 3, skip: 61)
- Verify calls: 3
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1154
- Isolated nodes: 0 (0.0)
- SCCs: 14 (largest: 1)
- Cycles: False
- Attack type distribution: {'rebuttal': 14, 'undermining': 6, 'undercutting': 1}

## Formal Semantics

- Grounded: ['con134', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro55']
- Preferred: [['con134', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro55']]
- Stable: [['con134', 'con20', 'con42', 'con72b', 'con9', 'con9b', 'con9c', 'pro55']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 14 | 85 | 21 | 0.1154 | 0.0% | 14 | 8 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.1154 | 1.5 | 1.5 | 0 | 90.5% | 66.7% | 28.6% | 4.8% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 27.596 | — |
| attack_extraction | 12 | — | 60.53 | 0 |
| prolog_solver | — | — | 0.227 | — |
| **total** | 26 | 41687 | 88.448 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro2b:con72` → **accept** — B claims abortion burdens conscience, contradicting A's implication that abortion is permissible.
- `pro2b:con9b` → **accept** — B asserts that abortion deaths are underreported, strengthening the rebuttal against A's permissive claim.
- `pro55:con72` → **accept** — A's finding that 95 % felt it was the right decision directly contradicts B's claim that abortion burdens the woman's conscience and soul.
- `pro2c:con9b` → **accept** — con9b challenges the safety premise that underlies the moral permissibility claim of pro2c
- `pro2c:con9c` → **accept** — con9c disputes the premise that abortion poses minimal risk to women, which pro2c may rely on

### Rejected / Skipped (max 5)
- `pro55:con134` → **skip** — The statements address unrelated issues and do not contradict or undermine each other.
- `pro55:con134b` → **skip** — B presents a different moral premise that does not directly challenge A's claim about women's satisfaction.
- `pro55:con20` → **skip** — B's argument about child development does not attack A's statistical finding.
- `pro2b:pro27` → **skip** — Both arguments are compatible, with B providing a premise that supports A.
- `pro2b:pro60` → **skip** — The arguments are independent and mutually supportive rather than antagonistic.

