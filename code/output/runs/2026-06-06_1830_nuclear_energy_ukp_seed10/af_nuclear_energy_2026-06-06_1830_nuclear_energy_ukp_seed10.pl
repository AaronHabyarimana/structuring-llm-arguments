% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro74).  % [pro] The last to close, in 2013, ran with much reduced emissions, well under 1% of total US CFC emissions.
arg(pro5).  % [pro] Hydro and liquefied gas are the greatest killers, even before coal.
arg(pro5b).  % [pro] Environmentalists do not care about the harms caused by hydro and liquefied gas.
arg(pro55).  % [pro] Any reactor licensable in the West has a substantial containment structure.
arg(pro55b).  % [pro] Most reactors licensable in the West also have a very robust pressure vessel and internal structures.
arg(pro62).  % [pro] Renewables may be used as much as possible.
arg(pro62b).  % [pro] Intrinsic limitations of diffuse, intermittent sources mean that wind and solar can never economically replace coal, gas, and nuclear power for large-scale, continuous, reliable electricity supply.
arg(pro2).  % [pro] Some Soviet-designed and built reactors have been a safety concern for many years.
arg(pro2b).  % [pro] These reactors are much better now than in 1986.
arg(pro27).  % [pro] The latest generation of nuclear reactor designs are much less likely to meltdown.
arg(pro60).  % [pro] Nuclear energy is a clean source of energy.
arg(pro60b).  % [pro] Nuclear energy would be cost effective.
arg(con126).  % [con] Renewable energy sources should be used instead.
arg(con72).  % [con] The legacy of environmental contamination has been catastrophic.
arg(con72b).  % [con] The health costs for miners and mines have been catastrophic.
arg(con168).  % [con] Radiation is not easily dealt with, especially in nuclear waste and maintenance materials.
arg(con168b).  % [con] Expensive solutions are needed to contain, control, and shield both people and the environment from radiation's harm.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.
arg(con134).  % [con] Once the fuel is used, the fuel cannot simply be taken to the landfill.
arg(con134b).  % [con] The used fuel is radioactive and dangerous.
arg(con84).  % [con] There is no safe level of radiation exposure.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro2, pro5).  % [undermining] conf=70 — The safety concerns about Soviet-designed reactors challenge the premise that nuclear is safer than hydro and liquefied gas.
att(con126, pro5).  % [rebuttal] conf=70 — The con argument recommends renewables instead, directly contradicting the pro claim that other sources are the biggest killers and implying nuclear is unnecessary.
att(con72, pro5).  % [undermining] conf=90 — It asserts catastrophic environmental contamination from nuclear, challenging the premise that hydro and gas are the greatest killers.
att(con72b, pro5).  % [undermining] conf=90 — It highlights catastrophic health costs of mining, undermining the pro premise that hydro and gas are the worst hazards.
att(con168, pro5).  % [undermining] conf=90 — It points out radiation management problems, attacking the pro claim that other sources are the biggest threats.
att(con168b, pro5).  % [undermining] conf=90 — It stresses costly radiation containment, undermining the pro argument that hydro and gas are the primary killers.
att(con9, pro5).  % [undermining] conf=85 — It raises terrorist‑target risk of nuclear plants, challenging the pro premise that other energy sources are the worst hazards.
att(con9b, pro5).  % [undermining] conf=85 — It highlights nuclear waste as a terrorist target, undermining the claim that hydro and gas are the greatest killers.
att(con134, pro5).  % [undermining] conf=85 — It notes that used nuclear fuel cannot simply be landfilled, disputing the pro premise that other sources are the main dangers.
att(con134b, pro5).  % [undermining] conf=85 — It emphasizes the radioactivity and danger of spent fuel, attacking the pro claim about hydro and gas being the worst killers.
att(con84, pro5).  % [undermining] conf=85 — It asserts no safe radiation level exists, undermining the pro argument that hydro and liquefied gas are the greatest threats.
att(pro55, con72).  % [undermining] conf=80 — Containment claim challenges the premise that nuclear causes catastrophic environmental contamination
att(con168b, pro55).  % [undermining] conf=60 — con168b claims expensive solutions are needed, challenging the premise that existing containment structures are sufficient.
att(con84, pro55).  % [undermining] conf=50 — con84 asserts no safe radiation level, challenging the safety implied by substantial containment.
att(pro55b, con9).  % [undermining] conf=70 — Claiming robust pressure vessels undermines the premise that nuclear plants are attractive terrorist targets by suggesting they are harder to damage.
att(pro2, pro62b).  % [undermining] conf=70 — The safety concerns about Soviet‑designed reactors challenge the premise that nuclear can reliably replace intermittent renewables
att(con126, pro62b).  % [rebuttal] conf=95 — B claims renewables should replace nuclear, directly contradicting A's conclusion that they cannot
att(con72b, pro62b).  % [undermining] conf=75 — B attacks the premise that coal and gas are viable alternatives, weakening A's argument
att(con168, pro62b).  % [undermining] conf=80 — B challenges the feasibility of nuclear waste management, undermining A's premise that nuclear can reliably supply power
att(con168b, pro62b).  % [undermining] conf=80 — B points out the high cost of radiation containment, weakening A's reliance on nuclear as a practical solution
att(con9, pro62b).  % [undermining] conf=80 — B suggests nuclear plants are terrorist targets, undermining the premise of nuclear's reliability
att(con9b, pro62b).  % [undermining] conf=80 — B argues nuclear waste is a terrorist target, attacking the premise that nuclear can be a safe, continuous power source
att(pro27, pro2).  % [rebuttal] conf=90 — B asserts newer reactor designs are much safer, directly contradicting A's implication that nuclear reactors are a safety problem.
att(pro2b, con72).  % [undermining] conf=80 — A claims modern reactors are safer, challenging B's premise that nuclear causes catastrophic contamination.
att(con168, pro2b).  % [undercutting] conf=70 — B argues radiation remains hard to manage, showing A's claim of better reactors may not guarantee safety.
att(con168b, pro2b).  % [undercutting] conf=65 — B points out expensive containment needs, indicating A's assertion of improvement does not resolve radiation hazards.
att(con9, pro2b).  % [undercutting] conf=70 — B highlights terrorist target risk, suggesting A's claim of better reactors does not eliminate security concerns.
att(con9b, pro2b).  % [undercutting] conf=70 — B notes nuclear waste as terrorist targets, undermining A's implication that reactors are now safer overall.
att(con134, pro2b).  % [undercutting] conf=65 — B stresses waste disposal challenges, showing A's improvement claim does not solve fuel disposal issues.
att(con134b, pro2b).  % [undercutting] conf=65 — B emphasizes the danger of radioactive spent fuel, questioning the overall safety implied by A.
att(con84, pro2b).  % [undercutting] conf=70 — B asserts no safe radiation level, indicating A's claim of better reactors may not ensure safety.
att(pro27, con126).  % [undermining] conf=70 — Pro27 challenges the safety premise that underlies the argument for preferring renewables.
att(con84, pro27).  % [undermining] conf=80 — Con84 claims any radiation is unsafe, challenging the premise that lower melt‑down risk makes nuclear safe.
att(con72, pro60).  % [rebuttal] conf=90 — Con72 asserts catastrophic environmental contamination, directly contradicting the claim that nuclear is clean.
att(con72b, pro60).  % [rebuttal] conf=90 — Con72b highlights catastrophic health costs for miners, directly opposing the clean‑energy assertion.
att(con168, pro60).  % [undermining] conf=75 — Con168 points out the difficulty of handling radiation waste, undermining the premise that nuclear is clean.
att(con168b, pro60).  % [undermining] conf=75 — Con168b stresses expensive containment needs, challenging the cleanliness premise.
att(con9, pro60).  % [undermining] conf=70 — Con9 raises terrorist‑target risk for plants, undermining the safety aspect of the clean claim.
att(con9b, pro60).  % [undermining] conf=70 — Con9b highlights waste as terrorist targets, attacking the premise of nuclear’s cleanliness.
att(con134, pro60).  % [undermining] conf=70 — Con134 notes that spent fuel cannot be landfilled, undermining the claim of nuclear being clean.
att(con134b, pro60).  % [undermining] conf=70 — Con134b emphasizes the radioactivity and danger of used fuel, challenging the clean‑energy assertion.
att(con84, pro60).  % [rebuttal] conf=90 — B claims no safe radiation level, directly contradicting A's claim that nuclear energy is clean
att(con126, pro60b).  % [rebuttal] conf=70 — B argues renewables should be used instead, implicitly rejecting A's assertion that nuclear is cost‑effective
att(con72, pro60b).  % [undermining] conf=80 — B points to catastrophic environmental contamination, challenging the premise that nuclear energy is cost‑effective
att(con72b, pro60b).  % [undermining] conf=80 — B highlights catastrophic health costs for miners, undermining the cost‑effectiveness premise of A
att(con168, pro60b).  % [undermining] conf=85 — B states radiation waste is hard to manage, attacking the premise that nuclear can be cost‑effective
att(con168b, pro60b).  % [undermining] conf=90 — B notes expensive containment solutions are required, directly undermining A's cost‑effectiveness claim
att(con9, pro60b).  % [undermining] conf=80 — B warns plants are terrorist targets, challenging the premise that nuclear is economically viable
att(con9b, pro60b).  % [undermining] conf=80 — B points out nuclear waste as terrorist targets, undermining the cost‑effectiveness premise
att(con134, pro60b).  % [undermining] conf=85 — B argues used fuel cannot be landfilled, questioning the economic feasibility claimed by A
att(con134b, pro60b).  % [undermining] conf=85 — B emphasizes the radioactivity and danger of spent fuel, attacking the premise of cost‑effectiveness
att(con84, con168b).  % [rebuttal] conf=80 — Claiming no safe level of radiation directly contradicts the idea that expensive solutions can adequately protect people and the environment.