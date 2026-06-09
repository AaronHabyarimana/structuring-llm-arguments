# Run Report: School Uniforms

Run-ID: `2026-06-06_1852_school_uniforms_ukp_seed10`
Timestamp: 2026-06-06T18:52:48

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
- Arguments after atomization: 28

## Attack Extraction

- Pairs evaluated: 345
- Accepted attacks: 90
- Rejected/skipped: 249 (reject/verify-reject: 25, skip: 224)
- Verify calls: 29
- Verify accept rate: 13.8%
- Fallback calls (classify_single): 52
- Parse errors: 6

## Graph Statistics

- Density: 0.119
- Isolated nodes: 1 (0.0357)
- SCCs: 28 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 51, 'rebuttal': 39}

## Formal Semantics

- Grounded: ['con126', 'con134b', 'con20', 'con42', 'con72', 'con72b', 'con72c', 'con72e', 'con72f', 'con84', 'con9', 'pro60']
- Preferred: [['con126', 'con134b', 'con20', 'con42', 'con72', 'con72b', 'con72c', 'con72e', 'con72f', 'con84', 'con9', 'pro60']]
- Stable: [['con126', 'con134b', 'con20', 'con42', 'con72', 'con72b', 'con72c', 'con72e', 'con72f', 'con84', 'con9', 'pro60']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| School Uniforms | 14 | 28 | 345 | 90 | 0.119 | 3.6% | 28 | 12 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| School Uniforms | 0.119 | 3.2143 | 3.2143 | 1 | 96.7% | 43.3% | 56.7% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 22.653 | — |
| attack_extraction | 137 | — | 494.074 | 52 |
| prolog_solver | — | — | 0.218 | — |
| **total** | 151 | 123398 | 517.051 | 52 |

## Qualitative Examples

### Accepted (max 5)
- `pro74:con134` → **accept** — Con134 asserts uniforms do not stop bullying, suggesting they may not improve discipline as claimed by pro74.
- `pro74:con134b` → **accept** — B claims uniforms increase violent attacks, directly contradicting A's claim of positive impact on discipline.
- `pro74b:con42` → **accept** — The slippery‑slope claim questions the premise that uniforms positively affect community image.
- `pro74b:con9` → **accept** — It directly contests the overall benefit by arguing uniforms hinder students' transition to adulthood.
- `pro74b:con134` → **accept** — Stating uniforms don’t stop bullying attacks the premise that they improve the school’s image.

### Rejected / Skipped (max 5)
- `pro74:pro5` → **skip** — Both arguments are pro‑uniform and do not contradict or challenge each other's premises or conclusions.
- `pro74:pro5b` → **skip** — Both arguments support uniforms; there is no direct contradiction or premise attack.
- `pro74:pro55` → **skip** — Pro55 provides additional evidence for positive impact, not an attack on pro74.
- `pro74:pro62` → **skip** — Pro62 reinforces the discipline benefit and does not undermine pro74.
- `pro74:pro2` → **skip** — Pro2 adds moral benefits, which are compatible with pro74's claim.

