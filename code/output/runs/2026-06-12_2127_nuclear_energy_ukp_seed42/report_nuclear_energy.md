# Run Report: Nuclear Energy

Run-ID: `2026-06-12_2127_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-12T21:27:13

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
- Arguments after atomization: 21

## Attack Extraction

- Pairs evaluated: 202
- Accepted attacks: 33
- Rejected/skipped: 169 (reject/verify-reject: 8, skip: 161)
- Verify calls: 12
- Verify accept rate: 33.3%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0952
- Isolated nodes: 2 (0.0952)
- SCCs: 13 (largest: 5)
- Cycles: True
- Attack type distribution: {'undermining': 23, 'rebuttal': 14, 'undercutting': 3}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro32', 'pro95']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con36', 'con9', 'pro32', 'pro95'], ['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro32', 'pro82b', 'pro95']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con36', 'con9', 'pro32', 'pro95'], ['con109', 'con109b', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro32', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 14 | 21 | 202 | 40 | 0.0952 | 9.5% | 13 | 12 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.0952 | 1.9048 | 1.9048 | 2 | 100.0% | 35.0% | 57.5% | 7.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 19.29 | — |
| attack_extraction | 34 | — | 117.444 | 0 |
| prolog_solver | — | — | 0.18 | — |
| **total** | 48 | 69719 | 136.98 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con23` → **accept** — The claim that 100 % security is impossible attacks the premise that storage can be fully safe and secure
- `pro82:con9` → **accept** — Terrorist targeting concerns undermine the premise that storage is secure
- `pro82:con36` → **accept** — The conclusion that nuclear waste is an unresolved problem directly contradicts the claim that storage is safe and secure.
- `pro82b:con36` → **accept** — Con36 claims nuclear waste is an unresolved problem, directly contradicting the claim that disposal plans are well in hand.
- `pro15:con36` → **accept** — B claims nuclear waste is an unresolved problem, directly contradicting A's claim that waste storage is robust

### Rejected / Skipped (max 5)
- `pro82:con27b` → **skip** — Cost of uranium does not contradict or affect the claim that storage is safe
- `pro82:con27c` → **skip** — Environmental waste from uranium mining is unrelated to storage safety
- `pro82:con140` → **skip** — Water usage for cooling does not oppose the claim about storage security
- `pro82:con140b` → **skip** — Impact on aquatic wildlife does not challenge the safety of storage
- `pro82:con152` → **skip** — Environmental impact of uranium does not refute storage safety

