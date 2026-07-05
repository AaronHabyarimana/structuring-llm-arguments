# Run Report: School Uniforms

Run-ID: `2026-06-13_1202_school_uniforms_ukp_seed42`
Timestamp: 2026-06-13T12:02:34

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
- Accepted pairs (accept/verify): 28
- Rejected/skipped: 174 (reject/verify-reject: 12, skip: 162)
- Verify calls: 12
- Verify accept rate: 0.0%
- Fallback calls (classify_single): 0
- Parse errors: 0

### Attack edges in graph

- Direct edges: 28
- Symmetric rebuttal edges: 5
- Total attacks: 33

## Graph Statistics

- Density: 0.0786
- Isolated nodes: 6 (0.2857)
- SCCs: 16 (largest: 6)
- Cycles: True
- Attack type distribution: {'undermining': 20, 'rebuttal': 10, 'undercutting': 3}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con140b', 'con23', 'con27', 'con27b', 'con36', 'con8', 'con8b', 'con9', 'pro29', 'pro32b', 'pro36']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con23', 'con27', 'con27b', 'con36', 'con8', 'con8b', 'con9', 'pro29', 'pro32b', 'pro36']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con23', 'con27', 'con27b', 'con36', 'con8', 'con8b', 'con9', 'pro29', 'pro32b', 'pro36']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| School Uniforms | 14 | 21 | 202 | 33 | 0.0786 | 28.6% | 16 | 14 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| School Uniforms | 0.0786 | 1.5714 | 1.5714 | 6 | 100.0% | 30.3% | 60.6% | 9.1% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 22.694 | — |
| attack_extraction | 33 | — | 117.212 | 0 |
| prolog_solver | — | — | 0.216 | — |
| **total** | 47 | 73563 | 140.21 | 0 |

## Qualitative Examples

### Accepted (max 5)
- `pro82:con27` → **accept** — The con claim that uniforms violate freedom of expression attacks the legitimacy premise underlying the pro’s benefit claim.
- `pro82:con140b` → **accept** — Arguing that uniforms emphasize class distinctions directly attacks the premise that they foster community support.
- `pro82:con23` → **accept** — The study showing higher self‑perception without uniforms contradicts the pro’s claim that uniforms improve students’ sense of support.
- `pro82:con109` → **accept** — The claim that blazers won’t solve discipline issues attacks the premise that uniforms help troubled students feel supported.
- `pro82:con109b` → **accept** — Saying skirt‑length decrees won’t solve problems undermines the premise that any uniform element provides community support.

### Rejected / Skipped (max 5)
- `pro82:pro15` → **skip** — no attack
- `pro82:pro4` → **skip** — no attack
- `pro82:pro95` → **skip** — no attack
- `pro82:pro36` → **skip** — no attack
- `pro82:pro36b` → **skip** — no attack

