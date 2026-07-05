# Run Report: Nuclear Energy

Run-ID: `2026-06-13_1111_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T11:11:18

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
- Arguments after atomization: 20

## Attack Extraction

- Pairs evaluated: 183
- Accepted pairs (accept/verify): 35
- Rejected/skipped: 148 (reject/verify-reject: 8, skip: 140)
- Verify calls: 8
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 35
- Symmetric rebuttal edges: 5
- Total attacks: 40

## Graph Statistics

- Density: 0.1053
- Isolated nodes: 1 (0.05)
- SCCs: 15 (largest: 6)
- Cycles: True
- Attack type distribution: {'undermining': 25, 'rebuttal': 10, 'undercutting': 5}

## Formal Semantics

- Grounded: ['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro32']
- Preferred: [['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con36', 'con9', 'con9b', 'pro32'], ['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'con9b', 'pro32', 'pro82b', 'pro95'], ['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro15', 'pro15b', 'pro32', 'pro82b', 'pro95']]
- Stable: [['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con36', 'con9', 'con9b', 'pro32'], ['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'con9b', 'pro32', 'pro82b', 'pro95'], ['con109', 'con140', 'con140b', 'con152', 'con23', 'con27', 'con27b', 'con27c', 'con9', 'pro15', 'pro15b', 'pro32', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 14 | 20 | 183 | 40 | 0.1053 | 5.0% | 15 | 10 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1053 | 2.0 | 2.0 | 1 | 100.0% | 25.0% | 62.5% | 12.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 22.058 | — |
| attack_extraction | 27 | — | 95.07 | 0 |
| prolog_solver | — | — | 0.208 | — |
| **total** | 41 | 61414 | 117.443 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con23` → **accept** — The claim that 100% security is impossible challenges the premise that storage can be safe and secure.
- `pro82:con9b` → **accept** — Stating that nuclear waste could be terrorist targets directly challenges the premise that storage is safe and secure.
- `pro82:con36` → **accept** — Con36 claims nuclear waste remains an unresolved problem, directly contradicting pro82’s claim that storage is safe and secure.
- `pro82b:con36` → **accept** — A says disposal plans are well in hand, while B says nuclear waste is an unresolved problem, making their conclusions mutually exclusive.
- `pro15:con36` → **accept** — Pro15 asserts waste storage is robust, directly contradicting Con36's claim that nuclear waste remains an unresolved problem.

### Rejected / Skipped (max 5)
- `pro82:con27c` → **skip** — The claims address different aspects (storage safety vs uranium production waste) and do not contradict or attack each other.
- `pro82:con140` → **skip** — Water usage for cooling does not logically conflict with or undermine the claim that storage is safe.
- `pro82:con140b` → **skip** — Impact on aquatic wildlife concerns cooling, not the safety of storage.
- `pro82:con152` → **skip** — Environmental impact of uranium does not directly refute the safety of storage.
- `pro82:con109` → **skip** — Cost overruns are unrelated to the safety claim about storage.

