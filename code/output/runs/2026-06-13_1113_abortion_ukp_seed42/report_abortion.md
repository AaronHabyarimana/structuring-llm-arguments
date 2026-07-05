# Run Report: Abortion

Run-ID: `2026-06-13_1113_abortion_ukp_seed42`
Timestamp: 2026-06-13T11:13:15

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
- Arguments after atomization: 25

## Attack Extraction

- Pairs evaluated: 272
- Accepted pairs (accept/verify): 20
- Rejected/skipped: 246 (reject/verify-reject: 20, skip: 226)
- Verify calls: 21
- Verify accept rate: 4.8%
- Fallback calls (classify_single): 41
- Parse errors: 6

### Attack edges in graph

- Direct edges: 20
- Symmetric rebuttal edges: 5
- Total attacks: 25

## Graph Statistics

- Density: 0.0417
- Isolated nodes: 7 (0.28)
- SCCs: 21 (largest: 5)
- Cycles: True
- Attack type distribution: {'undermining': 15, 'rebuttal': 10}

## Formal Semantics

- Grounded: ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro27', 'pro29', 'pro29b', 'pro36a', 'pro36b', 'pro36c', 'pro58']
- Preferred: [['con109', 'con109b', 'con140', 'con140b', 'con23', 'con8', 'pro27', 'pro29', 'pro29b', 'pro36a', 'pro36b', 'pro36c', 'pro58'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro27', 'pro29', 'pro29b', 'pro36a', 'pro36b', 'pro36c', 'pro58', 'pro63']]
- Stable: [['con109', 'con109b', 'con140', 'con140b', 'con23', 'con8', 'pro27', 'pro29', 'pro29b', 'pro36a', 'pro36b', 'pro36c', 'pro58'], ['con109', 'con109b', 'con140', 'con140b', 'con8', 'pro27', 'pro29', 'pro29b', 'pro36a', 'pro36b', 'pro36c', 'pro58', 'pro63']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 14 | 25 | 272 | 25 | 0.0417 | 28.0% | 21 | 12 | 2 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 0.0417 | 1.0 | 1.0 | 7 | 48.0% | 40.0% | 60.0% | 0.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 14 | — | 21.935 | — |
| attack_extraction | 104 | — | 328.708 | 41 |
| prolog_solver | — | — | 0.21 | — |
| **total** | 118 | 107835 | 350.97 | 41 |

## Qualitative Examples

### Accepted (max 5)
- `pro7:pro63b` → **accept** — The moral equivalence claim challenges the premise that protecting fetal life justifies proscribing abortion after viability
- `pro7:pro27` → **accept** — Pro27’s conclusion that the Constitution does not define a fetus as a person attacks the legal premise that the State can protect fetal life after viability.
- `pro71:con152` → **accept** — A claims early abortions are widely accepted, while B’s conclusion to enact a law banning abortions from conception directly contradicts that acceptance
- `pro71:con8` → **accept** — Claim that fetuses feel pain challenges the premise that early, less‑developed fetuses are morally less concerning.
- `pro63:con23` → **accept** — B’s commitment to ending all abortions implies all abortions are unjustified, directly contradicting A’s claim that not all are unjustified.

### Rejected / Skipped (max 5)
- `pro29:con140b` → **skip** — The historical claim about Anthony and Stanton does not contradict or challenge the WHO mortality statistic.
- `pro29:con23` → **skip** — A normative stance to end abortion does not logically refute the factual claim about unsafe abortion deaths.
- `pro29:con152` → **skip** — Introducing anti‑abortion legislation does not undermine or contradict the WHO mortality estimate.
- `pro29:con109` → **skip** — The statistic on repeat abortions is unrelated to the claim about maternal deaths from unsafe abortions.
- `pro29:con109b` → **skip** — Data on multiple‑abortion women does not affect the WHO death figure.

