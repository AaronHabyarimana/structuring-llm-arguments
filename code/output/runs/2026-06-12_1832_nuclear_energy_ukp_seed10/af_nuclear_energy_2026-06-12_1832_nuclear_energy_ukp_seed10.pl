% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro74).  % [pro] The last to close, in 2013, ran with much reduced emissions, well under 1% of total US CFC emissions.
arg(pro5).  % [pro] Hydro and liquefied gas are the greatest killers, even before coal.
arg(pro5b).  % [pro] Environmentalists do not care about the fact that hydro and liquefied gas are the greatest killers.
arg(pro55).  % [pro] Any reactor licensable in the West has a substantial containment structure.
arg(pro55b).  % [pro] Most reactors licensable in the West also have a very robust pressure vessel and internal structures.
arg(pro62).  % [pro] Renewables may be used as much as possible.
arg(pro62b).  % [pro] Intrinsic limitations of diffuse, intermittent sources mean that wind and solar can never economically replace coal, gas, and nuclear for large-scale, continuous, reliable supply.
arg(pro2).  % [pro] Some Soviet-designed and built reactors have been a safety concern for many years.
arg(pro2b).  % [pro] Some Soviet-designed and built reactors are much better now than in 1986.
arg(pro27).  % [pro] The latest generation of nuclear reactor designs are much less likely to melt down.
arg(pro60).  % [pro] Nuclear energy is a clean source of energy
arg(pro60b).  % [pro] Nuclear energy would be cost effective
arg(con42).  % [con] Uranium, the nuclear fuel used to produce nuclear energy, is limited.
arg(con42b).  % [con] Uranium cannot be produced again and again on demand.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks
arg(con84).  % [con] Estimates conclude that somewhere between 15,000 and 30,000 people lost their lives in the Chernobyl aftermath.
arg(con84b).  % [con] More than 2.5 million Ukrainians are still struggling with health problems related to nuclear waste.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con9, pro55).  % [undermining] conf=70 — B suggests reactors could be terrorist targets, challenging the safety implied by A's containment claim
att(con42, pro62b).  % [undermining] conf=85 — The claim that uranium is limited attacks the premise that nuclear can provide large‑scale, continuous supply as an alternative to renewables.
att(con42b, pro62b).  % [undermining] conf=75 — B claims uranium cannot be produced repeatedly, challenging the implicit premise that nuclear power can reliably supply large‑scale continuous energy.
att(con42, pro60b).  % [undermining] conf=75 — The claim that uranium is limited attacks the premise that cheap, abundant fuel makes nuclear power cost‑effective.
att(con42b, pro60b).  % [undermining] conf=75 — Stating uranium cannot be produced repeatedly undermines the premise of fuel availability underlying cost‑effectiveness.
att(con84, pro2b).  % [undermining] conf=70 — The estimate of thousands of deaths from Chernobyl challenges the premise that Soviet‑designed reactors are now much better.
att(con84b, pro2b).  % [undermining] conf=70 — Ongoing health problems in Ukraine undermine the claim that Soviet‑designed reactors have become significantly safer.
att(con84, pro27).  % [undermining] conf=70 — Citing the large death toll from Chernobyl undermines the assertion that the latest reactor designs are much less likely to melt down.
att(con9b, pro60b).  % [undermining] conf=70 — B claims nuclear waste could be terrorist targets, challenging the safety premise underlying A's cost‑effectiveness claim
att(con84, pro60b).  % [undermining] conf=75 — B cites large death toll from Chernobyl, questioning the overall societal cost assumed in A's cost‑effectiveness argument
att(con84b, pro60b).  % [undermining] conf=75 — B points to millions suffering health problems, which undermines the premise that nuclear power is economically advantageous