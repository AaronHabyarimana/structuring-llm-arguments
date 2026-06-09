# Run Report: Nuclear Energy

Run-ID: `2026-06-05_1944_nuclear_energy_ukp_seed10`
Timestamp: 2026-06-05T19:44:39

## Configuration

| Key | Value |
|---|---|
| Source | ukp |
| Split | test |
| Limit | 15 |
| Balanced | True |
| Seed | 10 |
| Atomize | True |
| Batch size | 30 |
| Max workers | 2 |
| Confidence accept | 70 |
| Confidence verify | 50 |
| Model (extract) | GPT OSS 120B |
| Model (attacks) | GPT OSS 120B |

## Dataset / Arguments

- Source: ukp
- Split: test
- Arguments before atomization: 14
- Arguments after atomization: 24

## Attack Extraction

- Pairs evaluated: 266
- Accepted attacks: 66
- Rejected/skipped: 200 (reject/verify-reject: 9, skip: 191)
- Verify calls: 11
- Verify accept rate: 18.2%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.1196
- Isolated nodes: 2 (0.0833)
- SCCs: 24 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 59, 'rebuttal': 6, 'undercutting': 1}

## Formal Semantics

- Grounded: ['con134', 'con134b', 'con168', 'con42', 'con42b', 'con72', 'con72b', 'con84', 'con9b', 'pro2', 'pro5', 'pro55b', 'pro5b', 'pro62', 'pro62b']
- Preferred: n/a (nicht berechnet/timeout)
- Stable: n/a (nicht berechnet/timeout)

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 14 | 24 | 266 | 66 | 0.1196 | 8.3% | 24 | 15 | n/a |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Nuclear Energy | 0.1196 | 2.75 | 2.75 | 2 | 98.5% | 9.1% | 89.4% | 1.5% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 28.023 | — |
| attack_extraction | 20 | — | 153.879 | 0 |
| prolog_solver | — | — | 30.232 | — |
| **total** | 34 | 65449 | 212.26 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro5:con126` → **accept** — Pro5 claims hydro (a renewable) is a major killer, challenging the premise that renewables are preferable
- `pro5b:con126` → **accept** — Pro5b claims environmentalists ignore hydro’s harms, challenging the premise that renewables are safe and thus undermining the call to use them
- `pro74:con72` → **accept** — Claiming catastrophic environmental contamination attacks the premise that nuclear’s low emissions imply overall environmental safety.
- `pro74:con72b` → **accept** — Stating health costs for miners are catastrophic undermines the premise that nuclear energy is environmentally benign.
- `pro74:con168` → **accept** — Arguing radiation is hard to manage attacks the safety premise underlying A’s low‑emission claim.

### Rejected / Skipped (max 5)
- `pro5:pro60` → **skip** — No direct conflict between the statements
- `pro5:pro60b` → **skip** — No direct conflict between the statements
- `pro5:con72` → **skip** — The statements address different issues
- `pro5:con72b` → **skip** — The statements address different issues
- `pro5:con168` → **skip** — The statements address different issues

