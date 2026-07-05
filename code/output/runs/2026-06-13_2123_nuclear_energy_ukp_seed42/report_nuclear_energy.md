# Run Report: Nuclear Energy

Run-ID: `2026-06-13_2123_nuclear_energy_ukp_seed42`
Timestamp: 2026-06-13T21:23:07

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 6 |
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
- Arguments before atomization: 6
- Arguments after atomization: 10

## Attack Extraction

- Pairs evaluated: 40
- Accepted pairs (accept/verify): 8
- Rejected/skipped: 32 (reject/verify-reject: 0, skip: 32)
- Verify calls: 0
- Verify accept rate: —
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 8
- Symmetric rebuttal edges: 1
- Total attacks: 9

## Graph Statistics

- Density: 0.1
- Isolated nodes: 1 (0.1)
- SCCs: 9 (largest: 2)
- Cycles: True
- Attack type distribution: {'undermining': 7, 'rebuttal': 2}

## Formal Semantics

- Grounded: ['con58', 'con63', 'con71', 'con71b', 'con71c']
- Preferred: [['con58', 'con63', 'con71', 'con71b', 'con71c']]
- Stable: [['con58', 'con63', 'con71', 'con71b', 'con71c']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 6 | 10 | 40 | 9 | 0.1 | 10.0% | 9 | 5 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1 | 0.9 | 0.9 | 1 | 100.0% | 22.2% | 77.8% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 6 | — | 11.023 | — |
| attack_extraction | 4 | — | 19.029 | 0 |
| prolog_solver | — | — | 0.122 | — |
| **total** | 10 | 16164 | 30.24 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82b:con63` → **accept** — The question about terrorist use of nuclear waste challenges the premise that disposal plans are secure and well‑handled.
- `pro82:con63` → **accept** — The question raises a security concern that challenges the premise that storage is secure.
- `pro15:con63` → **accept** — The terrorist‑use question challenges the premise that waste storage is robust by implying vulnerability.
- `pro15b:con63` → **accept** — The terrorist‑use question suggests underground storage may not be secure, undermining the claim of safety.
- `pro4:con71b` → **accept** — The high‑death meltdown statistic attacks the premise that nuclear power’s safety justifies its CO₂‑free support.

### Rejected / Skipped (max 5)
- `pro82b:pro4` → **skip** — The conclusions address different aspects (waste disposal vs climate benefits) and do not contradict or target each other's premises.
- `pro82b:con71` → **skip** — The statistic about meltdowns does not challenge the claim that disposal plans are in place.
- `pro82b:con71b` → **skip** — The death‑rate claim does not affect the argument about having disposal plans.
- `pro82b:con71c` → **skip** — The extreme casualty scenario is unrelated to the existence of disposal plans.
- `pro82b:con58` → **skip** — The argument about reallocating subsidies does not directly refute or weaken the claim about disposal plans.

