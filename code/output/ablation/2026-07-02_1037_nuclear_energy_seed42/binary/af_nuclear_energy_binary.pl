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
att(con36, pro82).  % [NONE] conf=90 — Con36 claims waste storage is an unresolved problem, directly contradicting pro82's claim of safe and secure storage.
att(con23, pro82).  % [NONE] conf=80 — Con23 argues that 100 % security is technically impossible, undermining the claim that storage is safe and secure.
att(con9, pro82).  % [NONE] conf=70 — Con9 suggests nuclear plants are terrorist targets, challenging the assertion that storage is safe and secure.
att(con9b, pro82).  % [NONE] conf=85 — Con9b claims nuclear waste could be terrorist targets, directly attacking the safety and security claim.
att(pro82b, con36).  % [NONE] conf=90 — Claiming solid disposal plans directly undermines the assertion that nuclear waste is an unresolved problem.
att(con9b, pro82b).  % [NONE] conf=80 — Highlighting waste as terrorist targets challenges the safety and feasibility of the proposed disposal plans.
att(con36, pro15a).  % [NONE] conf=90 — Con36 claims nuclear waste is an unresolved problem, directly contradicting pro15a's claim that waste storage is robust.
att(con152, pro15a).  % [NONE] conf=80 — B claims uranium's environmental impact is a major issue, undermining A's claim that waste storage is robust.
att(con9b, pro15a).  % [NONE] conf=75 — B suggests nuclear waste could be terrorist targets, challenging A's assertion of robust storage.
att(pro15b, con9b).  % [NONE] conf=70 — asserting waste is stored underground undermines the claim that nuclear waste is a preferred terrorist target
att(con109b, pro36).  % [NONE] conf=80 — B claims alternatives give more climate benefit per dollar, contradicting A's claim that nuclear is very competitive when external costs are accounted
att(con9, pro36).  % [NONE] conf=85 — B introduces terrorist‑target risk as an external cost not considered by A, undermining A's competitiveness claim
att(con9b, pro36).  % [NONE] conf=80 — B points to nuclear waste as a terrorist target, adding an external cost that A's analysis omits
att(con36, pro36).  % [NONE] conf=95 — Con36 highlights unresolved nuclear waste, an external cost that undermines pro36’s claim of competitiveness when external costs are accounted.
att(con27, pro36).  % [NONE] conf=90 — Con27 points out uranium’s finiteness, challenging the long‑term cost assumptions underlying pro36’s competitiveness claim.
att(con27b, pro36).  % [NONE] conf=90 — Con27b stresses high uranium extraction costs, which increase external costs and weaken pro36’s argument.
att(con27c, pro36).  % [NONE] conf=90 — Con27c notes significant greenhouse‑gas emissions from uranium processing, adding external costs that contradict pro36’s premise.
att(con140, pro36).  % [NONE] conf=85 — Con140 points out large water usage for cooling, an external environmental cost omitted in pro36’s competitiveness claim.
att(con140b, pro36).  % [NONE] conf=85 — Con140b highlights aquatic wildlife impacts from cooling water, adding external costs that undermine pro36’s premise.
att(con23, pro36).  % [NONE] conf=80 — Con23 argues that perfect security is impossible, implying higher safety costs that challenge pro36’s cost competitiveness claim.
att(con152, pro36).  % [NONE] conf=85 — Con152 cites major environmental impacts of uranium, increasing external costs and contradicting pro36’s assertion.
att(con109, pro36).  % [NONE] conf=90 — Con109 provides evidence of massive cost overruns for nuclear plants, directly refuting pro36’s claim of competitiveness when costs are accounted.
att(con36, pro29).  % [NONE] conf=70 — Highlighting unresolved nuclear waste issues challenges the premise that nuclear power is overall cheaper than wind or solar.
att(con27b, pro29).  % [NONE] conf=85 — Stating that uranium mining, refining, and transport are expensive directly attacks the argument that nuclear is cheaper than wind or photovoltaic systems.
att(con109, pro29).  % [NONE] conf=95 — Con109 cites massive cost overruns that directly refute the claim that nuclear is cheaper.
att(con109b, pro29).  % [NONE] conf=90 — Con109b argues other methods give more climate‑saving per dollar, undermining nuclear's cost advantage.
att(con109, pro29b).  % [NONE] conf=70 — B cites massive cost overruns for nuclear plants, showing nuclear is also financially burdensome, challenging A's call to bear high wind/solar costs.