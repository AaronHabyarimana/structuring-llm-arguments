# Run Report: Marijuana Legalization

Run-ID: `2026-06-06_1847_marijuana_legalization_ukp_seed10`
Timestamp: 2026-06-06T18:47:10

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
- Arguments after atomization: 15

## Attack Extraction

- Pairs evaluated: 100
- Accepted attacks: 20
- Rejected/skipped: 80 (reject/verify-reject: 7, skip: 73)
- Verify calls: 7
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

## Graph Statistics

- Density: 0.0952
- Isolated nodes: 1 (0.0667)
- SCCs: 15 (largest: 1)
- Cycles: False
- Attack type distribution: {'undermining': 15, 'rebuttal': 5}

## Formal Semantics

- Grounded: ['con104', 'con106', 'con21', 'con21b', 'con21c', 'con84', 'pro2', 'pro62', 'pro62b']
- Preferred: [['con104', 'con106', 'con21', 'con21b', 'con21c', 'con84', 'pro2', 'pro62', 'pro62b']]
- Stable: [['con104', 'con106', 'con21', 'con21b', 'con21c', 'con84', 'pro2', 'pro62', 'pro62b']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 14 | 15 | 100 | 20 | 0.0952 | 6.7% | 15 | 9 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Marijuana Legalization | 0.0952 | 1.3333 | 1.3333 | 1 | 85.0% | 25.0% | 75.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 22.322 | — |
| attack_extraction | 38 | — | 156.124 | 0 |
| prolog_solver | — | — | 0.234 | — |
| **total** | 52 | 37681 | 178.76 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro74:con106` → **accept** — B cites research linking marijuana use to higher prescription‑drug use, challenging the safety implication of A.
- `pro62:con36` → **accept** — The claim that legalization already exists challenges the premise that authorities need to be cautious about legalizing.
- `pro62b:con36` → **accept** — A shows that authorities (voters) have already legalized marijuana, contradicting B's recommendation to think twice about legalization.
- `pro27:con106` → **accept** — The claim that marijuana may increase prescription drug use challenges the premise that loosening laws would help affected individuals.
- `pro27:con36` → **accept** — Suggesting authorities should reconsider legalization directly opposes the conclusion that loosening laws would be beneficial.

### Rejected / Skipped (max 5)
- `pro74:con104` → **skip** — The arguments address different health aspects and do not directly contradict or challenge each other.
- `pro74:con21` → **skip** — One discusses pulmonary function while the other talks about addiction, so no direct attack is present.
- `pro74:con21b` → **skip** — The statements concern different outcomes (functionality vs lung health) and do not rebut or undermine each other.
- `pro74:con21c` → **skip** — The con argument focuses on consumption patterns, not on the pulmonary claim made by the pro argument.
- `pro62:pro2` → **skip** — Both arguments are supportive and complementary, not contradictory.

