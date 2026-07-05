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
att(con36, pro82).  % [rebuttal] conf=95 — A says storage is safe, while B says nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(con9b, pro82).  % [rebuttal] conf=90 — States nuclear waste could be terrorist targets, directly contradicting the claim that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=90 — A’s claim that disposal plans are well in hand contradicts B’s assertion that nuclear waste remains an unresolved problem.
att(con9b, pro82b).  % [undermining] conf=65 — Claim that nuclear waste could be a terrorist target questions the robustness of the disposal plans.
att(pro15a, con36).  % [rebuttal] conf=95 — Pro15a claims waste storage is robust, while Con36 claims nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(con9b, pro15a).  % [undermining] conf=85 — The claim that nuclear waste could be a terrorist target challenges the premise that waste storage is robust.
att(pro15b, con9b).  % [undermining] conf=90 — Stating that waste is often stored below ground challenges the premise that nuclear waste is an easy target for terrorists.
att(con36, pro36).  % [undermining] conf=80 — Con36 questions the unresolved waste problem, challenging the premise that all external costs are accounted in pro36's competitiveness claim.
att(con27b, pro36).  % [undermining] conf=80 — Con27b highlights high mining and processing costs, attacking the premise that external costs are fully accounted.
att(con27c, pro36).  % [undermining] conf=80 — Con27c points to greenhouse‑gas emissions from uranium production, undermining the claim that external costs are already included.
att(con140, pro36).  % [undermining] conf=70 — Con140 notes large water use for cooling, suggesting an external cost not considered in pro36's analysis.
att(con140b, pro36).  % [undermining] conf=70 — Con140b adds ecological damage from water use, further challenging the completeness of the external‑cost accounting.
att(con152, pro36).  % [undermining] conf=70 — Con152 emphasizes environmental impacts of uranium, questioning whether all external costs have been accounted.
att(con109, pro36).  % [undermining] conf=80 — Con109 cites high construction costs and overruns, directly attacking the cost premise underlying pro36's competitiveness argument.
att(con109b, pro36).  % [rebuttal] conf=70 — B claims alternatives are far more climate‑effective, contradicting A's claim that nuclear is very competitive.
att(con9, pro36).  % [undermining] conf=80 — B introduces terrorist‑target risk, challenging the premise that all external costs have been accounted for in A's competitiveness claim.
att(con9b, pro36).  % [undermining] conf=80 — B points to nuclear waste as a terrorist target, undermining the assumption that external costs are fully internalised in A's argument.
att(con27b, pro29).  % [undermining] conf=75 — High extraction and processing costs of uranium weaken the claim that nuclear is cheaper than renewable alternatives.
att(con109, pro29).  % [rebuttal] conf=90 — Con109 provides concrete cost figures and historic overruns, directly contradicting the claim that nuclear is much cheaper.
att(con27, pro29b).  % [undercutting] conf=85 — B shows nuclear also relies on finite resources, challenging the premise that only wind/solar entail environmental costs.
att(con27b, pro29b).  % [undercutting] conf=85 — B points out high costs of uranium mining, undermining the idea that wind/solar are the sole costly option.
att(con27c, pro29b).  % [undercutting] conf=85 — B highlights environmental waste from uranium, contesting the premise that wind/solar are the only environmentally harmful energy sources.
att(con140, pro29b).  % [undercutting] conf=85 — B notes water usage issues of nuclear, suggesting alternative environmental impacts beyond wind/solar costs.
att(con140b, pro29b).  % [undercutting] conf=85 — B argues nuclear cooling harms aquatic life, challenging the premise that wind/solar are the only environmentally damaging options.
att(con23, pro29b).  % [undercutting] conf=85 — B claims 100% secure nuclear plants are impossible, questioning the assumption that wind/solar are the only safe energy path.
att(con152, pro29b).  % [undercutting] conf=85 — B emphasizes uranium’s environmental impact, disputing the notion that only wind/solar impose environmental costs.
att(con109, pro29b).  % [undercutting] conf=85 — B cites huge cost overruns for nuclear, showing that high costs are not unique to wind/solar.
att(con109b, pro29b).  % [undercutting] conf=85 — B argues alternative methods (including nuclear) give better climate bang for buck, undermining the need to bear high wind/solar costs.
att(con9, pro29b).  % [undercutting] conf=85 — B raises terrorism risk for nuclear, indicating other serious concerns beyond wind/solar costs, thus A’s conclusion is not compelled.
att(pro82, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] A says storage is safe, while B says nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(pro82, con9b).  % [rebuttal] conf=90 — [symmetric rebuttal] States nuclear waste could be terrorist targets, directly contradicting the claim that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=90 — [symmetric rebuttal] A’s claim that disposal plans are well in hand contradicts B’s assertion that nuclear waste remains an unresolved problem.
att(con36, pro15a).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro15a claims waste storage is robust, while Con36 claims nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(pro36, con109b).  % [rebuttal] conf=70 — [symmetric rebuttal] B claims alternatives are far more climate‑effective, contradicting A's claim that nuclear is very competitive.
att(pro29, con109).  % [rebuttal] conf=90 — [symmetric rebuttal] Con109 provides concrete cost figures and historic overruns, directly contradicting the claim that nuclear is much cheaper.