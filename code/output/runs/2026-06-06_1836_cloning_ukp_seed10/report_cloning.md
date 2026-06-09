# Run Report: Cloning

Run-ID: `2026-06-06_1836_cloning_ukp_seed10`
Timestamp: 2026-06-06T18:36:58

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

- Pairs evaluated: 162
- Accepted attacks: 38
- Rejected/skipped: 119 (reject/verify-reject: 0, skip: 119)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 38
- Parse errors: 5

## Graph Statistics

- Density: 0.1111
- Isolated nodes: 1 (0.0526)
- SCCs: 19 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 28, 'undercutting': 8, 'rebuttal': 2}

## Formal Semantics

- Grounded: ['con126', 'con126b', 'con134', 'con42', 'con42b', 'con42c', 'con42d', 'con72b', 'con84', 'con9', 'pro9b']
- Preferred: [['con126', 'con126b', 'con134', 'con42', 'con42b', 'con42c', 'con42d', 'con72b', 'con84', 'con9', 'pro9b']]
- Stable: [['con126', 'con126b', 'con134', 'con42', 'con42b', 'con42c', 'con42d', 'con72b', 'con84', 'con9', 'pro9b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 14 | 19 | 162 | 38 | 0.1111 | 5.3% | 19 | 11 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 0.1111 | 2.0 | 2.0 | 1 | 94.7% | 5.3% | 73.7% | 21.1% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 24.036 | — |
| attack_extraction | 69 | — | 231.449 | 38 |
| prolog_solver | — | — | 0.213 | — |
| **total** | 83 | 60879 | 255.796 | 38 |

## Qualitative Examples

### Accepted (max 5)
- `pro9:con84` → **accept** — Con84 claims cloning is unsafe, undermining the premise that cloning can reliably simplify organ transplantation.
- `pro124:con72` → **accept** — The con argument challenges the premise that cloning is beneficial for parents by highlighting negative psychological effects on the cloned child.
- `pro124:con72b` → **accept** — It attacks the same underlying premise as con72, arguing that the child's development would be constrained, undermining the pro claim.
- `pro124:con42` → **accept** — Con42 challenges the feasibility premise of cloning by claiming adoption is much easier.
- `pro124:con42b` → **accept** — Con42b attacks the cost premise of cloning, asserting adoption is much cheaper.

### Rejected / Skipped (max 5)
- `pro9:pro124` → **skip** — The statements address different benefits and do not contradict or challenge each other.
- `pro9:pro4` → **skip** — The moral claim about “playing God” does not rebut or undermine the organ‑transplant benefit claim.
- `pro9:pro53` → **skip** — Both arguments present separate advantages; neither attacks the other's conclusion or premises.
- `pro9:pro119` → **skip** — Stem‑cell research benefits do not contradict or undermine the claim about simpler organ transplants.
- `pro9:pro126` → **skip** — Safety of cloned embryos is a different issue and does not attack the organ‑transplant simplification claim.

