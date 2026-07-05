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
att(con23, pro82).  % [NONE] conf=85 — If achieving 100% security in a plant is impossible, it undermines the assertion that nuclear waste storage can be fully safe and secure.
att(con9, pro82).  % [NONE] conf=90 — If nuclear plants are preferred terrorist targets, the safety and security of stored waste could be compromised.
att(con9b, pro82).  % [NONE] conf=95 — Targeting nuclear waste itself directly challenges the claim that waste storage is safe and secure.
att(con36, pro82).  % [NONE] conf=90 — Con36 claims waste storage is an unresolved problem, directly contradicting pro82's claim that storage is safe and secure.
att(con36, pro82b).  % [NONE] conf=95 — Con36 asserts nuclear waste is an unresolved problem, directly contradicting pro82b's claim that disposal plans are well in hand.
att(con23, pro82b).  % [NONE] conf=70 — If 100% security is impossible, it undermines confidence in the robustness of disposal plans.
att(con9b, pro82b).  % [NONE] conf=80 — If nuclear waste is a terrorist target, it challenges the claim that disposal plans are well in hand.
att(con36, pro15a).  % [NONE] conf=90 — Con36 asserts nuclear waste is an unresolved problem, directly challenging pro15a's claim of robust storage.
att(pro15a, con9b).  % [NONE] conf=80 — If waste storage is robust, it undermines the claim that nuclear waste is a likely terrorist target
att(pro15b, con9b).  % [NONE] conf=85 — Underground storage undermines claim that waste is a terrorist target
att(con36, pro36).  % [NONE] conf=95 — unresolved waste raises external costs, undermining nuclear's competitiveness claim
att(con27b, pro36).  % [NONE] conf=90 — high mining/transport costs increase external costs, challenging the competitiveness argument
att(con27c, pro36).  % [NONE] conf=90 — environmental waste from uranium adds external costs, weakening the claim
att(con140, pro36).  % [NONE] conf=85 — large water use is an external cost that can make nuclear less competitive
att(con140b, pro36).  % [NONE] conf=85 — water‑draw impacts wildlife, adding external costs that counter the competitiveness claim
att(con23, pro36).  % [NONE] conf=80 — security impossibility implies risk costs, undermining the competitiveness argument
att(con152, pro36).  % [NONE] conf=85 — environmental impact of uranium adds external costs, challenging the claim
att(con109, pro36).  % [NONE] conf=90 — high construction costs and overruns raise external costs, contradicting competitiveness
att(con109b, pro36).  % [NONE] conf=75 — B claims alternatives give more climate benefit per dollar, contradicting A's claim that nuclear is competitive when external costs are included.
att(con27c, pro29).  % [NONE] conf=70 — Points to hidden environmental costs of uranium that could offset nuclear's claimed cheapness
att(con140, pro29).  % [NONE] conf=75 — Highlights water usage that adds operational expenses, challenging the cost advantage claim
att(con23, pro29).  % [NONE] conf=70 — Claims full security is impossible, implying extra safety expenditures that weaken the cost claim
att(con109, pro29).  % [NONE] conf=90 — Cites high price estimates and large cost overruns, directly contradicting the claim that nuclear is cheaper
att(con109b, pro29).  % [NONE] conf=80 — Argues alternative methods give better climate‑saving per dollar, disputing nuclear’s cost‑effectiveness
att(con9, pro29).  % [NONE] conf=55 — Notes terrorist target risk, implying added security costs that could erode the cheapness claim
att(con9b, pro29).  % [NONE] conf=55 — Points to waste as terrorist target, suggesting extra security/mitigation costs against the cheapness argument
att(con23, pro32).  % [NONE] conf=70 — claims 100 % security is impossible, undermining the feasibility of safe unlimited‑energy fusion plants
att(con36, pro29).  % [NONE] conf=75 — unresolved nuclear waste adds hidden costs, contradicting the claim that nuclear is cheaper
att(con27, pro29).  % [NONE] conf=70 — finite uranium resources imply future cost increases, challenging the cheapness claim
att(con27b, pro29).  % [NONE] conf=85 — high mining, refining, and transport costs directly undermine the assertion that nuclear is much cheaper