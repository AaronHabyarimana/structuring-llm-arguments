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
att(pro82, con36).  % [NONE] conf=90 — Pro claim that storage is safe directly contradicts con claim that nuclear waste remains an unresolved problem
att(con23, pro82).  % [NONE] conf=90 — Claiming 100% security is technically impossible undermines the assertion that storage is safe and secure.
att(con9b, pro82).  % [NONE] conf=95 — Stating that nuclear waste could be terrorist targets directly challenges the claim that storage is safe and secure.
att(con9b, pro82b).  % [NONE] conf=75 — Highlighting waste as terrorist targets undermines the claim that disposal plans are secure
att(con36, pro82b).  % [NONE] conf=95 — Con36 claims nuclear waste is an unresolved problem, directly contradicting pro82b's claim that disposal plans are well in hand.
att(pro15a, con36).  % [NONE] conf=90 — Claiming waste storage is robust directly challenges the conclusion that nuclear waste remains an unresolved problem.
att(con9b, pro15a).  % [NONE] conf=85 — B asserts nuclear waste itself could be a terrorist target, directly challenging A’s claim that storage is robust.
att(pro15b, con9b).  % [NONE] conf=80 — asserting waste is stored underground undermines the claim that nuclear waste could be a preferred terrorist target
att(con27b, pro36).  % [NONE] conf=90 — B highlights high uranium costs, undermining A's premise that nuclear remains competitive when external costs are included.
att(con27c, pro36).  % [NONE] conf=80 — B highlights large environmental external costs of uranium, undermining A's claim that nuclear remains competitive when such costs are accounted for.
att(con140, pro36).  % [NONE] conf=90 — B highlights a significant external cost (high water usage) that challenges A's claim that accounting for externalities makes nuclear competitive.
att(con140b, pro36).  % [NONE] conf=90 — B highlights an external cost (water use impact) that A assumes is already accounted, undermining A's premise that nuclear is competitive when all external costs are considered.
att(con152, pro36).  % [NONE] conf=90 — B claims uranium’s environmental impact is a major external cost, undermining A’s premise that accounting for external costs still makes nuclear highly competitive.
att(con109, pro36).  % [NONE] conf=90 — B provides cost data that directly contradicts A's claim that nuclear is very competitive, showing a conflict in conclusions
att(pro32, pro29b).  % [NONE] conf=85 — A shows that a viable fusion alternative would eliminate the need for society to bear the high costs of wind and solar, undermining B's premise.
att(con109b, pro32).  % [NONE] conf=85 — Con asserts alternative methods give more climate benefit per dollar, directly contesting the superiority of fusion’s unlimited energy claim
att(con27b, pro29).  % [NONE] conf=85 — Con highlights high uranium extraction costs, directly challenging the claim that nuclear is cheaper than wind or solar
att(con109, pro29).  % [NONE] conf=90 — B provides concrete cost overruns that directly contradict A's assertion of nuclear being cheaper