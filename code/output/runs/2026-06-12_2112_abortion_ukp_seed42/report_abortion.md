# Run Report: Abortion

Run-ID: `2026-06-12_2112_abortion_ukp_seed42`
Timestamp: 2026-06-12T21:12:35

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
- Arguments after atomization: 16

## Attack Extraction

- Pairs evaluated: 116
- Accepted attacks: 15
- Rejected/skipped: 101 (reject/verify-reject: 2, skip: 99)
- Verify calls: 2
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1042
- Isolated nodes: 5 (0.3125)
- SCCs: 9 (largest: 8)
- Cycles: True
- Attack type distribution: {'undermining': 5, 'rebuttal': 20}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con8', 'pro29', 'pro29b', 'pro36']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con8', 'con9', 'pro29', 'pro29b', 'pro36'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63b', 'pro7'], ['con109', 'con109b', 'con140', 'con8', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63', 'pro63b', 'pro7']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con8', 'con9', 'pro29', 'pro29b', 'pro36'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63b', 'pro7'], ['con109', 'con109b', 'con140', 'con8', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63', 'pro63b', 'pro7']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 16 | 116 | 25 | 0.1042 | 31.2% | 9 | 7 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.1042 | 1.5625 | 1.5625 | 5 | 100.0% | 80.0% | 20.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 19.551 | — |
| attack_extraction | 14 | — | 75.466 | 0 |
| prolog_solver | — | — | 0.152 | — |
| **total** | 28 | 46059 | 95.239 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro29b:con23` → **accept** — A shows that ending abortion would likely raise maternal deaths, challenging B's aim to end abortion.
- `pro29b:con152` → **accept** — A provides evidence that lack of safe abortion increases deaths, undermining B's justification for the Life at Conception Act.
- `pro7:con9` → **accept** — Con9’s claim that abortion is never permissible directly conflicts with pro7’s allowance for abortion regulation after viability.
- `pro71:con9` → **accept** — The claim that abortion is impermissible from the point of human identity challenges the premise that viability determines acceptability.
- `pro71:con8` → **accept** — Stating that fetuses feel pain attacks the premise that early, less‑developed fetuses make early abortions more acceptable.

### Rejected / Skipped (max 5)
- `pro29:con109` → **skip** — The health statistic and the repeat‑abortion statistic address different issues and do not contradict or undermine each other.
- `pro29:con109b` → **skip** — Both statements concern abortion prevalence, not the safety claim, so no direct rebuttal or premise attack exists.
- `pro29:con9` → **skip** — One argument is about maternal mortality, the other about moral permissibility, which are unrelated premises.
- `pro29:con8` → **skip** — The claim about fetal pain does not conflict with or undermine the claim about unsafe abortions causing deaths.
- `pro29b:pro7` → **skip** — Both arguments discuss abortion policy but do not present mutually exclusive conclusions or attack each other's premises.

