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
att(con36, pro82).  % [undermining] conf=85 — Con argument claims nuclear waste is an unresolved problem, challenging the premise that storage is safe
att(con9b, pro82).  % [rebuttal] conf=90 — If nuclear waste can be terrorist targets, it cannot be considered safe and secure
att(con36, pro82b).  % [rebuttal] conf=98 — Con36 states waste is unresolved, directly contradicting pro82b's claim that disposal plans are well in hand
att(con9b, pro82b).  % [undermining] conf=75 — The claim that nuclear waste could be a terrorist target attacks the premise that disposal plans are robust and well‑handed.
att(con36, pro15a).  % [rebuttal] conf=95 — Pro asserts waste storage is robust, while con states nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(con9b, pro15a).  % [undermining] conf=90 — The claim that nuclear waste could be terrorist targets challenges the premise that waste storage is robust
att(pro15b, con9b).  % [undermining] conf=80 — A shows waste is stored underground, weakening B's premise that waste is an easy terrorist target.
att(con36, pro36).  % [undermining] conf=90 — Con36 challenges the premise that external costs can be fully accounted by highlighting unresolved waste issues.
att(con27b, pro36).  % [undercutting] conf=80 — Con27b shows that high mining costs may prevent the conclusion that nuclear is competitive even if external costs are accounted.
att(con27c, pro36).  % [undercutting] conf=75 — Environmental waste from uranium production questions the inference that nuclear remains competitive after accounting for external costs.
att(con140, pro36).  % [undermining] conf=70 — Con140 introduces significant water use as an external cost not considered, undermining the premise of fully accounted costs.
att(con140b, pro36).  % [undermining] conf=70 — Impact on aquatic wildlife adds unaccounted external costs, undermining the premise of the competitiveness claim.
att(con152, pro36).  % [undermining] conf=70 — Highlighting uranium’s environmental impact questions the completeness of external cost accounting.
att(con109, pro36).  % [rebuttal] conf=85 — Con109’s assertion of massive cost overruns directly contradicts the conclusion that nuclear is very competitive.
att(con9, pro36).  % [undermining] conf=75 — B highlights a terrorist‑target risk that A assumes is already accounted for, challenging A's premise that all external costs are considered.
att(con9b, pro36).  % [undermining] conf=75 — B raises a security externality (nuclear waste as a target) that A presumes is included, thereby undermining A's premise about accounted external costs.
att(con109, pro29).  % [undermining] conf=90 — The cost‑overrun data challenges the premise that nuclear is cheaper than wind or solar.
att(con36, pro29b).  % [undermining] conf=70 — Highlighting unresolved nuclear waste problems attacks the implicit premise that nuclear is a viable low‑cost alternative to wind/solar.
att(pro82, con9b).  % [rebuttal] conf=90 — [symmetric rebuttal] If nuclear waste can be terrorist targets, it cannot be considered safe and secure
att(pro82b, con36).  % [rebuttal] conf=98 — [symmetric rebuttal] Con36 states waste is unresolved, directly contradicting pro82b's claim that disposal plans are well in hand
att(pro15a, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro asserts waste storage is robust, while con states nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(pro36, con109).  % [rebuttal] conf=85 — [symmetric rebuttal] Con109’s assertion of massive cost overruns directly contradicts the conclusion that nuclear is very competitive.