% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro74).  % [pro] The last to close , in 2013 , ran with much reduced emissions , well under 1 % of total US CFC emissions .
arg(pro5).  % [pro] Hydro and liquefied gas are the greatest killers, even before coal.
arg(pro5b).  % [pro] Environmentalists do not care about the fact that hydro and liquefied gas are the greatest killers.
arg(pro55).  % [pro] Any reactor licensable in the West has a substantial containment structure.
arg(pro55b).  % [pro] Most reactors licensable in the West also have a very robust pressure vessel and internal structures.
arg(pro62).  % [pro] Renewables may be used as much as possible.
arg(pro62b).  % [pro] Intrinsic limitations of diffuse, intermittent sources mean that wind and solar can never economically replace coal, gas, and nuclear power for large-scale, continuous, reliable supply.
arg(pro2).  % [pro] Some Soviet-designed and built reactors have been a safety concern for many years.
arg(pro2b).  % [pro] Some Soviet-designed and built reactors are much better now than in 1986.
arg(pro27).  % [pro] The latest generation of nuclear reactor designs are much less likely to experience a meltdown.
arg(pro60).  % [pro] Nuclear energy is a clean source of energy
arg(pro60b).  % [pro] Nuclear energy would be cost effective
arg(con126).  % [con] Renewable energy sources should be used instead.
arg(con72).  % [con] The legacy of environmental contamination has been catastrophic.
arg(con72b).  % [con] The health costs for miners and mines have been catastrophic.
arg(con168).  % [con] Radiation is not easily dealt with, especially in nuclear waste and maintenance materials.
arg(con168b).  % [con] Expensive solutions are needed to contain, control, and shield both people and the environment from radiation's harm.
arg(con42).  % [con] Uranium, the nuclear fuel used to produce nuclear energy, is limited.
arg(con42b).  % [con] Uranium cannot be produced repeatedly on demand.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.
arg(con134).  % [con] Used fuel cannot simply be taken to the landfill.
arg(con134b).  % [con] The used fuel is radioactive and dangerous.
arg(con84).  % [con] There is no safe level of radiation exposure.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro5, con126).  % [undermining] conf=85 — Pro5 claims hydro (a renewable) is a major killer, challenging the premise that renewables are preferable
att(pro5b, con126).  % [undermining] conf=85 — Pro5b claims environmentalists ignore hydro’s harms, challenging the premise that renewables are safe and thus undermining the call to use them
att(con72, pro74).  % [undermining] conf=70 — Claiming catastrophic environmental contamination attacks the premise that nuclear’s low emissions imply overall environmental safety.
att(con72b, pro74).  % [undermining] conf=70 — Stating health costs for miners are catastrophic undermines the premise that nuclear energy is environmentally benign.
att(con168, pro74).  % [undermining] conf=70 — Arguing radiation is hard to manage attacks the safety premise underlying A’s low‑emission claim.
att(con168b, pro74).  % [undermining] conf=70 — Highlighting expensive radiation containment solutions undermines the premise of nuclear’s overall safety.
att(con42, pro74).  % [undermining] conf=70 — Claiming uranium is limited attacks the premise that nuclear can be a sustainable low‑emission source.
att(con42b, pro74).  % [undermining] conf=70 — Stating uranium cannot be produced on demand undermines the sustainability premise of A.
att(con9, pro74).  % [undermining] conf=70 — Suggesting nuclear plants are terrorist targets attacks the safety premise of A’s argument.
att(con9b, pro74).  % [undermining] conf=70 — Claiming nuclear waste could be terrorist targets undermines the safety premise of A.
att(con134, pro74).  % [undermining] conf=70 — Saying used fuel cannot be landfilled attacks the premise that nuclear waste management is manageable.
att(con134b, pro74).  % [undermining] conf=70 — Labeling used fuel as radioactive and dangerous undermines the premise of safe low‑emission nuclear operation.
att(con84, pro74).  % [undermining] conf=70 — Stating there is no safe level of radiation exposure attacks the safety premise of A’s low‑emission claim.
att(con84, pro55).  % [undermining] conf=60 — Claiming no safe radiation level directly challenges the conclusion that containment makes reactors safe.
att(pro55b, con126).  % [undermining] conf=80 — Robust reactor vessels challenge the safety premise behind the call for renewables
att(pro55b, con9).  % [undermining] conf=70 — Strong pressure vessels reduce vulnerability, weakening the claim that plants are easy terrorist targets
att(pro62b, con126).  % [rebuttal] conf=95 — pro62b claims renewables cannot replace nuclear, contradicting con126's call to use renewables instead
att(con126, pro2b).  % [rebuttal] conf=95 — Con126 argues renewables should replace nuclear, directly contradicting pro2b’s implicit endorsement of nuclear.
att(con72, pro2b).  % [undermining] conf=85 — Con72 highlights past catastrophic contamination, challenging the premise that Soviet reactors are now much better.
att(con72b, pro2b).  % [undermining] conf=85 — Con72b points to health costs of mining, undermining the claim of overall improvement in reactor safety.
att(con168, pro2b).  % [undermining] conf=85 — Con168 stresses difficulty of handling radiation, attacking the premise of improved safety.
att(con168b, pro2b).  % [undermining] conf=85 — Con168b argues expensive containment is needed, undermining the claim that reactors are now much better.
att(con42, pro2b).  % [undermining] conf=80 — Con42’s claim of limited uranium challenges the viability of improved Soviet reactors.
att(con42b, pro2b).  % [undermining] conf=80 — Con42b’s assertion that uranium cannot be produced on demand undermines the premise of better reactors.
att(con9, pro2b).  % [undermining] conf=85 — Con9’s terrorist‑target risk attacks the safety improvement premise of pro2b.
att(con9b, pro2b).  % [undermining] conf=85 — Con9b’s claim about waste being a terrorist target undermines the notion of safer reactors.
att(con134, pro2b).  % [undermining] conf=85 — Con134’s disposal difficulty challenges the claim that reactors are now much better.
att(con134b, pro2b).  % [undermining] conf=85 — Con134b’s statement about radioactive used fuel attacks the premise of improved safety.
att(con84, pro2b).  % [undermining] conf=85 — Con84’s claim of no safe radiation level undermines the assertion that reactors are now safer.
att(con126, pro27).  % [rebuttal] conf=95 — Con126’s recommendation to use renewables directly opposes pro27’s support for nuclear designs.
att(con72, pro27).  % [undermining] conf=85 — Con72’s claim of catastrophic contamination undermines the premise that new designs are safer.
att(con72b, pro27).  % [undermining] conf=85 — Con72b’s health‑cost argument attacks the premise of safer modern reactors.
att(con168, pro27).  % [undermining] conf=85 — Con168’s difficulty of handling radiation challenges the claim of reduced melt‑down risk.
att(con168b, pro27).  % [undermining] conf=85 — Con168b’s cost argument undermines the premise that newer reactors are a better solution.
att(con42, pro27).  % [undermining] conf=80 — Con42’s resource‑limit claim attacks the feasibility of relying on newer reactors.
att(con42b, pro27).  % [undermining] conf=80 — Con42b’s statement about uranium production challenges the premise of safer designs.
att(con9, pro27).  % [undermining] conf=85 — Con9’s terrorist‑target risk undermines the safety advantage claimed by pro27.
att(con9b, pro27).  % [undermining] conf=85 — Con9b’s claim about waste being a target attacks the premise of improved safety.
att(con134, pro27).  % [undermining] conf=85 — Con134’s disposal difficulty undermines the claim that newer reactors are safer.
att(con134b, pro27).  % [undermining] conf=85 — Con134b’s statement about radioactive fuel attacks the premise of safer modern designs.
att(con84, pro27).  % [rebuttal] conf=70 — Con84 claims any radiation is unsafe, contradicting Pro27's implication that newer reactors are safer.
att(con126, pro60).  % [rebuttal] conf=80 — Con126 argues renewables should replace nuclear, directly opposing Pro60's claim that nuclear is a clean energy source.
att(con72, pro60).  % [undermining] conf=85 — Con72 points to historic environmental contamination, challenging the premise that nuclear energy is clean.
att(con72b, pro60).  % [undermining] conf=85 — Con72b highlights catastrophic health costs for miners, undermining the clean‑energy premise of Pro60.
att(con168, pro60).  % [undermining] conf=80 — Con168 stresses difficulty of handling radiation waste, weakening Pro60's clean‑energy claim.
att(con168b, pro60).  % [undermining] conf=80 — Con168b notes expensive containment needs, attacking the premise that nuclear is clean.
att(con42, pro60).  % [undermining] conf=75 — Con42 argues uranium is limited, challenging the sustainability aspect of Pro60's clean‑energy argument.
att(con42b, pro60).  % [undermining] conf=75 — Con42b claims uranium cannot be produced on demand, undermining Pro60's clean‑energy premise.
att(con9, pro60).  % [undermining] conf=70 — Con9 warns of terrorist targeting of plants, questioning the overall desirability of nuclear despite its clean label.
att(con9b, pro60).  % [undermining] conf=70 — Con9b highlights waste as a terrorist target, undermining the clean‑energy claim of Pro60.
att(con134, pro60).  % [undermining] conf=80 — Con134 states used fuel cannot be landfilled, challenging the cleanliness of nuclear energy.
att(con134b, pro60).  % [undermining] conf=85 — Con134b points out the radioactivity and danger of used fuel, directly attacking Pro60's clean claim.
att(con84, pro60).  % [undermining] conf=85 — Con84 asserts no safe radiation level, contradicting Pro60's implication that nuclear is clean.
att(con126, pro60b).  % [rebuttal] conf=70 — Con126 recommends renewables, opposing Pro60b's claim that nuclear is cost‑effective.
att(con72, pro60b).  % [undermining] conf=80 — Con72 cites catastrophic environmental contamination, undermining the cost‑effectiveness argument of Pro60b.
att(con72b, pro60b).  % [undermining] conf=80 — Con72b emphasizes health costs, challenging Pro60b's cost‑effectiveness claim.
att(con168, pro60b).  % [undermining] conf=80 — Con168 notes difficulty of handling radiation, undermining Pro60b's cost‑effectiveness argument.
att(con168b, pro60b).  % [undermining] conf=80 — Con168b points to expensive containment solutions, attacking the cost‑effectiveness premise of Pro60b.
att(con42, pro60b).  % [undermining] conf=75 — Con42 argues uranium scarcity, undermining the long‑term cost‑effectiveness of nuclear.
att(con42b, pro60b).  % [undermining] conf=75 — Con42b claims uranium cannot be produced on demand, challenging Pro60b's cost‑effectiveness claim.
att(con9, pro60b).  % [undermining] conf=70 — Con9 warns of terrorist attacks on plants, raising hidden costs that undermine Pro60b's cost‑effectiveness.
att(con9b, pro60b).  % [undermining] conf=70 — Con9b highlights waste as a terrorist target, adding cost concerns to Pro60b's claim.
att(con134, pro60b).  % [undermining] conf=80 — Con134 notes that used fuel cannot be landfilled, introducing additional costs that undercut Pro60b's cost‑effectiveness.
att(con134b, pro60b).  % [undermining] conf=85 — Con134b stresses the radioactivity and danger of used fuel, challenging the cost‑effectiveness of nuclear.
att(con84, pro60b).  % [undermining] conf=85 — Con84 claims no safe radiation level, undermining the economic argument of Pro60b.
att(con84, con168b).  % [undercutting] conf=65 — Stating that no radiation level is safe challenges the notion that expensive solutions can adequately protect people and the environment.