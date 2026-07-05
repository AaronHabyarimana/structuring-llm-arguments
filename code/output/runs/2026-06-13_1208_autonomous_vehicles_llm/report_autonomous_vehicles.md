# Run Report: Autonomous Vehicles

Run-ID: `2026-06-13_1208_autonomous_vehicles_llm`
Timestamp: 2026-06-13T12:08:00

## Configuration

| Key | Value |
|---|---|
| Source | llm |
| Split | None |
| Limit | 20 |
| Balanced | None |
| Seed | None |
| Atomize | False |
| Batch size | 10 |
| Max workers | 2 |
| Confidence accept | 70 |
| Confidence verify | 50 |
| Model (extract) | GPT OSS 120B |
| Model (attacks) | GPT OSS 120B |

## Dataset / Arguments

- Source: llm
- Split: None
- Arguments before atomization: 20
- Arguments after atomization: 20

## Attack Extraction

- Pairs evaluated: 190
- Accepted pairs (accept/verify): 37
- Rejected/skipped: 153 (reject/verify-reject: 14, skip: 139)
- Verify calls: 18
- Verify accept rate: 22.2%
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 37
- Symmetric rebuttal edges: 2
- Total attacks: 39

## Graph Statistics

- Density: 0.1026
- Isolated nodes: 3 (0.15)
- SCCs: 17 (largest: 4)
- Cycles: True
- Attack type distribution: {'undermining': 34, 'undercutting': 1, 'rebuttal': 4}

## Formal Semantics

- Grounded: ['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro10', 'pro4']
- Preferred: [['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro10', 'pro4']]
- Stable: [['con1', 'con10', 'con3', 'con4', 'con5', 'con7', 'con8', 'con9', 'pro10', 'pro4']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Autonomous Vehicles | 20 | 20 | 190 | 39 | 0.1026 | 15.0% | 17 | 10 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Autonomous Vehicles | 0.1026 | 1.95 | 1.95 | 3 | 89.7% | 10.3% | 87.2% | 2.6% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 0 | — | — | — |
| attack_extraction | 37 | — | 113.223 | 0 |
| prolog_solver | — | — | 0.236 | — |
| **total** | 38 | 58080 | 121.226 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro1:con1` → **accept** — con1 points to cybersecurity risks that could cause accidents, challenging the safety premise of pro1.
- `pro1:con3` → **accept** — The claim that autonomous systems may struggle with unpredictable human behavior attacks the premise that AVs can reliably reduce accidents.
- `pro1:con4` → **accept** — High sensor costs undermine the premise that widespread deployment will occur, which is needed for accident reduction.
- `pro1:con9` → **accept** — Insufficient regulations undermine the premise that autonomous vehicles can be safely deployed to achieve accident reductions.
- `pro2:con1` → **accept** — The cybersecurity risk claim challenges the reliability premise needed for capacity gains.

### Rejected / Skipped (max 5)
- `pro1:pro2` → **skip** — Both claims are complementary benefits, no logical conflict.
- `pro1:pro3` → **skip** — Both claims address different advantages, not contradictory.
- `pro1:pro4` → **skip** — No incompatibility or premise attack between safety and fuel efficiency claims.
- `pro1:pro5` → **skip** — Claims concern safety and productivity, which are not mutually exclusive.
- `pro1:pro6` → **skip** — Safety and emission benefits do not contradict each other.

