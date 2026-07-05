# Run Report: Abortion

Run-ID: `2026-06-12_2129_abortion_ukp_seed42`
Timestamp: 2026-06-12T21:29:30

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
- Rejected/skipped: 95 (reject/verify-reject: 0, skip: 95)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 41
- Parse errors: 6

## Graph Statistics

- Density: 0.1208
- Isolated nodes: 7 (0.4375)
- SCCs: 8 (largest: 9)
- Cycles: True
- Attack type distribution: {'rebuttal': 28, 'undermining': 1}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con140b', 'pro29', 'pro36', 'pro58']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con8', 'con9', 'pro29', 'pro36', 'pro58'], ['con109', 'con109b', 'con140', 'con140b', 'con23', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro29', 'pro36', 'pro58', 'pro63b', 'pro7'], ['con109', 'con109b', 'con140', 'con140b', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63', 'pro63b', 'pro7', 'pro71']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con8', 'con9', 'pro29', 'pro36', 'pro58'], ['con109', 'con109b', 'con140', 'con140b', 'con23', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro71'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro29', 'pro36', 'pro58', 'pro63b', 'pro7'], ['con109', 'con109b', 'con140', 'con140b', 'pro29', 'pro29b', 'pro36', 'pro58', 'pro63', 'pro63b', 'pro7', 'pro71']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 16 | 116 | 29 | 0.1208 | 43.8% | 8 | 7 | 4 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.1208 | 1.8125 | 1.8125 | 7 | 100.0% | 96.6% | 3.4% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 19.79 | — |
| attack_extraction | 67 | — | 222.258 | 41 |
| prolog_solver | — | — | 0.15 | — |
| **total** | 81 | 52475 | 242.271 | 41 |

## Qualitative Examples

### Accepted (max 5)
- `pro29b:con152` → **accept** — A’s implied conclusion that safe, legal abortion is needed directly contradicts B’s conclusion to enact a law banning abortion from conception
- `pro29b:con9` → **accept** — A argues abortion should be legal to prevent maternal deaths, while B claims abortion is never permissible, making their conclusions mutually exclusive.
- `pro29b:con8` → **accept** — A argues for legal abortion to reduce maternal deaths, directly contradicting B’s claim that abortion should be restricted because fetuses feel pain
- `pro7:con23` → **accept** — A allows abortion when maternal health is at risk, while B claims to always support legislation that ends abortion, implying no such exceptions
- `pro7:con152` → **accept** — B's proposal to ban abortion from conception conflicts with A's conclusion that abortion after viability should be allowed for maternal health, making the conclusions mutually exclusive.

### Rejected / Skipped (max 5)
- `pro29:con109` → **skip** — The statements address unrelated aspects (maternal deaths vs. repeat abortions) and do not conflict or attack each other.
- `pro29:con109b` → **skip** — The statistics on repeat abortions do not contradict or undermine the claim about unsafe‑abortion deaths.
- `pro29:con9` → **skip** — A health statistic and a moral claim about personhood are unrelated and do not rebut or undermine each other.
- `pro29:con8` → **skip** — Fetal pain claim does not affect the WHO mortality estimate, so no attack is present.
- `pro29b:pro7` → **skip** — Both arguments can be compatible; the restriction after viability does not directly contradict the need for safe abortion to prevent deaths.

