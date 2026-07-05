# Run Report: Abortion

Run-ID: `2026-06-13_1054_abortion_ukp_seed42`
Timestamp: 2026-06-13T10:54:05

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
- Arguments after atomization: 24

## Attack Extraction

- Pairs evaluated: 248
- Accepted pairs (accept/verify): 10
- Rejected/skipped: 238 (reject/verify-reject: 13, skip: 225)
- Verify calls: 14
- Verify accept rate: 7.1%
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 10
- Symmetric rebuttal edges: 7
- Total attacks: 17

## Graph Statistics

- Density: 0.0308
- Isolated nodes: 15 (0.625)
- SCCs: 19 (largest: 6)
- Cycles: True
- Attack type distribution: {'undermining': 2, 'rebuttal': 14, 'undercutting': 1}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con140b', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro36', 'pro36b', 'pro36c', 'pro71']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro36', 'pro36b', 'pro36c', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con152', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro36', 'pro36b', 'pro36c', 'pro63', 'pro63b', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro29b', 'pro36', 'pro36b', 'pro36c', 'pro63', 'pro63b', 'pro71']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro36', 'pro36b', 'pro36c', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con152', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro36', 'pro36b', 'pro36c', 'pro63', 'pro63b', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con24', 'con24b', 'con24c', 'con24d', 'con24e', 'con24f', 'con24g', 'con8', 'pro29', 'pro29b', 'pro36', 'pro36b', 'pro36c', 'pro63', 'pro63b', 'pro71']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 24 | 248 | 17 | 0.0308 | 62.5% | 19 | 17 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.0308 | 0.7083 | 0.7083 | 15 | 76.5% | 82.4% | 11.8% | 5.9% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 24.366 | — |
| attack_extraction | 48 | — | 180.628 | 0 |
| prolog_solver | — | — | 1.77 | — |
| **total** | 62 | 84269 | 206.875 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro29:pro7` → **accept** — The WHO mortality data challenges pro7's premise that restricting abortion does not endanger women's health.
- `pro29b:con23` → **accept** — Con's pledge to end abortion directly contradicts the pro argument’s implied conclusion that legal abortion is needed to reduce maternal deaths.
- `pro29b:con152` → **accept** — Con’s introduction of anti‑abortion legislation opposes the pro claim that safe, legal abortion is necessary to prevent maternal deaths.
- `pro7:con23` → **accept** — Con23’s commitment to ending all abortion contradicts pro7’s allowance for abortion after viability with health exceptions.
- `pro7:con152` → **accept** — The Life at Conception Act seeks a total ban from conception, which opposes pro7’s position that abortion may be permitted after viability.

### Rejected / Skipped (max 5)
- `pro29:con23` → **skip** — The con argument states a normative stance without addressing the factual claim about unsafe abortions, so no logical attack is present.
- `pro29:con152` → **skip** — The con argument reports a legislative action, which does not rebut, undercut, or undermine the WHO mortality statistic.
- `pro29:con109` → **skip** — The statistic about repeat abortions does not conflict with or challenge the claim about deaths from unsafe abortions.
- `pro29:con109b` → **skip** — The claim about women with multiple prior abortions is unrelated to the WHO mortality figure and provides no attack.
- `pro29:con8` → **skip** — The assertion about fetal pain addresses a different issue and does not rebut or undermine the mortality statistic.

