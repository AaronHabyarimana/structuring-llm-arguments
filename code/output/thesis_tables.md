# Thesis-Tabellen (kanonischer Batch 2026-07-02_1037, seed 42, prompt v3)

## A. UKP test split: verfuegbare Argumente je Topic

| Topic | Argument_for | Argument_against | total |
|---|---:|---:|---:|
| Abortion | 136 | 165 | 301 |
| Cloning | 142 | 168 | 310 |
| Death Penalty | 103 | 232 | 335 |
| Gun Control | 158 | 133 | 291 |
| Marijuana Legal. | 118 | 126 | 244 |
| Minimum Wage | 116 | 111 | 227 |
| Nuclear Energy | 122 | 171 | 293 |
| School Uniforms | 109 | 146 | 255 |

## B. Cross-Topic (typed-Arm der Ablation = kanonische Pipeline)

| Topic | Atoms | Pairs | Acc | Acc% | Cyc | Iso | Grnd | U | #Pr | #St | Reb | Und | Cut | Sym | VerAcc | Extract(s) |
|---|---:|---:|---:|---:|:-:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 25 | 267 | 41 | 15.4 | yes | 6 | 7 | 9 | 4 | 4 | 30 | 2 | 9 | 15 | 0 | 337 |
| Cloning | 20 | 180 | 59 | 32.8 | yes | 2 | 9 | 3 | 2 | 2 | 14 | 35 | 10 | 7 | 0 | 161 |
| Death Penalty | 18 | 148 | 68 | 45.9 | yes | 1 | 3 | 8 | 3 | 3 | 22 | 41 | 5 | 11 | 1 | 233 |
| Gun Control | 21 | 203 | 26 | 12.8 | yes | 5 | 14 | 0 | 1 | 1 | 6 | 19 | 1 | 3 | 0 | 335 |
| Marijuana Legal. | 20 | 182 | 41 | 22.5 | yes | 2 | 13 | 0 | 1 | 1 | 20 | 6 | 15 | 10 | 1 | 243 |
| Minimum Wage | 22 | 221 | 58 | 26.2 | yes | 3 | 10 | 3 | 2 | 2 | 6 | 37 | 15 | 3 | 0 | 434 |
| Nuclear Energy | 21 | 201 | 43 | 21.4 | yes | 1 | 12 | 3 | 2 | 2 | 12 | 29 | 2 | 6 | 1 | 148 |
| School Uniforms | 21 | 201 | 29 | 14.4 | yes | 3 | 13 | 0 | 1 | 1 | 10 | 17 | 2 | 5 | 3 | 173 |

## C. Ablation typed / typed-raw / binary (identisches A')

| Topic | Edges t | t-raw | b | J-raw | J-undir | inter | t-only | b-only | Pr(t) | Pr(traw) | Pr(b) | St(t) | St(traw) | St(b) | Grnd(t) | Grnd(traw) | Grnd(b) | sameSt(t) | sameSt(b) |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Abortion | 41 | 26 | 39 | 0.08 | 0.12 | 5 | 21 | 34 | 4 | 1 | 1 | 4 | 1 | 1 | 7 | 12 | 11 | 3 | 14 |
| Cloning | 59 | 52 | 35 | 0.47 | 0.47 | 28 | 24 | 7 | 2 | 1 | 1 | 2 | 1 | 1 | 9 | 10 | 15 | 7 | 1 |
| Death Penalty | 68 | 57 | 51 | 0.71 | 0.83 | 45 | 12 | 6 | 3 | 1 | 1 | 3 | 1 | 1 | 3 | 9 | 10 | 1 | 2 |
| Gun Control | 26 | 23 | 23 | 0.35 | 0.39 | 12 | 11 | 11 | 1 | 1 | 1 | 1 | 1 | 1 | 14 | 14 | 14 | 1 | 1 |
| Marijuana Legal. | 41 | 31 | 24 | 0.41 | 0.53 | 16 | 15 | 8 | 1 | 1 | 1 | 1 | 1 | 1 | 13 | 13 | 13 | 1 | 0 |
| Minimum Wage | 58 | 55 | 49 | 0.27 | 0.44 | 22 | 33 | 27 | 2 | 1 | 1 | 2 | 1 | 1 | 10 | 11 | 10 | 0 | 10 |
| Nuclear Energy | 43 | 37 | 27 | 0.56 | 0.64 | 23 | 14 | 4 | 2 | 1 | 1 | 2 | 1 | 1 | 12 | 14 | 14 | 0 | 0 |
| School Uniforms | 29 | 24 | 42 | 0.38 | 0.38 | 18 | 6 | 24 | 1 | 1 | 1 | 1 | 1 | 1 | 13 | 13 | 12 | 0 | 1 |

## D. Beispiel-Kanten (Abortion, typed_only / binary_only, Auszug)

typed_only:  con140b->pro63, con140b->pro63b, con152->pro63, con152->pro63b, con23->pro63, con23->pro63b, con23b->pro63, con23b->pro63b

binary_only: con109->con24, con109b->con24, con109b->con24b, con109b->con24c, con109b->con24d, con109b->con24e, con109b->con24f, con109b->con24g
