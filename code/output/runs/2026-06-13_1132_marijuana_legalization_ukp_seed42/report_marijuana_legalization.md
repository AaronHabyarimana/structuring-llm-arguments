# Run Report: Marijuana Legalization

Run-ID: `2026-06-13_1132_marijuana_legalization_ukp_seed42`
Timestamp: 2026-06-13T11:32:55

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

- Pairs evaluated: 199
- Accepted pairs (accept/verify): 10
- Rejected/skipped: 184 (reject/verify-reject: 6, skip: 178)
- Verify calls: 6
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 39
- Parse errors: 5

### Attack edges in graph

- Direct edges: 10
- Symmetric rebuttal edges: 6
- Total attacks: 16

## Graph Statistics

- Density: 0.0381
- Isolated nodes: 11 (0.5238)
- SCCs: 15 (largest: 7)
- Cycles: True
- Attack type distribution: {'undermining': 4, 'rebuttal': 12}

## Formal Semantics

- Grounded: ['con12', 'con14', 'con18', 'con70', 'con87', 'con87b', 'con87c', 'con95', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82']
- Preferred: [['con115', 'con12', 'con14', 'con18', 'con70', 'con87', 'con87b', 'con87c', 'con95', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82'], ['con12', 'con14', 'con18', 'con70', 'con87', 'con87b', 'con87c', 'con95', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro82']]
- Stable: [['con115', 'con12', 'con14', 'con18', 'con70', 'con87', 'con87b', 'con87c', 'con95', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4c', 'pro82'], ['con12', 'con14', 'con18', 'con70', 'con87', 'con87b', 'con87c', 'con95', 'pro15b', 'pro29', 'pro32', 'pro36', 'pro36b', 'pro4', 'pro4b', 'pro4c', 'pro82']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 14 | 21 | 199 | 16 | 0.0381 | 52.4% | 15 | 16 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 0.0381 | 0.7619 | 0.7619 | 11 | 100.0% | 75.0% | 25.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 18.656 | — |
| attack_extraction | 79 | — | 254.242 | 39 |
| prolog_solver | — | — | 0.202 | — |
| **total** | 93 | 74445 | 273.237 | 39 |

## Qualitative Examples

### Accepted (max 5)
- `pro15:con14` → **accept** — Con14 challenges the premise that legalization improves regulation by asserting it would increase child accessibility.
- `pro4b:con115` → **accept** — B asserts legalization is harmful, which conflicts with A’s implication that prohibition’s social costs make legalization preferable.
- `pro4d:con115` → **accept** — A claims prohibition wastes resources (implying legalization is preferable), while B asserts legalization is harmful, presenting mutually exclusive policy conclusions.
- `pro4d:con70` → **accept** — B claims marijuana is more toxic, challenging the premise that prohibition wastes resources by suggesting the policy is justified for health reasons.
- `pro4d:con12` → **accept** — B asserts marijuana is terrible for health, undermining A's premise that prohibition is merely a waste of resources.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — Both arguments support legalization; they do not contradict or challenge each other's premises or conclusions.
- `pro82:pro15b` → **skip** — The claim about tax revenue does not conflict with or undermine the claim about dispute settlement mechanisms.
- `pro82:pro4` → **skip** — A media editorial series supporting legalization is compatible, not contradictory, with creating dispute‑settlement means.
- `pro82:pro4b` → **skip** — Addressing social costs of prohibition does not rebut or undermine the claim about dispute mechanisms.
- `pro82:pro4c` → **skip** — Highlighting racist history of prohibition does not conflict with the claim that legalization creates proper dispute settlement.

