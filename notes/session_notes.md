# Session Notes — LLM-basiertes Argument Mining & Dung AAF

## 1. Pipeline-Überblick

- Schritt 0a: UKP-Datensatz laden — Stance bereits gold-annotiert (`Argument_for` / `Argument_against`), kein LLM für Stance-Erkennung nötig
- Schritt 0b (alternativ): Argumente per LLM aus freien Sätzen extrahieren (`extract_arguments`) — relevant für LLM-generierte Argumente
- Schritt 1: Angriffs-Relationen per LLM extrahieren (`extract_attacks`)
- Schritt 2: Prolog-Datei generieren (`to_prolog`) — `arg/1` und `att/2` Fakten
- Schritt 3: Dung-Semantiken berechnen (`prolog.pl`)

---

## 2. UKP-Datensatz

- 8 Topics, je ~2500–3900 Sätze: abortion, cloning, death_penalty, gun_control, marijuana_legalization, minimum_wage, nuclear_energy, school_uniforms
- Gesamt: 25.492 Sätze (Stab et al., EMNLP 2018)
- Spalten: `sentence`, `annotation` (Argument_for / Argument_against / NoArgument), `set` (train/test/val)
- Beispiel nuclear_energy (test-split): 122 pro, 171 con, 424 NoArgument
- Stance-Labels können direkt übernommen werden → spart LLM-Calls und vermeidet Fehler bei Schritt 0
- **Label-Rauschen bekannt**: Einige Sätze sind inhaltlich falsch gelabelt (z.B. pro2: "Soviet reactors were a safety concern" als Argument_for, con8: "Chernobyl had 50 deaths" als Argument_against). In Stab et al. (2018) dokumentiert.

---

## 3. Probleme bei der Attack-Extraktion

### 3.1 Zu wenige Angriffe
- Restriktiver Prompt → LLM findet nur offensichtliche Gegensätze
- Freie (isolierte) Argumente erscheinen in jeder Extension → Extensions explodieren kombinatorisch

### 3.2 Zu viele / falsche Angriffe durch liberalen Prompt
- Prompt mit "mindestens ein Angreifer pro Argument" → LLM erfindet Verbindungen
- Thematisch ähnliche, aber logisch unabhängige Argumente werden fälschlicherweise verknüpft

### 3.3 Zu aggressives Filtern durch Refinement-Prompt
- Refinement-Schritt hat fast alle Angriffe herausgefiltert → AF mit 4 Angriffen, 16 isolierte Argumente
- Refinement-Schritt entfernt, da kontraproduktiv

### 3.4 Aktueller Stand (nach Prompt-Iteration)
- 26 Angriffe für 20 Argumente — brauchbare Qualität
- 3 noch isolierte Argumente (pro5, con7, con10) → erscheinen trivial in grounded
- Einige fragwürdige Angriffe bleiben (verschiedene thematische Aspekte)
- Grounded Extension = {pro5, con7, con10} — strukturell korrekt, aber inhaltlich trivial

### 3.5 Zielkonflikt beim Prompt-Design
- Zu liberal → spurious attacks, Extensions zu groß
- Zu strikt → kaum Angriffe, isolierte Argumente, grounded ≈ alles
- Konkrete Beispiele im Prompt (statt abstrakter Regeln) helfen dem LLM

### 3.6 Theoretische Grundlage Angriffstaxonomie
- Dung (1995): ein generischer Angriffstyp `att/2` im abstrakten AF
- Pollock (1987/1992): rebuttal vs. undercutter
- ASPIC+ (Modgil & Prakken, 2014): rebuttal, undercutting, undermining
- Im abstrakten AF irrelevant für Semantik-Berechnung, aber wichtig für LLM-Prompt-Qualität

---

## 4. Bugs in prolog.pl

### Bug 1: `complete/1` — doppelte Klausel
- `forall(Cond, fail)` ist logisch äquivalent zu `\+ Cond`
- Beide Klauseln identisch → jede complete Extension wird doppelt ausgegeben
- Fix: erste Klausel (mit forall) entfernen

### Bug 2: `preferred/1` — logisch falsch
- `admissible(Bigger)` mit ungebundenem `Bigger` kann keine Mengen generieren
- `conflict_free(Bigger)`: zweite Klausel scheitert für ungebundene Variablen (`Bigger \= []` schlägt fehl)
- Ergebnis: `admissible(Bigger)` gelingt nur mit `Bigger = []`
- Konsequenz: `preferred` reduziert sich auf `admissible` — jede admissible Menge wird als preferred ausgegeben
- Fix: Vergleich gegen bereits berechnete admissible Mengen aus dem Powerset durchführen

---

## 5. Skalierungsproblem

- Alle powerset-basierten Semantiken (admissible, complete, stable, preferred) haben Komplexität O(2ⁿ)
- Bei n=20 Argumenten: 2²⁰ ≈ 1 Million Teilmengen → praktisch nicht terminierend
- Nur `grounded_extension` ist tractable: polynomielle Zeit O(n²), Fixpunkt-Iteration
- NP-Härte von preferred/stable theoretisch bekannt (Dunne & Bench-Capon, 2002)
- Empfohlenes Limit für Powerset-Ansatz: ≤ 12 Argumente (6 pro + 6 con, balanciert)

---

## 6. Semantiken im Überblick

| Semantik   | Bedeutung im Debattenkontext                  | Anzahl   | Komplexität |
|------------|-----------------------------------------------|----------|-------------|
| admissible | Verteidigbare Teilmengen                      | sehr viele | O(2ⁿ)    |
| complete   | Admissible + enthält alle verteidigten Args   | mittel   | O(2ⁿ)      |
| grounded   | Undisputed Konsens — unbestreitbar akzeptabel | genau 1  | O(n²) ✓    |
| stable     | Klares Urteil — eine Seite gewinnt vollständig | wenige  | O(2ⁿ)      |
| preferred  | Stärkste kohärente Position (pro vs. con)     | wenige   | O(2ⁿ)      |

- **Grounded**: für "Konsens-Beliefs" — was bleibt wenn alle Angriffe berücksichtigt werden
- **Preferred**: für "parteiische Beliefs" — stärkste vertretbare Pro- bzw. Con-Position
- **Stable** = preferred wenn vorhanden (strengere Bedingung)

---

## 7. Methodische Diskussion: Dung-Semantiken + LLMs für Belief-Berechnung

### 7.1 Argumente für den Ansatz
- Dung (1995) ist das Standardframework formaler Argumentation — gut begründbar
- Alfano et al. (2022/2026) nutzen exakt diese Pipeline (LLM → AF → Semantiken)
- Formale Semantiken liefern Rationalitätsgarantien (Rationality Postulates), die reine LLM-Ausgaben nicht haben
- Ergebnis ist explizierbar: man kann nachvollziehen, warum ein Argument akzeptiert wird
- Grounded Extension ist eindeutig und deterministisch — kein Halluzinationsproblem

### 7.2 Probleme und Grenzen
- **GIGO-Problem**: Qualität der Beliefs hängt vollständig von der Qualität der Attack-Extraktion ab. Fehlende oder falsche Angriffe → falsche Extensions. Das LLM ist die schwache Stelle, nicht die Semantik.
- **Informationsverlust durch Abstraktion**: Im abstrakten AF (arg/1, att/2) geht der propositionale Inhalt verloren. Die Semantik-Berechnung ist "blind" — sie weiß nicht, was die Argumente bedeuten.
- **Vollständigkeit nicht garantiert**: LLMs finden nicht alle Angriffs-Relationen zuverlässig. Fehlende Angriffe → Argumente erscheinen "stärker" als sie sind.
- **Label-Rauschen propagiert sich**: Falsch gelabelte UKP-Argumente führen zu falschen Angriffskandidaten und verfälschen die Extensions.
- **Zirkuläre Epistemik**: Das LLM hat implizit bereits "Beliefs" über das Thema. Die formale Semantik berechnet Beliefs aus LLM-extrahierten Strukturen — der LLM-Bias fließt indirekt ein.
- **Grounded oft leer/trivial**: Bei ausgeglichenen Debatten gibt es keinen echten Konsens → grounded = {} oder nur isolierte Argumente.

### 7.3 Alternative Ansätze
- **Probabilistische Argumentation**: Angriffs-Relationen mit Konfidenzwerten gewichten (Hunter 2013) → graduierte statt binäre Akzeptanz. Robuster gegenüber fehlerhafter Extraktion.
- **Bipolare AFs**: Zusätzlich zu Angriffen auch Unterstützungsrelationen modellieren (Cayrol & Lagasquie-Schiex, 2005) → reichere Struktur, LLMs können auch Support erkennen.
- **ASPIC+ / Structured Argumentation**: Propositionale Inhalte behalten, Angriffe aus logischer Struktur ableiten — aber erfordert viel strukturiertere Eingaben.
- **Direktes LLM-Querying**: LLM direkt nach der vertretbarsten Position fragen — kein formales Framework. Einfacher, aber keine Rationalitätsgarantien.
- **clingo / Aspartix**: Gleicher Ansatz wie aktuell, aber mit ASP-Solver statt Powerset — löst Skalierungsproblem, ändert nichts an der Qualitätsfrage.

### 7.4 Fazit für die Thesis
- Der Ansatz ist als **Proof of Concept** valide und in der Literatur etabliert
- Die zentrale Forschungsfrage sollte lauten: *Wie gut approximiert LLM-basierte Attack-Extraktion eine korrekte formale Argumentation?*
- Hauptlimitation klar benennen: Qualität der Beliefs ist direkt an Attack-Extraktionsqualität gebunden
- Grounded als primäre Semantik wählen (tractable, gut begründbar als "skeptischer Konsens")
- Preferred/stable als ergänzende Perspektive für kleine AFs (≤12 Args)

---

## 8. Lösungsansätze für Skalierung

### Option A: Nur Grounded (tractable, für Thesis gut begründbar)
- Grounded Extension immer eindeutig und polynomial berechenbar
- Repräsentiert skeptisch-rationalen Konsens
- Nachteil: oft klein oder leer bei ausgeglichenen Debatten

### Option B: clingo / Aspartix (State-of-the-Art)
- Aspartix (Egly et al.): ASP-Encodings für alle Dung-Semantiken
- clingo als Solver, aufrufbar aus Python via subprocess
- Skaliert auf hunderte Argumente
- Ansatz von Alfano et al. und verwandten Papieren

### Option C: Kleine AFs + Powerset (für Demonstration)
- Limit auf ≤12 Argumente (6 pro + 6 con, balanciert)
- Skalierungsproblem in der Thesis als Limitation benennen
- Geeignet für Proof-of-Concept

---

## 9. Offene Punkte

- [ ] Bug in `preferred/1` fixen
- [ ] Bug in `complete/1` fixen (doppelte Klausel)
- [ ] Entscheidung: Grounded only vs. clingo vs. kleine AFs
- [ ] `load_ukp` balanciert machen (limit//2 pro + limit//2 con)
- [ ] Limit auf 10–12 setzen für Powerset-Ansatz
- [ ] Qualität der Attack-Relationen evaluieren (LLM-Output vs. manuelle Annotation)
- [ ] LLM-generierte Argumente als Erweiterung (Schritt 0b) — sinnvoll?
