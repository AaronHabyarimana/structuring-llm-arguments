# Run Report: Abortion

Run-ID: `2026-06-12_2022_abortion_ukp_seed42`
Timestamp: 2026-06-12T20:22:55

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
- Arguments after atomization: 9

## Attack Extraction

- Pairs evaluated: 35
- Accepted attacks: 7
- Rejected/skipped: 28 (reject/verify-reject: 0, skip: 28)
- Verify calls: 1
- Verify accept rate: 100.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1389
- Isolated nodes: 3 (0.3333)
- SCCs: 6 (largest: 4)
- Cycles: True
- Attack type distribution: {'undermining': 4, 'rebuttal': 6}

## Formal Semantics

- Grounded: ['con140', 'con9', 'pro27', 'pro36', 'pro58']
- Preferred: [['con140', 'con23', 'con9', 'pro27', 'pro36', 'pro58'], ['con140', 'con9', 'pro27', 'pro36', 'pro58', 'pro63']]
- Stable: [['con140', 'con23', 'con9', 'pro27', 'pro36', 'pro58'], ['con140', 'con9', 'pro27', 'pro36', 'pro58', 'pro63']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 9 | 35 | 10 | 0.1389 | 33.3% | 6 | 5 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.1389 | 1.1111 | 1.1111 | 3 | 60.0% | 60.0% | 40.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 20.134 | — |
| attack_extraction | 6 | — | 33.132 | 0 |
| prolog_solver | — | — | 0.139 | — |
| **total** | 20 | 25256 | 53.466 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro7:pro63` → **accept** — pro63 claims some abortions are justified, challenging pro7's premise that only health exceptions permit abortion after viability
- `pro7:pro63b` → **verify-accept** — pro63b argues abortion can be justified on broader grounds, undermining pro7's restriction to health exceptions
- `pro7:pro27` → **accept** — pro27 asserts the Constitution does not define a fetus as a person, challenging the legal basis of pro7's protection claim
- `pro63:con23` → **accept** — Claiming some abortions are justified contradicts the stance to support legislation ending all abortions, which assumes none are justified.
- `pro63b:pro27` → **accept** — Stating that a fetus is not a person attacks the premise that abortion can be compared to killing an adult human.

### Rejected / Skipped (max 5)
- `pro7:pro58` → **skip** — pro58's claim about crime reduction does not directly contradict or undermine pro7's prohibition argument
- `pro7:pro36` → **skip** — pro36 addresses breast‑cancer risk, which is unrelated to pro7's legal‑policy claim
- `pro7:con140` → **skip** — con140 provides historical opposition to abortion, which aligns rather than attacks pro7
- `pro7:con23` → **skip** — con23 supports ending abortion, consistent with pro7's stance
- `pro7:con9` → **skip** — con9's moral claim against abortion reinforces rather than attacks pro7

