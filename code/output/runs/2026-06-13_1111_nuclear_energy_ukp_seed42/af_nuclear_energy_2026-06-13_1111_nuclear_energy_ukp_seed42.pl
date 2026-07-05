% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure.
arg(pro82b).  % [pro] Plans for eventual disposal are well in hand.
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] Nuclear power is virtually emission-free regarding CO2, so it merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(pro36).  % [pro] If external costs are accounted, nuclear is very competitive.
arg(pro32).  % [pro] Also, if we know how to control atomic fusion, the same reactions that fuel the sun, we can have almost unlimited energy.
arg(pro29).  % [pro] Nuclear is much cheaper than wind or photovoltaic solar power.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.
arg(con27).  % [con] Uranium sources are just as finite as other fuel sources such as coal and natural gas.
arg(con27b).  % [con] Uranium is expensive to mine, refine, and transport.
arg(con27c).  % [con] Uranium production generates considerable environmental waste, including greenhouse gases, during all of these processes.
arg(con140).  % [con] Cooling nuclear power plant operations often requires a whole lot of water.
arg(con140b).  % [con] The drawing and releasing of large amounts of water for cooling nuclear power plants can affect aquatic wildlife.
arg(con23).  % [con] Building a plant with 100% security is technically impossible.
arg(con152).  % [con] One of the biggest issues is environmental impact in relation to uranium.
arg(con109).  % [con] The nuclear industry has a history of 250‑percent cost overruns.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con23, pro82).  % [undermining] conf=80 — The claim that 100% security is impossible challenges the premise that storage can be safe and secure.
att(con9b, pro82).  % [undermining] conf=85 — Stating that nuclear waste could be terrorist targets directly challenges the premise that storage is safe and secure.
att(con36, pro82).  % [rebuttal] conf=95 — Con36 claims nuclear waste remains an unresolved problem, directly contradicting pro82’s claim that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=95 — A says disposal plans are well in hand, while B says nuclear waste is an unresolved problem, making their conclusions mutually exclusive.
att(pro15, con36).  % [rebuttal] conf=95 — Pro15 asserts waste storage is robust, directly contradicting Con36's claim that nuclear waste remains an unresolved problem.
att(con9b, pro15).  % [rebuttal] conf=90 — B's claim that waste could be terrorist targets directly contradicts A's conclusion that storage is robust
att(con36, pro15b).  % [rebuttal] conf=80 — B asserts nuclear waste remains an unresolved problem, contradicting A's implication that below‑ground storage solves the issue
att(con9b, pro15b).  % [undermining] conf=70 — The claim that nuclear waste could be a terrorist target challenges the implied safety premise of storing waste below ground.
att(con36, pro4).  % [undercutting] conf=80 — Con36 shows that even if nuclear is CO₂‑free, the unresolved waste problem prevents the conclusion that it merits support
att(con27, pro4).  % [undermining] conf=85 — Con27 attacks the premise that nuclear solves fuel depletion by pointing out uranium is also finite
att(con27b, pro4).  % [undercutting] conf=75 — Con27b argues high uranium costs undermine the claim that nuclear should be supported despite its CO₂ advantage
att(con27c, pro4).  % [undermining] conf=85 — Con27c challenges the premise of virtually zero CO₂ emissions by highlighting greenhouse‑gas emissions from uranium production
att(con140, pro4).  % [undercutting] conf=70 — Con140 points out large water use, showing the CO₂‑free benefit may not be sufficient to justify support
att(con140b, pro4).  % [undercutting] conf=70 — Con140b adds ecological harm from water use, further weakening the support argument
att(con23, pro4).  % [undercutting] conf=70 — Con23 argues that safety cannot be guaranteed, so CO₂‑free status alone does not justify support
att(con152, pro4).  % [undermining] conf=80 — Con152 attacks the environmental‑impact premise by emphasizing uranium‑related harms, contradicting the claim of virtual emission‑freedom
att(con109, pro4).  % [undermining] conf=85 — Con109 challenges the cost‑feasibility premise that underlies pro4’s claim that nuclear should be supported.
att(con9, pro4).  % [undermining] conf=85 — Con9 questions the safety premise of nuclear plants, weakening pro4’s assumption that nuclear is an acceptable low‑CO₂ option.
att(con9b, pro4).  % [undermining] conf=85 — Con9b attacks the premise that nuclear waste can be safely managed, undermining pro4’s overall support argument.
att(con36, pro95).  % [undermining] conf=80 — Con36 disputes the premise that nuclear waste poses no problem, challenging pro95’s claim that low‑level radiation is harmless.
att(con36, pro36).  % [undermining] conf=80 — Highlighting unresolved nuclear waste problems attacks the premise that external costs are fully accounted in the competitiveness claim.
att(con27, pro36).  % [undermining] conf=85 — Claims uranium is finite, challenging the premise that nuclear remains competitive when external costs are accounted.
att(con27b, pro36).  % [undermining] conf=88 — Points out high uranium mining costs, undermining the cost‑competitiveness premise.
att(con27c, pro36).  % [undermining] conf=87 — Highlights environmental waste from uranium production, questioning the assumed external‑cost balance.
att(con140, pro36).  % [undermining] conf=84 — Notes large water requirements for cooling, which adds significant external costs to nuclear.
att(con140b, pro36).  % [undermining] conf=83 — Emphasizes ecological damage from water use, undermining the claim that external costs are already accounted for.
att(con23, pro36).  % [undermining] conf=86 — Argues that perfect security is impossible, introducing additional safety costs that weaken competitiveness.
att(con152, pro36).  % [undermining] conf=85 — Points to the environmental impact of uranium, challenging the premise that external costs are fully accounted for.
att(con109, pro36).  % [undermining] conf=88 — Cites massive cost overruns in the nuclear industry, undermining the economic competitiveness claim.
att(con9, pro36).  % [undermining] conf=84 — Raises terrorism risk to plants, adding security costs that question the competitiveness conclusion.
att(con9b, pro36).  % [undermining] conf=84 — Highlights waste as terrorist targets, introducing further external costs that challenge the competitiveness argument.
att(con109, pro29).  % [undermining] conf=90 — B provides evidence of large cost overruns, challenging the premise that nuclear is cheaper.
att(con36, pro29).  % [undermining] conf=70 — The claim that nuclear waste is an unresolved problem challenges the cost premise underlying the cheaper‑than‑renewables argument
att(con27b, pro29).  % [undermining] conf=80 — Highlighting high mining, refining and transport costs directly attacks the cost premise of the cheaper‑than‑wind/solar claim
att(con27c, pro29).  % [undermining] conf=70 — Environmental waste and greenhouse‑gas emissions from uranium production undermine the assumption that nuclear’s total cost is lower
att(pro82, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36 claims nuclear waste remains an unresolved problem, directly contradicting pro82’s claim that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=95 — [symmetric rebuttal] A says disposal plans are well in hand, while B says nuclear waste is an unresolved problem, making their conclusions mutually exclusive.
att(con36, pro15).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro15 asserts waste storage is robust, directly contradicting Con36's claim that nuclear waste remains an unresolved problem.
att(pro15, con9b).  % [rebuttal] conf=90 — [symmetric rebuttal] B's claim that waste could be terrorist targets directly contradicts A's conclusion that storage is robust
att(pro15b, con36).  % [rebuttal] conf=80 — [symmetric rebuttal] B asserts nuclear waste remains an unresolved problem, contradicting A's implication that below‑ground storage solves the issue