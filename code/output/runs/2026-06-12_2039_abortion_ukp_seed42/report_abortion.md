# Run Report: Abortion

Run-ID: `2026-06-12_2039_abortion_ukp_seed42`
Timestamp: 2026-06-12T20:39:35

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 20 |
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
- Arguments before atomization: 20
- Arguments after atomization: 17

## Attack Extraction

- Pairs evaluated: 133
- Accepted attacks: 20
- Rejected/skipped: 113 (reject/verify-reject: 4, skip: 109)
- Verify calls: 4
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0956
- Isolated nodes: 2 (0.1176)
- SCCs: 11 (largest: 6)
- Cycles: True
- Attack type distribution: {'undermining': 14, 'rebuttal': 12}

## Formal Semantics

- Grounded: ['con130', 'con155a', 'con155b', 'con60', 'pro109', 'pro36', 'pro9']
- Preferred: [['con130', 'con140', 'con144', 'con155a', 'con155b', 'con60', 'pro109', 'pro36', 'pro9'], ['con130', 'con140', 'con155a', 'con155b', 'con56', 'con60', 'con7', 'pro109', 'pro36', 'pro9'], ['con130', 'con144', 'con155a', 'con155b', 'con60', 'pro109', 'pro36', 'pro63', 'pro9'], ['con130', 'con155a', 'con155b', 'con56', 'con60', 'con7', 'pro109', 'pro36', 'pro63', 'pro9']]
- Stable: [['con130', 'con140', 'con144', 'con155a', 'con155b', 'con60', 'pro109', 'pro36', 'pro9'], ['con130', 'con140', 'con155a', 'con155b', 'con56', 'con60', 'con7', 'pro109', 'pro36', 'pro9'], ['con130', 'con144', 'con155a', 'con155b', 'con60', 'pro109', 'pro36', 'pro63', 'pro9'], ['con130', 'con155a', 'con155b', 'con56', 'con60', 'con7', 'pro109', 'pro36', 'pro63', 'pro9']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 20 | 17 | 133 | 26 | 0.0956 | 11.8% | 11 | 7 | 4 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.0956 | 1.5294 | 1.5294 | 2 | 69.2% | 46.2% | 53.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 20 | — | 28.511 | — |
| attack_extraction | 18 | — | 93.495 | 0 |
| prolog_solver | — | — | 0.141 | — |
| **total** | 38 | 60433 | 122.211 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro7:pro36` → **accept** — B refutes a health‑risk premise that could justify A’s exception for the mother’s health.
- `pro7:pro27` → **accept** — B’s legal finding that a fetus is not a constitutional person attacks A’s underlying premise of fetal protection.
- `pro7:con56` → **accept** — B attacks the moral premise that abortion can be allowed for convenience, which A’s policy implicitly permits.
- `pro63:con140` → **accept** — Con140 cites historical anti‑abortion statements, implying abortion is unjustified, which directly contradicts pro63's claim that not all abortions are unjustified.
- `pro63b:con56` → **accept** — A concludes abortion is justified, while B claims it is immoral, making their conclusions mutually exclusive.

### Rejected / Skipped (max 5)
- `pro7:con155a` → **skip** — Emotional description does not directly contradict or undermine the policy claim
- `pro7:con155b` → **skip** — Appeal to suffering does not target the logical premise or conclusion of the pro argument
- `pro7:con7` → **skip** — Moral claim about killing adults is not logically incompatible with the abortion‑policy claim
- `pro7:con144` → **skip** — Analogy about organ use supports rather than attacks the pro position
- `pro7:con144b` → **skip** — Statement affirms permissibility of abortion, not an attack

