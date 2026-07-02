% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level
arg(pro4).  % [pro] Nuclear power is virtually emission-free regarding CO2 and therefore merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(pro36).  % [pro] If external costs are accounted for, nuclear is very competitive.
arg(pro32).  % [pro] Also, if we know how to control atomic fusion, the same reactions that fuel the sun, we can have almost unlimited energy.
arg(pro29).  % [pro] Nuclear is much cheaper than wind or photovoltaic power.
arg(pro29b).  % [pro] We have to bear the high costs of wind and solar for the sake of the environment.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.
arg(con27).  % [con] Uranium sources are just as finite as other fuel sources such as coal and natural gas.
arg(con27b).  % [con] Uranium is expensive to mine, refine, and transport.
arg(con27c).  % [con] Uranium production produces considerable environmental waste, including greenhouse gases, during all of these processes.
arg(con140).  % [con] Cooling nuclear power plant operations often requires a whole lot of water.
arg(con140b).  % [con] The drawing and releasing of that water can affect aquatic wildlife.
arg(con23).  % [con] Building a plant with 100% security is technically impossible.
arg(con152).  % [con] One of the biggest issues is environmental impact in relation to uranium.
arg(con109).  % [con] The $12 billion to $18 billion price estimate for a large plant in Florida excludes the nuclear industry's history of 250 % cost overruns.
arg(con109b).  % [con] Some analysts claim that alternative methods would yield much more climate‑saving bang for our buck than nuclear power.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con23, pro82).  % [undermining] conf=88 — Claim that 100% security is technically impossible attacks the premise that storage can be fully safe and secure.
att(con9, pro82).  % [undermining] conf=85 — Potential terrorist targeting of nuclear plants challenges the claim that storage is secure.
att(con9b, pro82).  % [undermining] conf=90 — Nuclear waste being a terrorist target directly undermines the assertion that storage is safe and secure.
att(con36, pro82).  % [rebuttal] conf=95 — Con36 claims nuclear waste is an unresolved problem, directly contradicting pro82’s claim that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=95 — B claims nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(con9b, pro82b).  % [undermining] conf=90 — Claim that nuclear waste could be terrorist targets attacks the premise that disposal plans are secure and feasible.
att(con23, pro15).  % [undermining] conf=85 — The claim that 100 % security is impossible challenges the premise that waste storage is robust.
att(con9b, pro15).  % [undermining] conf=90 — Stating that nuclear waste could be a terrorist target attacks the premise that waste storage is robust.
att(pro15, con36).  % [rebuttal] conf=95 — Pro15’s claim that storage is robust directly contradicts con36’s claim that nuclear waste is an unresolved problem.
att(pro15b, con36).  % [rebuttal] conf=90 — A asserts waste is often stored safely underground, contradicting B's claim that nuclear waste is an unresolved problem.
att(con9b, pro15b).  % [undermining] conf=80 — B asserts nuclear waste could be terrorist targets, directly challenging the safety premise of A's underground storage claim.
att(con36, pro4).  % [undermining] conf=85 — B attacks the premise that nuclear is an acceptable solution by highlighting unresolved waste issues.
att(con27, pro4).  % [undermining] conf=80 — B challenges the premise that nuclear alleviates fuel depletion by stating uranium is also finite.
att(con27b, pro4).  % [undermining] conf=78 — B undermines the feasibility premise by pointing out high costs of uranium mining and processing.
att(con27c, pro4).  % [undercutting] conf=88 — B shows that upstream uranium production emits greenhouse gases, so the claim of being virtually CO2‑free does not follow.
att(con140, pro4).  % [undermining] conf=75 — B raises significant water‑use impacts, weakening the environmental benefit premise of nuclear power.
att(con140b, pro4).  % [undermining] conf=75 — B points out aquatic wildlife harm from cooling water, further undermining the environmental advantage claimed by A.
att(con23, pro4).  % [undermining] conf=80 — B attacks the safety premise by stating that 100% secure nuclear plants are technically impossible.
att(con152, pro4).  % [undercutting] conf=82 — B argues that uranium’s overall environmental impact negates the claim that nuclear is a clean solution.
att(con109, pro4).  % [undermining] conf=78 — B undermines the economic feasibility premise by highlighting historic massive cost overruns in nuclear projects.
att(con109b, pro4).  % [rebuttal] conf=70 — Con109b claims alternatives are more cost‑effective, contradicting pro4's claim that nuclear deserves support.
att(con9, pro4).  % [rebuttal] conf=80 — Con9 argues nuclear plants are security liabilities, opposing pro4's endorsement of nuclear support.
att(con9b, pro4).  % [rebuttal] conf=80 — Con9b highlights terrorist targeting of nuclear waste, directly contradicting pro4's positive stance on nuclear.
att(con36, pro36).  % [undermining] conf=90 — Con36 attacks the premise that external costs can be accounted for by highlighting unresolved nuclear waste issues.
att(con27, pro36).  % [undermining] conf=80 — Con27 challenges the premise of long‑term competitiveness by asserting uranium is as finite as other fuels.
att(con27b, pro36).  % [undermining] conf=90 — Con27b undermines the cost premise by pointing out high mining, refining, and transport expenses for uranium.
att(con27c, pro36).  % [undermining] conf=90 — Con27c attacks the external‑cost premise by noting significant environmental waste from uranium production.
att(con140, pro36).  % [undermining] conf=85 — Con140 undermines the premise by introducing large water‑use externalities of nuclear plants.
att(con140b, pro36).  % [undermining] conf=85 — Con140b attacks the same premise, adding ecological harm from water withdrawal and discharge.
att(con23, pro36).  % [undermining] conf=80 — Con23 challenges the feasibility premise, implying security limits raise costs and hurt competitiveness.
att(con152, pro36).  % [undermining] conf=85 — Con152 attacks the external‑cost premise by highlighting major environmental impacts of uranium.
att(con109, pro36).  % [undermining] conf=90 — B points out hidden cost overruns, challenging the cost premise behind A's competitiveness claim
att(con109b, pro36).  % [rebuttal] conf=75 — B asserts alternative methods give more climate benefit per dollar, directly contradicting A's claim that nuclear is very competitive
att(con9, pro36).  % [undermining] conf=70 — B raises terrorist‑target risk, questioning whether external costs are fully accounted in A's competitiveness argument
att(con9b, pro36).  % [undermining] conf=70 — B highlights waste‑related terrorist risk, undermining the completeness of the external‑cost accounting in A
att(con36, pro32).  % [undermining] conf=80 — B attacks the premise that nuclear (including fusion) solves energy needs by citing unresolved waste problems
att(con140, pro32).  % [undercutting] conf=70 — Even if fusion is controlled, the need for large water supplies for cooling could prevent the claimed almost unlimited energy.
att(con140b, pro32).  % [undercutting] conf=70 — Water withdrawal and discharge impacts on wildlife could limit the feasibility of unlimited energy from fusion despite technical control.
att(con23, pro32).  % [undercutting] conf=70 — If 100 % security is impossible, safety concerns may restrict deployment, so unlimited energy does not automatically follow from controlling fusion.
att(con152, pro32).  % [undercutting] conf=70 — Environmental impacts associated with uranium (or similar resources) could hinder large‑scale fusion deployment, breaking the link between control and unlimited energy.
att(con109, pro32).  % [undercutting] conf=70 — Historical cost overruns suggest that even with fusion control, economic barriers may prevent the realization of almost unlimited energy.
att(con109b, pro32).  % [undercutting] conf=70 — If alternative methods deliver more climate benefit per dollar, the promise of unlimited energy from fusion may not be practically relevant.
att(con9, pro32).  % [undercutting] conf=70 — Terrorist targeting risks could limit the deployment of fusion plants, so control alone does not guarantee unlimited energy.
att(con9b, pro32).  % [undercutting] conf=70 — If nuclear waste becomes a terrorist target, societal acceptance may restrict fusion expansion, breaking the link to unlimited energy.
att(con27b, pro29).  % [undermining] conf=85 — Con argues uranium is expensive, challenging the cost premise behind pro's claim of nuclear being cheaper.
att(con109, pro29).  % [undermining] conf=88 — Con points out that cost estimates ignore historic 250% overruns, undermining the premise that nuclear is cheaper.
att(con109b, pro29).  % [rebuttal] conf=80 — Con claims alternative methods give more climate‑saving per dollar, directly contradicting the conclusion that nuclear is cheaper.
att(pro82, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36 claims nuclear waste is an unresolved problem, directly contradicting pro82’s claim that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] B claims nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(con36, pro15).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro15’s claim that storage is robust directly contradicts con36’s claim that nuclear waste is an unresolved problem.
att(con36, pro15b).  % [rebuttal] conf=90 — [symmetric rebuttal] A asserts waste is often stored safely underground, contradicting B's claim that nuclear waste is an unresolved problem.
att(pro4, con109b).  % [rebuttal] conf=70 — [symmetric rebuttal] Con109b claims alternatives are more cost‑effective, contradicting pro4's claim that nuclear deserves support.
att(pro4, con9).  % [rebuttal] conf=80 — [symmetric rebuttal] Con9 argues nuclear plants are security liabilities, opposing pro4's endorsement of nuclear support.
att(pro4, con9b).  % [rebuttal] conf=80 — [symmetric rebuttal] Con9b highlights terrorist targeting of nuclear waste, directly contradicting pro4's positive stance on nuclear.
att(pro36, con109b).  % [rebuttal] conf=75 — [symmetric rebuttal] B asserts alternative methods give more climate benefit per dollar, directly contradicting A's claim that nuclear is very competitive
att(pro29, con109b).  % [rebuttal] conf=80 — [symmetric rebuttal] Con claims alternative methods give more climate‑saving per dollar, directly contradicting the conclusion that nuclear is cheaper.