# Run Report: Cloning

Run-ID: `2026-06-12_2133_cloning_ukp_seed42`
Timestamp: 2026-06-12T21:33:32

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
- Arguments after atomization: 19

## Attack Extraction

- Pairs evaluated: 162
- Accepted attacks: 37
- Rejected/skipped: 119 (reject/verify-reject: 3, skip: 116)
- Verify calls: 3
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 40
- Parse errors: 6

## Graph Statistics

- Density: 0.1257
- Isolated nodes: 1 (0.0526)
- SCCs: 13 (largest: 6)
- Cycles: True
- Attack type distribution: {'undercutting': 12, 'undermining': 19, 'rebuttal': 12}

## Formal Semantics

- Grounded: ['con140', 'con140c', 'con152', 'con152b', 'con152c', 'con23', 'con23b', 'con9']
- Preferred: [['con109', 'con140', 'con140b', 'con140c', 'con152', 'con152b', 'con152c', 'con23', 'con23b', 'con9'], ['con140', 'con140c', 'con152', 'con152b', 'con152c', 'con23', 'con23b', 'con9', 'pro36']]
- Stable: [['con109', 'con140', 'con140b', 'con140c', 'con152', 'con152b', 'con152c', 'con23', 'con23b', 'con9'], ['con140', 'con140c', 'con152', 'con152b', 'con152c', 'con23', 'con23b', 'con9', 'pro36']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 14 | 19 | 162 | 43 | 0.1257 | 5.3% | 13 | 8 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 0.1257 | 2.2632 | 2.2632 | 1 | 88.4% | 27.9% | 44.2% | 27.9% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 22.91 | — |
| attack_extraction | 74 | — | 240.887 | 40 |
| prolog_solver | — | — | 0.14 | — |
| **total** | 88 | 64845 | 263.995 | 40 |

## Qualitative Examples

### Accepted (max 5)
- `pro29:con152b` → **accept** — Evidence that clones are unhealthy challenges the claim that stem‑cell plasticity makes cloning beneficial.
- `pro29:con152c` → **accept** — Reports of genetic defects and premature ageing in clones undermine the positive implication of stem‑cell plasticity.
- `pro29:con9` → **accept** — Wilmut’s denunciation of human cloning as dangerous questions the practical value of stem‑cell plasticity.
- `pro7:con152` → **accept** — Asserts clones often have genetic defects, challenging the premise that cloning can produce a viable child for gay women.
- `pro7:con152b` → **accept** — Claims clones are unhealthy, undermining the feasibility premise of pro7.

### Rejected / Skipped (max 5)
- `pro29:pro7` → **skip** — No logical conflict or premise attack identified.
- `pro29:pro58` → **skip** — No logical conflict or premise attack identified.
- `pro29:pro36` → **skip** — No logical conflict or premise attack identified.
- `pro29:pro27` → **skip** — No logical conflict or premise attack identified.
- `pro29:con140` → **skip** — No logical conflict or premise attack identified.

