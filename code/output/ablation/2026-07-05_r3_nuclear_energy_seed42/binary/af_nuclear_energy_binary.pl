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
att(pro82, con36).  % [NONE] conf=90 — Pro claim that storage is safe directly challenges the con claim that nuclear waste remains an unresolved problem.
att(con23, pro82).  % [NONE] conf=80 — Saying 100 % security is technically impossible challenges the premise that storage is safe and secure.
att(con9, pro82).  % [NONE] conf=85 — If nuclear plants are terrorist targets, the claim that storage is safe and secure is undermined.
att(con9b, pro82).  % [NONE] conf=90 — Targeting nuclear waste for terrorism directly challenges the assertion that storage is safe and secure.
att(con36, pro82b).  % [NONE] conf=95 — Con36 asserts nuclear waste is an unresolved problem, directly undermining pro82b’s claim that disposal plans are well in hand.
att(con9b, pro82b).  % [NONE] conf=75 — B points out terrorist risk to nuclear waste, undermining A’s claim that disposal plans are well in hand
att(con36, pro15a).  % [NONE] conf=92 — Con36 asserts nuclear waste is an unresolved problem, directly contradicting pro15a's claim of robust storage.
att(con152, pro15a).  % [NONE] conf=80 — B claims uranium’s environmental impact is a major issue, undermining A’s claim that waste storage is robust
att(con9b, pro15a).  % [NONE] conf=85 — B argues nuclear waste could be terrorist targets, casting doubt on A’s assertion of robust storage
att(con36, pro15b).  % [NONE] conf=70 — Con36 claims nuclear waste remains an unresolved problem, challenging the implication that underground storage solves the waste issue.
att(pro15b, con9b).  % [NONE] conf=70 — Stating that waste is often stored below ground challenges the premise that nuclear waste would be an attractive terrorist target.
att(con23, pro95).  % [NONE] conf=70 — If 100% security is impossible, higher radiation releases could occur, challenging the claim that only low levels matter.
att(con36, pro36).  % [NONE] conf=90 — Con36 highlights an unresolved waste problem, a major external cost that undermines pro36's claim of competitiveness when external costs are accounted.
att(con27b, pro36).  % [NONE] conf=80 — Con27b points out high mining and processing costs, an external cost that challenges pro36's competitiveness assertion.
att(con27c, pro36).  % [NONE] conf=80 — Con27c emphasizes greenhouse‑gas emissions from uranium production, an external cost omitted in pro36's argument.
att(con140, pro36).  % [NONE] conf=75 — Con140 raises water usage as an external cost, undermining the premise that nuclear is competitive when all externalities are considered.
att(con140b, pro36).  % [NONE] conf=75 — Con140b adds ecological damage from water cooling, another external cost that weakens pro36's claim.
att(con23, pro36).  % [NONE] conf=70 — Con23 argues perfect security is impossible, implying safety risks (external costs) that contradict pro36's competitiveness premise.
att(con152, pro36).  % [NONE] conf=80 — Con152 cites environmental impacts of uranium, an external cost not accounted for in pro36's statement.
att(con109, pro36).  % [NONE] conf=85 — Con109 provides evidence of massive cost overruns, showing that external cost assumptions in pro36 are unrealistic.
att(con109b, pro36).  % [NONE] conf=85 — B claims alternatives give more climate benefit per dollar, contradicting A's claim that nuclear is very competitive when external costs are included.
att(con9, pro36).  % [NONE] conf=70 — B introduces terrorist‑target risk, implying additional external costs not accounted for in A's competitiveness claim.
att(con9b, pro36).  % [NONE] conf=70 — B points to waste‑related terrorist risk, suggesting extra external costs that undermine A's premise of competitiveness when all externalities are considered.
att(con109, pro32).  % [NONE] conf=70 — The cost‑overrun argument challenges the practicality of achieving the promised unlimited energy.
att(con36, pro29).  % [NONE] conf=70 — Unresolved nuclear waste problems challenge the overall advantage claimed for nuclear cost‑effectiveness.
att(con27b, pro29).  % [NONE] conf=80 — High mining, refining, and transport costs directly undermine the claim that nuclear is cheaper than wind or solar.
att(con27c, pro29).  % [NONE] conf=70 — B highlights environmental waste that, if internalized, could negate A's claim that nuclear is cheaper.
att(con152, pro29).  % [NONE] conf=70 — B emphasizes uranium’s environmental impact, which could be factored into costs, challenging A's cheaper claim.
att(con109, pro29).  % [NONE] conf=90 — B provides concrete evidence of large overruns, directly contradicting A's assertion of lower cost.
att(con109b, pro29).  % [NONE] conf=80 — B argues alternative methods give more climate benefit per dollar, disputing A's cost-effectiveness claim.
att(con36, pro29b).  % [NONE] conf=70 — B points out unresolved nuclear waste issues, undermining A's implication that nuclear is a cheaper alternative to wind/solar.
att(con27, con109b).  % [NONE] conf=85 — A shows uranium’s finiteness, undermining B’s premise that nuclear is a viable long‑term option to compare against alternatives