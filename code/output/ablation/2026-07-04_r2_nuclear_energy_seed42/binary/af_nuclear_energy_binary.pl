% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15a).  % [pro] Civil waste and spent fuel storage is robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(pro36).  % [pro] If external costs are accounted, nuclear is very competitive.
arg(pro32).  % [pro] Also, if we know how to control atomic fusion, the same reactions that fuel the sun, we can have almost unlimited energy.
arg(pro29).  % [pro] Nuclear is much cheaper than wind or photovoltaic systems.
arg(pro29b).  % [pro] Society must bear the high costs of wind and solar for the sake of the environment.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.
arg(con27).  % [con] Uranium sources are just as finite as other fuel sources such as coal and natural gas.
arg(con27b).  % [con] Uranium sources are expensive to mine, refine, and transport.
arg(con27c).  % [con] Uranium sources produce considerable environmental waste, including greenhouse gases, during all of these processes.
arg(con140).  % [con] Cooling nuclear power plant operations often requires a whole lot of water.
arg(con140b).  % [con] The drawing and releasing of large amounts of water for cooling can affect aquatic wildlife.
arg(con23).  % [con] Building a plant with 100% security is technically impossible.
arg(con152).  % [con] One of the biggest issues is environmental impact in relation to uranium.
arg(con109).  % [con] Recent price estimates for a large nuclear plant in Florida are $12 billion to $18 billion, and the nuclear industry has a history of 250 percent cost overruns.
arg(con109b).  % [con] Alternative methods would yield much more climate‑saving bang for our buck than nuclear power, according to some analysts.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con36, pro82).  % [NONE] conf=90 — Con36 challenges the safety of waste storage, directly undermining pro82's claim.
att(con23, pro82).  % [NONE] conf=80 — B claims 100% security is impossible, undermining A's claim of safe storage
att(con9, pro82).  % [NONE] conf=85 — B asserts plants are terrorist targets, challenging A's safety claim
att(con9b, pro82).  % [NONE] conf=85 — B says waste could be terrorist targets, undermining A's safety claim
att(con9b, pro82b).  % [NONE] conf=85 — B claims nuclear waste is a terrorist target, undermining A's claim that disposal plans are well in hand.
att(con36, pro82b).  % [NONE] conf=95 — Con36 states nuclear waste is an unresolved problem, directly contradicting pro82b's claim of solid disposal plans.
att(con36, pro15a).  % [NONE] conf=95 — Con36 claims nuclear waste is unresolved, directly contradicting pro15a's claim of robust storage.
att(con9b, pro15a).  % [NONE] conf=80 — If nuclear waste is a terrorist target, that undermines the assertion that its storage is robust.
att(con36, pro15b).  % [NONE] conf=80 — Con claim that nuclear waste is an unresolved problem challenges the implication that underground storage solves waste issues.
att(pro15b, con9b).  % [NONE] conf=85 — Underground storage undermines claim that waste is a terrorist target
att(con36, pro36).  % [NONE] conf=95 — Con36 highlights an unresolved waste problem, a major external cost that undermines pro36’s claim of competitiveness when external costs are accounted.
att(con27, pro36).  % [NONE] conf=85 — Con27 points out uranium’s finiteness, raising a long‑term external cost that challenges pro36’s competitiveness assertion.
att(con27b, pro36).  % [NONE] conf=90 — Con27b stresses high extraction costs, adding external costs that weaken pro36’s competitiveness claim.
att(con27c, pro36).  % [NONE] conf=90 — Con27c notes significant greenhouse‑gas emissions from uranium processing, an external cost that undercuts pro36’s argument.
att(con140, pro36).  % [NONE] conf=85 — Con140’s water‑use requirement introduces an environmental external cost that contradicts pro36’s competitiveness premise.
att(con140b, pro36).  % [NONE] conf=85 — Con140b highlights aquatic wildlife impacts from cooling water, an external cost that challenges pro36’s claim.
att(con23, pro36).  % [NONE] conf=80 — Con23 argues perfect security is impossible, implying safety risks as external costs that dispute pro36’s competitiveness claim.
att(con152, pro36).  % [NONE] conf=85 — Con152 cites major environmental impacts of uranium, adding external costs that undermine pro36’s argument.
att(con109, pro36).  % [NONE] conf=90 — Con109 points to massive cost overruns, an external cost that directly contradicts pro36’s competitiveness assertion.
att(con109b, pro36).  % [NONE] conf=80 — B claims alternatives give more climate benefit per dollar, contradicting A's claim that nuclear is competitive when costs are internalized
att(con9, pro36).  % [NONE] conf=70 — B points to terrorist targeting risk, an external cost not accounted in A's competitiveness claim
att(con9b, pro36).  % [NONE] conf=70 — B highlights waste as a terrorist target, undermining A's premise that all external costs are considered
att(con23, pro32).  % [NONE] conf=70 — security impossibility challenges feasibility of fusion plants
att(con109b, pro32).  % [NONE] conf=75 — alternative methods argued to be more climate‑effective, contradicting fusion superiority
att(con27, pro29).  % [NONE] conf=70 — finite uranium sources challenge long‑term cost advantage claim
att(con27b, pro29).  % [NONE] conf=80 — high mining and processing costs directly dispute cheaper‑than‑renewables claim
att(con27c, pro29).  % [NONE] conf=80 — Con highlights environmental waste of uranium, challenging the cost advantage claimed by pro.
att(con140, pro29).  % [NONE] conf=70 — Con points out high water usage for cooling, implying additional costs that undermine the cheapness claim.
att(con140b, pro29).  % [NONE] conf=70 — Con stresses ecological damage from water discharge, suggesting hidden costs that conflict with the cheapness argument.
att(con152, pro29).  % [NONE] conf=75 — Con emphasizes uranium’s environmental impact, questioning the overall economic benefit claimed by pro.
att(con109, pro29).  % [NONE] conf=90 — Con provides concrete cost overruns and high price estimates that directly contradict the cheapness claim.
att(con109b, pro29).  % [NONE] conf=80 — Con asserts other methods give more climate benefit per dollar, undermining the assertion that nuclear is cheaper.
att(con9, pro29).  % [NONE] conf=65 — Con raises terrorism risk, suggesting added security costs that challenge the cheapness argument.
att(con36, pro29b).  % [NONE] conf=70 — Con points out unresolved nuclear waste issues, questioning the suitability of nuclear as a cheaper alternative to renewables.
att(con152, con140b).  % [NONE] conf=70 — B downplays A's wildlife impact by asserting uranium's environmental impact is the primary concern