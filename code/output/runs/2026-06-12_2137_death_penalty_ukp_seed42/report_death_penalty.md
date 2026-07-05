# Run Report: Death Penalty

Run-ID: `2026-06-12_2137_death_penalty_ukp_seed42`
Timestamp: 2026-06-12T21:37:56

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
- Arguments after atomization: 18

## Attack Extraction

- Pairs evaluated: 148
- Accepted attacks: 53
- Rejected/skipped: 95 (reject/verify-reject: 2, skip: 93)
- Verify calls: 2
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1993
- Isolated nodes: 2 (0.1111)
- SCCs: 10 (largest: 9)
- Cycles: True
- Attack type distribution: {'undermining': 44, 'rebuttal': 16, 'undercutting': 1}

## Formal Semantics

- Grounded: ['pro36', 'pro4b', 'pro82']
- Preferred: [['con174', 'con189', 'con190', 'con229', 'con27', 'con36', 'pro36', 'pro4b', 'pro82'], ['pro15b', 'pro29', 'pro32', 'pro32b', 'pro32c', 'pro36', 'pro4', 'pro4b', 'pro82', 'pro95']]
- Stable: [['con174', 'con189', 'con190', 'con229', 'con27', 'con36', 'pro36', 'pro4b', 'pro82'], ['pro15b', 'pro29', 'pro32', 'pro32b', 'pro32c', 'pro36', 'pro4', 'pro4b', 'pro82', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 14 | 18 | 148 | 61 | 0.1993 | 11.1% | 10 | 3 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Death Penalty | 0.1993 | 3.3889 | 3.3889 | 2 | 93.4% | 26.2% | 72.1% | 1.6% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 17.291 | — |
| attack_extraction | 17 | — | 96.447 | 0 |
| prolog_solver | — | — | 0.185 | — |
| **total** | 31 | 50945 | 113.999 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro15:pro36` → **accept** — pro36 claims the system appears draconian, challenging the premise that deserved punishment restores a just moral order
- `pro15:con36` → **accept** — con36 highlights wrongful executions, undermining the premise that punishment is deserved and just
- `pro15:con189` → **accept** — con189 points out irreversibility of errors, challenging the claim that punishment restores a just order
- `pro15:con27` → **accept** — con27 provides evidence of innocent people executed, attacking the deservedness premise
- `pro15:con174` → **accept** — con174 argues non‑deserving individuals receive death, weakening the claim of deserved punishment

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both arguments are pro‑death penalty and do not contradict or target each other's premises
- `pro82:pro15b` → **skip** — No logical incompatibility or premise attack is evident
- `pro82:pro4` → **skip** — A's claim about defendant preference does not rebut or undermine B's historical justification
- `pro82:pro4b` → **skip** — No direct conflict between the statements
- `pro82:pro95` → **skip** — A's point about defendant insistence does not attack the recidivism claim

