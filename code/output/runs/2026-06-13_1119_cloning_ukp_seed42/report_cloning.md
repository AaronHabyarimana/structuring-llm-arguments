# Run Report: Cloning

Run-ID: `2026-06-13_1119_cloning_ukp_seed42`
Timestamp: 2026-06-13T11:19:06

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
- Arguments after atomization: 16

## Attack Extraction

- Pairs evaluated: 118
- Accepted pairs (accept/verify): 34
- Rejected/skipped: 84 (reject/verify-reject: 9, skip: 75)
- Verify calls: 10
- Verify accept rate: 10.0%
- Fallback calls (classify_single): 1
- Parse errors: 0

### Attack edges in graph

- Direct edges: 34
- Symmetric rebuttal edges: 6
- Total attacks: 40

## Graph Statistics

- Density: 0.1667
- Isolated nodes: 0 (0.0)
- SCCs: 7 (largest: 10)
- Cycles: True
- Attack type distribution: {'undermining': 26, 'rebuttal': 12, 'undercutting': 2}

## Formal Semantics

- Grounded: ['con109', 'con152', 'con23', 'con9', 'pro36']
- Preferred: [['con109', 'con152', 'con23', 'con9', 'pro36']]
- Stable: [['con109', 'con152', 'con23', 'con9', 'pro36']]

## Tables for Thesis

### Experiment Table Row

| Topic | #Args | #Atoms | #Pairs | #Attacks | Density | Iso% | #SCC | Grounded | #Pref |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 14 | 16 | 118 | 40 | 0.1667 | 0.0% | 7 | 5 | 1 |

### Graph Statistics Row

| Topic | Density | Avg In | Avg Out | Iso Nodes | Cross-Stance% | Rebuttal% | Undermining% | Undercutting% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Cloning | 0.1667 | 2.5 | 2.5 | 0 | 90.0% | 30.0% | 65.0% | 5.0% |

### Runtime Row

| Step | API Calls | Tokens | Wall-Time(s) | Fallbacks |
|---|---:|---:|---:|---:|
| atomize | 51 | — | 151.19 | — |
| attack_extraction | 23 | — | 93.739 | 1 |
| prolog_solver | — | — | 0.201 | — |
| **total** | 74 | 43444 | 245.269 | 1 |

## Qualitative Examples

### Accepted (max 5)
- `pro29:con152` → **accept** — Con152 challenges the premise that embryonic stem cells can be reliably turned into functional cells by citing defects in clones.
- `pro7:con140` → **accept** — Con140 questions the social acceptability of cloning by raising human‑rights concerns, undermining the premise that cloning is a beneficial option for gay couples.
- `pro7:con152` → **accept** — Con152 cites health defects in clones, undermining the premise that cloning would produce healthy offspring for gay women.
- `pro7:con9` → **accept** — Con9 cites an expert’s denunciation of human reproductive cloning as dangerous, undermining the safety premise of pro7.
- `pro71:con140` → **accept** — Pro71’s endorsement of cloning conflicts with con140’s claim that cloning would deny full human rights

### Rejected / Skipped (max 5)
- `pro29:con9` → **skip** — The claim about stem‑cell plasticity does not contradict or undermine the statement that a cloning expert denounces human reproductive cloning.
- `pro29:con8` → **skip** — Potential societal division from cloning does not directly rebut or attack the claim about embryonic stem‑cell versatility.
- `pro29:con8b` → **skip** — Differential treatment of perfect clones does not conflict with the statement on stem‑cell manipulation.
- `pro29:con24` → **skip** — The concern about lack of uniqueness does not logically oppose the claim about stem‑cell plasticity.
- `pro29:con24b` → **skip** — The claim about violating individuality does not rebut or undermine the stem‑cell argument.

