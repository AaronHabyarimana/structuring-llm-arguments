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
att(pro82, con36).  % [rebuttal] conf=95 — Pro82 asserts storage is safe, while con36 claims nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(con23, pro82).  % [undermining] conf=80 — The claim that 100% security is impossible challenges the premise that storage can be fully safe and secure.
att(con9, pro82).  % [undermining] conf=85 — Terrorist target risk undermines the premise that storage is secure.
att(con9b, pro82).  % [undermining] conf=90 — Highlighting waste as terrorist targets directly challenges the claim that storage is safe.
att(con36, pro82b).  % [rebuttal] conf=95 — Con36 says nuclear waste is an unresolved problem, directly contradicting pro82b’s claim that disposal plans are well in hand.
att(con36, pro15a).  % [rebuttal] conf=95 — Con36 says nuclear waste is an unresolved problem, directly contradicting pro15a's claim that waste storage is robust.
att(con9b, pro15a).  % [undermining] conf=90 — The claim that nuclear waste could be a terrorist target challenges the premise that waste storage is robust.
att(con36, pro36).  % [undermining] conf=80 — Con36 claims nuclear waste is unresolved, challenging the premise that all external costs are already accounted.
att(con27b, pro36).  % [undermining] conf=75 — Con27b asserts high uranium mining costs, questioning whether external costs have been fully accounted.
att(con27c, pro36).  % [undermining] conf=75 — Con27c highlights environmental waste from uranium, suggesting external costs may be underestimated.
att(con140, pro36).  % [undermining] conf=70 — Con140 points out large water use for cooling, a potential external cost not included in pro36's premise.
att(con140b, pro36).  % [undermining] conf=70 — Con140b notes aquatic impacts from cooling water, challenging the completeness of the external‑cost accounting.
att(con152, pro36).  % [undermining] conf=70 — Con152 cites environmental impacts of uranium, indicating external costs may be omitted.
att(con109, pro36).  % [undermining] conf=80 — Con109 reports huge cost overruns, suggesting the external cost premise of pro36 is unrealistic.
att(con9, pro36).  % [undercutting] conf=70 — The terrorist‑target risk challenges the inference that accounting for external costs makes nuclear competitive.
att(con9b, pro36).  % [undercutting] conf=70 — The waste‑target risk shows that even if external costs are accounted, nuclear may not be competitive.
att(con36, pro29).  % [undermining] conf=70 — unresolved nuclear waste challenges undermine the premise that nuclear power is cheaper overall
att(con27b, pro29).  % [undermining] conf=80 — high uranium mining and processing costs undermine the premise that nuclear is cheaper than wind or PV
att(con109, pro29).  % [rebuttal] conf=95 — Con provides evidence of high construction costs and overruns, directly contradicting the claim that nuclear is much cheaper.
att(con36, pro82).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro82 asserts storage is safe, while con36 claims nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36 says nuclear waste is an unresolved problem, directly contradicting pro82b’s claim that disposal plans are well in hand.
att(pro15a, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36 says nuclear waste is an unresolved problem, directly contradicting pro15a's claim that waste storage is robust.
att(pro29, con109).  % [rebuttal] conf=95 — [symmetric rebuttal] Con provides evidence of high construction costs and overruns, directly contradicting the claim that nuclear is much cheaper.