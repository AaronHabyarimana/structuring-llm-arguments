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
att(pro82, con36).  % [rebuttal] conf=95 — Pro asserts storage is safe, con asserts waste remains an unresolved problem, which are mutually exclusive conclusions
att(con23, pro82).  % [undermining] conf=92 — The con argument claims 100% security is impossible, directly challenging the premise that storage can be safe and secure.
att(con9b, pro82).  % [undermining] conf=95 — Suggesting nuclear waste could be terrorist targets directly undermines the premise that storage is safe and secure.
att(con9b, pro82b).  % [undermining] conf=70 — Con9b argues nuclear waste could be terrorist targets, challenging the safety premise behind the claim that disposal plans are well in hand.
att(pro82b, con36).  % [rebuttal] conf=95 — Pro claim that disposal plans are ready directly contradicts con claim that nuclear waste remains an unresolved problem.
att(pro15a, con36).  % [rebuttal] conf=95 — Pro asserts waste storage is robust, while con claims nuclear waste is an unresolved problem; the conclusions are mutually exclusive.
att(con9b, pro15a).  % [rebuttal] conf=95 — Saying waste could be terrorist targets contradicts the claim that waste storage is robust.
att(pro15b, con9b).  % [undermining] conf=75 — A claims waste is often stored below ground, which attacks B's premise that nuclear waste is an easy target for terrorists.
att(con36, pro36).  % [undermining] conf=90 — Con36 challenges the premise that nuclear’s external costs are manageable by highlighting unresolved waste issues.
att(con27, pro36).  % [undermining] conf=80 — Con27 attacks the premise that nuclear resources are effectively unlimited, questioning long‑term competitiveness.
att(con27b, pro36).  % [undermining] conf=85 — Con27b undermines the premise that external costs are low by pointing out high mining, refining, and transport expenses.
att(con27c, pro36).  % [undermining] conf=85 — Con27c attacks the premise of low external costs by noting significant greenhouse‑gas emissions from uranium production.
att(con140, pro36).  % [undermining] conf=80 — Con140 challenges the premise that nuclear’s external costs are negligible by highlighting large water‑use requirements.
att(con140b, pro36).  % [undermining] conf=80 — Con140b undermines the premise of low external costs by showing water‑draw impacts on aquatic wildlife.
att(con23, pro36).  % [undermining] conf=75 — Con23 attacks the premise that nuclear can be made safely cost‑effective by asserting perfect security is impossible.
att(con152, pro36).  % [undermining] conf=80 — Con152 undermines the premise of competitive external costs by emphasizing major environmental impacts of uranium.
att(con109, pro36).  % [undermining] conf=85 — Con109 attacks the premise of cost competitiveness by presenting high construction costs and historic overruns.
att(con27b, pro29).  % [undermining] conf=75 — Claims uranium is expensive undermine the premise that nuclear’s total cost is lower than wind/solar
att(con109, pro29).  % [rebuttal] conf=70 — The con argument asserts nuclear is extremely expensive, directly contradicting the pro claim that it is much cheaper.
att(con36, pro82).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro asserts storage is safe, con asserts waste remains an unresolved problem, which are mutually exclusive conclusions
att(con36, pro82b).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro claim that disposal plans are ready directly contradicts con claim that nuclear waste remains an unresolved problem.
att(con36, pro15a).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro asserts waste storage is robust, while con claims nuclear waste is an unresolved problem; the conclusions are mutually exclusive.
att(pro15a, con9b).  % [rebuttal] conf=95 — [symmetric rebuttal] Saying waste could be terrorist targets contradicts the claim that waste storage is robust.
att(pro29, con109).  % [rebuttal] conf=70 — [symmetric rebuttal] The con argument asserts nuclear is extremely expensive, directly contradicting the pro claim that it is much cheaper.