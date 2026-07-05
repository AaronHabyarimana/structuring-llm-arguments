# Run Report: Gun Control

Run-ID: `2026-06-12_2139_gun_control_ukp_seed42`
Timestamp: 2026-06-12T21:39:50

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
- Arguments after atomization: 23

## Attack Extraction

- Pairs evaluated: 244
- Accepted attacks: 14
- Rejected/skipped: 226 (reject/verify-reject: 4, skip: 222)
- Verify calls: 4
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 39
- Parse errors: 4

## Graph Statistics

- Density: 0.0435
- Isolated nodes: 10 (0.4348)
- SCCs: 15 (largest: 7)
- Cycles: True
- Attack type distribution: {'rebuttal': 16, 'undercutting': 1, 'undermining': 5}

## Formal Semantics

- Grounded: ['con109', 'con24', 'con56', 'con9b', 'pro29', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b']
- Preferred: [['con109', 'con109b', 'con23', 'con23b', 'con24', 'con56', 'con60', 'con8', 'con9', 'con9b', 'pro29', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con109b', 'con23', 'con23b', 'con24', 'con56', 'con8', 'con9', 'con9b', 'pro27', 'pro29', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con24', 'con56', 'con60', 'con9b', 'pro29', 'pro29b', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con24', 'con56', 'con9b', 'pro27', 'pro27b', 'pro29', 'pro29b', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b']]
- Stable: [['con109', 'con109b', 'con23', 'con23b', 'con24', 'con56', 'con60', 'con8', 'con9', 'con9b', 'pro29', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con109b', 'con23', 'con23b', 'con24', 'con56', 'con8', 'con9', 'con9b', 'pro27', 'pro29', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con24', 'con56', 'con60', 'con9b', 'pro29', 'pro29b', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b'], ['con109', 'con24', 'con56', 'con9b', 'pro27', 'pro27b', 'pro29', 'pro29b', 'pro36b', 'pro58', 'pro58b', 'pro63', 'pro63b', 'pro7', 'pro71b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 14 | 23 | 244 | 22 | 0.0435 | 43.5% | 15 | 12 | 4 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Gun Control | 0.0435 | 0.9565 | 0.9565 | 10 | 95.5% | 72.7% | 22.7% | 4.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 23.461 | — |
| attack_extraction | 82 | — | 293.015 | 39 |
| prolog_solver | — | — | 0.143 | — |
| **total** | 96 | 92360 | 316.699 | 39 |

## Qualitative Examples

### Accepted (max 5)
- `pro29b:con23` → **accept** — A’s implied conclusion that gun control is needed conflicts directly with B’s claim that strict gun control laws do not work, making the two conclusions mutually exclusive.
- `pro29b:con23b` → **accept** — A's implied conclusion that stricter gun control is needed contradicts B's claim that strict gun control laws will not work.
- `pro29b:con109b` → **accept** — A’s claim that gunshot wounds are common directly contradicts B’s claim that guns are associated with freedom rather than violence, making their conclusions mutually exclusive.
- `pro29b:con9` → **accept** — Even if car accidents cause more deaths, A shows gun injuries are frequent, so B's conclusion that guns are less of a problem doesn't follow from its premise.
- `pro29b:con8` → **accept** — A's implied claim that stricter gun control is needed conflicts with B's claim that strict gun laws do not reduce homicide, so their conclusions are mutually exclusive.

### Rejected / Skipped (max 5)
- `pro29:pro27b` → **skip** — The statements address different aspects and do not contradict or attack each other's premises or conclusions.
- `pro29:con23` → **skip** — Con23 discusses effectiveness in Mexico, which does not rebut or undermine pro29's claim about child accident rates.
- `pro29:con23b` → **skip** — Con23b argues about U.S. policy effectiveness, not directly contradicting or undermining the child mortality statistic.
- `pro29:con109` → **skip** — Con109 presents a different correlation (delinquency) that does not rebut or attack the accident‑death claim.
- `pro29:con109b` → **skip** — The claim about children's perception of guns does not conflict with the statistic on accidental deaths.

