# Run Report: Cloning

Run-ID: `2026-06-06_1714_cloning_ukp_seed10`
Timestamp: 2026-06-06T17:14:01

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

- Pairs evaluated: 159
- Accepted attacks: 31
- Rejected/skipped: 128 (reject/verify-reject: 9, skip: 119)
- Verify calls: 10
- Verify accept rate: 10.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0906
- Isolated nodes: 1 (0.0526)
- SCCs: 19 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 20, 'rebuttal': 9, 'undercutting': 2}

## Formal Semantics

- Grounded: ['con126', 'con134', 'con20', 'con42', 'con42b', 'con42c', 'con42d', 'con42e', 'con72', 'con84b', 'con9', 'pro119']
- Preferred: [['con126', 'con134', 'con20', 'con42', 'con42b', 'con42c', 'con42d', 'con42e', 'con72', 'con84b', 'con9', 'pro119']]
- Stable: [['con126', 'con134', 'con20', 'con42', 'con42b', 'con42c', 'con42d', 'con42e', 'con72', 'con84b', 'con9', 'pro119']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 14 | 19 | 159 | 31 | 0.0906 | 5.3% | 19 | 12 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 0.0906 | 1.6316 | 1.6316 | 1 | 96.8% | 29.0% | 64.5% | 6.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 36.287 | — |
| attack_extraction | 26 | — | 107.588 | 0 |
| prolog_solver | — | — | 9.178 | — |
| **total** | 40 | 59184 | 153.226 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro9:con9` → **accept** — Con9 challenges the safety premise underlying pro9's claim that cloning could simplify organ transplants.
- `pro9:con126` → **accept** — Con126 attacks the ethical premise of pro9 by highlighting potential exploitation in large‑scale cloning.
- `pro9:con84b` → **accept** — Con84b directly undermines the assumption that cloning can safely simplify organ transplants by citing high failure rates.
- `pro9:con42` → **accept** — Con42 challenges the feasibility premise of cloning by claiming adoption is easier than cloning.
- `pro9:con42b` → **accept** — Con42b attacks the cost‑effectiveness premise of cloning by stating adoption is much cheaper.

### Rejected / Skipped (max 5)
- `pro9:con42d` → **skip** — The statements address different issues and do not directly contradict or attack each other.
- `pro9:con42e` → **skip** — The arguments focus on separate moral considerations without direct conflict.
- `pro9:con134` → **skip** — Con134 raises societal concerns unrelated to the feasibility of organ transplantation.
- `pro9:con20` → **skip** — Con20 discusses a speculative societal risk that does not directly oppose the organ‑transplant claim.
- `pro9b:pro124` → **skip** — Both arguments are supportive of cloning and do not contradict each other.

