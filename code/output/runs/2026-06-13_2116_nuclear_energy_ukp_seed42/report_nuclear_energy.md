# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2116_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:16:13

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 8 |
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
- Arguments before atomization: 8
- Arguments after atomization: 12

## Attack Extraction

- Pairs evaluated: 61
- Accepted pairs (accept/verify): 10
- Rejected/skipped: 51 (reject/verify-reject: 4, skip: 47)
- Verify calls: 4
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 1
- Parse errors: 0

### Attack edges in graph

- Direct edges: 10
- Symmetric rebuttal edges: 3
- Total attacks: 13

## Graph Statistics

- Density: 0.0985
- Isolated nodes: 4 (0.3333)
- SCCs: 8 (largest: 4)
- Cycles: True
- Attack type distribution: {'undermining': 7, 'rebuttal': 6}

## Formal Semantics

- Grounded: ['con71', 'con71b', 'con71c', 'pro95']
- Preferred: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro82', 'pro82b', 'pro95'], ['con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro4', 'pro82', 'pro82b', 'pro95']]
- Stable: [['con36', 'con58', 'con63', 'con71', 'con71b', 'con71c', 'pro95'], ['con58', 'con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro82', 'pro82b', 'pro95'], ['con71', 'con71b', 'con71c', 'pro15', 'pro15b', 'pro4', 'pro82', 'pro82b', 'pro95']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 8 | 12 | 61 | 13 | 0.0985 | 33.3% | 8 | 4 | 3 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.0985 | 1.0833 | 1.0833 | 4 | 100.0% | 46.2% | 53.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 8 | — | 10.65 | — |
| attack_extraction | 13 | — | 45.181 | 1 |
| prolog_solver | — | — | 0.135 | — |
| **total** | 21 | 29148 | 56.021 | 1 |

## Qualitative Examples

### Accepted (max 5)
- `pro82b:con63` → **accept** — The question about terrorist use challenges the premise that disposal plans are secure and sufficient
- `pro82b:con36` → **accept** — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand
- `pro82:con63` → **accept** — Con63 questions whether waste can be used for weapons, challenging the premise that storage is secure.
- `pro82:con36` → **accept** — Con36 claims nuclear waste remains an unresolved problem, directly attacking the premise of safe, secure storage.
- `pro15:con63` → **accept** — Claim that storage is robust attacks the premise that nuclear waste is vulnerable to terrorist misuse

### Rejected / Skipped (max 5)
- `pro82b:pro15` → **skip** — Both statements are supportive and do not contradict or challenge each other
- `pro82b:pro15b` → **skip** — Both arguments affirm nuclear waste handling and are compatible
- `pro82b:pro4` → **skip** — One stresses disposal plans, the other CO2 benefits; no logical conflict
- `pro82b:pro95` → **skip** — Both are pro‑nuclear and do not undermine each other's claims
- `pro82b:con71` → **skip** — Risk statistics about melt‑downs do not directly attack the claim of having disposal plans

