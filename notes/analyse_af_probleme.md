# Analyse: Probleme im generierten AAF + ASPIC+ vs. ASP

## 1. Probleme in der aktuellen Ausgabe (generated_af.pl)

### 1.1 con1 als falscher Hub

con1 = "Despite what the nuclear industry tells us, building enough nuclear power stations..."
→ spricht spezifisch über **Baukapazität und Machbarkeit**.

In der aktuellen Ausgabe ist con1 in 14 von 20 Attacken involviert:
- con1 greift pro1, pro2, pro4, pro5, pro6, pro8, pro9 an
- pro1, pro2, pro4, pro5, pro6, pro8, pro9 greifen con1 an

Das ist falsch. con1 ist kein allgemeines Anti-Kernenergie-Argument, sondern
ein spezifisches Argument über Infrastruktur. Es hat keinen direkten logischen
Zusammenhang zu:
  - pro1 (Sicherheitsverfahren in bestehenden Ländern)
  - pro2 (Sowjetische Reaktor-Sicherheit)
  - pro4 (Gegner haben Meinung geändert)
  - pro5 (Hydro/Gas töten mehr als Kernkraft)

**Ursache:** Das LLM interpretiert con1 als "nuclear is generally bad/infeasible"
und lässt es gegen alle positiven Argumente antreten — der Prompt zwingt das
Modell, "systematisch alle Paare zu prüfen", ohne zu prüfen ob ein echter
logischer Zusammenhang besteht.

### 1.2 Konkret falsche Attacken

| Attacke               | Problem                                                        |
|-----------------------|----------------------------------------------------------------|
| att(pro1, con1)       | Sicherheitsverfahren ≠ Angriff auf Baukapazität               |
| att(pro2, con1)       | Sowjet-Reaktor-Sicherheit ≠ Baukapazität                      |
| att(pro4, con1)       | "Gegner änderten Meinung" hat keinen logischen Bezug zu con1  |
| att(pro5, con1)       | Todesfallvergleich mit Hydro/Gas ≠ Baukapazität               |
| att(pro9, con1)       | Forschungswert ≠ Baukapazität                                 |
| att(con1, pro2)       | Baukapazität greift nicht Sowjet-Reaktor-Aussage an           |
| att(con1, pro4)       | Baukapazität greift nicht "Gegner änderten Meinung" an        |
| att(con1, pro5)       | Baukapazität greift nicht Todesfallvergleich an               |

### 1.3 Fehlende offensichtliche Attacken

| Fehlende Attacke      | Begründung                                                      |
|-----------------------|-----------------------------------------------------------------|
| att(pro5, con6)       | pro5: Hydro/Gas töten mehr → rebuttal gegen con6: Tschernobyl-Schäden |
| att(pro5, con8)       | pro5: andere Quellen gefährlicher → rebuttal gegen con8: 50 Tschernobyl-Tote |
| att(pro7, con3)       | pro7: Uran gut verfügbar → undermining gegen con3: teuer zu beschaffen |
| att(con9, pro1)       | con9: Terrorismus-Ziel → undercutting gegen pro1: Sicherheitsverfahren |
| att(con4, pro1)       | con4: Waffen-Know-how → undercutting gegen pro1: Sicherheitsverfahren |
| att(con10, pro1)      | con10: für Waffen genutzt → undercutting gegen pro1: Sicherheitsverfahren |
| att(con5, pro8)       | con5: Energiesparen günstiger → rebuttal gegen pro8: praktische Lösung |
| att(pro1, con4)       | pro1: Verfahren vorhanden → rebuttal gegen con4: Proliferationsgefahr |
| att(pro1, con9)       | pro1: Sicherheitsverfahren → rebuttal gegen con9: Terrorismus-Risiko |

### 1.4 UKP-Datensatz-Problem: Argumente ohne Satzkontext

Die UKP-Sätze sind aus längeren Texten extrahiert. Ohne Kontext sind manche
Stances schwer zu interpretieren:
  - pro2: "Some Soviet designed and built reactors have been a safety concern"
    klingt wie ein Con-Argument, ist aber als Pro annotiert (wahrscheinlich Teil
    eines "ja, alte Designs waren schlecht, aber moderne nicht"-Arguments).
  - con8: "Like Chernobyl had 50 deaths" klingt pro-nuklear (wenige Tote),
    ist aber als Con annotiert.

Das LLM sieht nur den isolierten Satz und kann die intendierte Stance falsch
interpretieren → falsche Attacken.

### 1.5 Strukturelles AF-Problem: zu geringe Konnektivität bei echten Argumenten

Die meisten echten Sachaspekte (Kosten, Sicherheit, Umwelt, Proliferation,
Terrorismus, Verfügbarkeit) haben kaum Verbindungen untereinander. Ein AAF mit
nur wenigen echten Attacken führt zu:
  - Trivialer Grounded Extension (fast alle Argumente drin)
  - Keine stabilen Extensionen oder viele gleichwertige preferred Extensions
  → Für die Bachelorarbeit wenig aussagekräftig.

---

## 2. Empfehlung: ASPIC+ oder ASP?

### ASPIC+ (Modgil & Prakken 2014)

ASPIC+ erweitert Dungs AAF um interne Argumentstruktur:
  - Argumente haben explizite Prämissen, Inferenzregeln und Konklusionen
  - Attacks werden aus der Argumentstruktur abgeleitet (nicht manuell annotiert)
  - Drei Angriffsarten (rebuttal, undercutting, undermining) sind formal definiert

**Vorteile für die Bachelorarbeit:**
  - Direkte Verbindung zu Argument Mining: LLMs können Prämissen und Konklusionen
    extrahieren → strukturierte Argumente entstehen natürlich
  - Theoretisch reichhaltig: viel zu analysieren (Präferenzordnungen, Strict vs.
    Defeasible Rules, Argument Schemes)
  - Relevant für aktuelle Forschung (Alfano et al. 2026 nutzt strukturierte Args)
  - Dung AAF ist Spezialfall von ASPIC+ → direkter Vergleich möglich
  - Attacken werden aus Struktur abgeleitet, nicht vom LLM direkt geraten

**Nachteile:**
  - Komplexer zu implementieren (Prolog/Clingo braucht mehr Prädikate)
  - LLM muss Prämissen und Konklusionen getrennt extrahieren
  - Mehr Fehlerquellen bei der LLM-Extraktion

### ASP (Answer Set Programming, z.B. Clingo)

ASP verwendet Logikprogramme mit Negation-as-Failure zur Extension-Berechnung.

**Vorteile:**
  - Effizient und skalierbar (Clingo berechnet Extensions für große AFs schnell)
  - Direkte Kodierung von Dung-Semantiken in wenigen Regeln
  - Ähnlich zu Prolog — Migration des bestehenden Codes ist einfach
  - Gute Tool-Unterstützung (Clingo, DLV)

**Nachteile:**
  - Weniger ausdrucksstark für Argumentstruktur
  - Attacken müssen weiterhin extern bestimmt werden (gleiches Problem wie jetzt)
  - Weniger direkte Verbindung zum Argument Mining (kein strukturierter Rahmen)

### Empfehlung

**Für diese Bachelorarbeit: ASPIC+**

Begründung:
  1. Das Kernproblem (LLM errät Attacken unzuverlässig) löst sich mit ASPIC+
     teilweise: Attacken werden aus extrahierter Argumentstruktur abgeleitet,
     nicht frei erfunden.
  2. Die Extraktion von (Prämisse, Konklusion, Warrant) ist eine natürliche
     LLM-Aufgabe — besser als "finde Attacken zwischen Satzpaaren".
  3. Theoretisch: Dung AAF als Spezialfall lässt sich in der Arbeit als
     Baseline verwenden, ASPIC+ als Erweiterung.
  4. Literatur-Anschlussfähigkeit: Alfano et al. (2026), Cabrio & Villata (2018),
     Lippi & Torroni (2016) arbeiten alle mit strukturierten Argumenten.

ASP bleibt als Implementierungsframework sinnvoll (statt Prolog), da Clingo
effizienter ist — aber das ist eine Implementierungsentscheidung, keine
Frameworks-Entscheidung.

---

## 3. Nächste Schritte (Vorschlag)

1. extract.py: LLM extrahiert pro Argument (premise, conclusion, warrant)
   statt nur stance + text
2. Attacken aus Struktur ableiten: rebuttal wenn conclusion_A widerspricht
   conclusion_B; undercutting wenn conclusion_A widerspricht warrant_B;
   undermining wenn conclusion_A widerspricht premise_B
3. Prolog/Clingo: ASPIC+-Kodierung mit aspic_arg/3, pref/2, strict_rule/2,
   defeasible_rule/2
4. Evaluation: Vergleich LLM-extrahierte Attacken vs. Gold-Annotationen
   (falls UKP-Daten solche haben)
