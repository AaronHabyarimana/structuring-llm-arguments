# Run Report: Nuclear Energy

Run-ID: `2026-06-12_1832_nuclear_energy_ukp_seed10`
Timestamp: 2026-06-12T18:32:16

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 15 |
| Balanced | True |
| Seed | 10 |
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

- Pairs evaluated: 145
- Accepted attacks: 11
- Rejected/skipped: 134 (reject/verify-reject: 3, skip: 131)
- Verify calls: 3
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0359
- Isolated nodes: 7 (0.3889)
- SCCs: 18 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 11}

## Formal Semantics

- Grounded: ['con42', 'con42b', 'con84', 'con84b', 'con9', 'con9b', 'pro2', 'pro5', 'pro55b', 'pro5b', 'pro60', 'pro62', 'pro74']
- Preferred: [['con42', 'con42b', 'con84', 'con84b', 'con9', 'con9b', 'pro2', 'pro5', 'pro55b', 'pro5b', 'pro60', 'pro62', 'pro74']]
- Stable: [['con42', 'con42b', 'con84', 'con84b', 'con9', 'con9b', 'pro2', 'pro5', 'pro55b', 'pro5b', 'pro60', 'pro62', 'pro74']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 14 | 18 | 145 | 11 | 0.0359 | 38.9% | 18 | 13 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.0359 | 0.6111 | 0.6111 | 7 | 100.0% | 0.0% | 100.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 25.578 | — |
| attack_extraction | 18 | — | 76.234 | 0 |
| prolog_solver | — | — | 0.143 | — |
| **total** | 32 | 51707 | 102.017 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro55:con9` → **accept** — B suggests reactors could be terrorist targets, challenging the safety implied by A's containment claim
- `pro62b:con42` → **accept** — The claim that uranium is limited attacks the premise that nuclear can provide large‑scale, continuous supply as an alternative to renewables.
- `pro62b:con42b` → **accept** — B claims uranium cannot be produced repeatedly, challenging the implicit premise that nuclear power can reliably supply large‑scale continuous energy.
- `pro60b:con42` → **accept** — The claim that uranium is limited attacks the premise that cheap, abundant fuel makes nuclear power cost‑effective.
- `pro60b:con42b` → **accept** — Stating uranium cannot be produced repeatedly undermines the premise of fuel availability underlying cost‑effectiveness.

### Rejected / Skipped (max 5)
- `pro74:pro60b` → **skip** — Both arguments are pro‑nuclear and address different topics (emissions vs cost); no logical conflict or premise attack.
- `pro74:con42` → **skip** — One discusses low emissions, the other fuel scarcity; they do not contradict or undermine each other.
- `pro74:con42b` → **skip** — Emission claim does not conflict with claim about uranium availability.
- `pro74:con9` → **skip** — Low‑emission claim does not address terrorist‑target risk; no direct attack.
- `pro74:con9b` → **skip** — Emission claim does not speak to waste‑target risk; no logical incompatibility.

