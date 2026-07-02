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
att(con23, pro82).  % [rebuttal] conf=80 — Pro asserts storage is safe and secure, while con claims 100% security is impossible, making the conclusions mutually exclusive.
att(con9, pro82).  % [undermining] conf=70 — The claim that plants could be terrorist targets attacks the premise that storage is secure.
att(con9b, pro82).  % [undermining] conf=85 — Stating nuclear waste could be terrorist targets directly challenges the assertion that storage is safe and secure.
att(con36, pro82).  % [rebuttal] conf=95 — B claims nuclear waste is an unresolved problem, directly contradicting A's claim that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=95 — A claims disposal plans are well in hand, while B asserts nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(con9b, pro82b).  % [undermining] conf=70 — If nuclear waste is a terrorist target, it challenges the premise that waste disposal plans are secure and well‑handed.
att(pro15a, con36).  % [rebuttal] conf=92 — Pro15a asserts waste storage is robust, while Con36 claims nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(con9b, pro15a).  % [undermining] conf=90 — Claim that nuclear waste could be a terrorist target directly questions the premise that civil waste storage is robust.
att(pro15b, con9b).  % [undermining] conf=80 — Stating that waste is often stored underground attacks the premise that nuclear waste is an attractive terrorist target.
att(pro95, con36).  % [undermining] conf=70 — If low‑level radiation is harmless, the premise that nuclear waste is a serious unresolved problem is weakened.
att(con23, pro95).  % [undermining] conf=70 — B claims perfect security is impossible, challenging the premise that only low radiation levels will occur.
att(con9, pro95).  % [undermining] conf=70 — B suggests plants could be terrorist targets, questioning the premise that exposure will remain low.
att(con9b, pro95).  % [undermining] conf=70 — B indicates nuclear waste could be terrorist targets, undermining the premise of limited low‑level radiation exposure.
att(con36, pro36).  % [undercutting] conf=80 — Con36 shows nuclear waste issues may prevent the conclusion that nuclear is competitive even if external costs are accounted
att(con27, pro36).  % [undermining] conf=70 — Con27 challenges the premise of resource availability that underlies nuclear's competitiveness
att(con27b, pro36).  % [undermining] conf=80 — Con27b attacks the cost premise by highlighting expensive uranium mining and processing
att(con27c, pro36).  % [undermining] conf=80 — Con27c undermines the external‑cost premise by pointing out greenhouse‑gas emissions from uranium production
att(con140, pro36).  % [undermining] conf=75 — Con140 attacks the premise that external costs are fully accounted by noting large water use
att(con140b, pro36).  % [undermining] conf=75 — Con140b further undermines the external‑cost premise by citing ecological harm from water withdrawal
att(con23, pro36).  % [undermining] conf=70 — Con23 attacks the safety/risk premise that underlies the competitiveness claim
att(con152, pro36).  % [undermining] conf=75 — Con152 challenges the external‑cost premise by emphasizing uranium’s environmental impact
att(con109, pro36).  % [undermining] conf=85 — Con109 attacks the cost premise directly by presenting large overruns that negate competitiveness
att(con109b, pro36).  % [rebuttal] conf=82 — B claims alternative methods give more climate‑saving per cost, directly contradicting A’s conclusion that nuclear is very competitive when external costs are counted.
att(con9, pro36).  % [undermining] conf=71 — B introduces terrorist‑target risk as an external cost that A’s competitiveness claim does not account for, thereby undermining A’s premise.
att(con9b, pro36).  % [undermining] conf=71 — B adds nuclear waste as a terrorist target, a security cost omitted from A’s external‑cost calculation, thus undermining A’s premise.
att(con23, pro32).  % [undermining] conf=80 — The claim that 100 % security is impossible challenges the premise that fusion can be safely controlled
att(con9, pro32).  % [undermining] conf=75 — Terrorist targeting of nuclear plants attacks the safety premise underlying the fusion claim
att(con9b, pro32).  % [undermining] conf=75 — Waste being a terrorist target undermines the assumption that fusion power would be safe and manageable
att(con36, pro29).  % [undermining] conf=80 — Unresolved nuclear waste challenges the cost‑effectiveness premise of nuclear energy
att(con27, pro29).  % [undermining] conf=70 — Finite uranium resources question the long‑term cheapness claim of nuclear power
att(con27b, pro29).  % [undermining] conf=80 — High mining, refining, and transport costs undermine the assertion that nuclear is cheaper than renewables
att(con27c, pro29).  % [undermining] conf=70 — The con claim highlights hidden environmental waste from uranium, challenging the premise that nuclear’s lower cost makes it preferable.
att(con140b, pro29).  % [undermining] conf=70 — The environmental harm to aquatic wildlife questions the premise that lower cost outweighs other impacts.
att(con23, pro29).  % [undermining] conf=70 — Claiming 100 % security is impossible attacks the premise that nuclear can be built cheaply without extra safety expenses.
att(con152, pro29).  % [undermining] conf=70 — Emphasizing uranium’s environmental impact undermines the premise that nuclear’s lower price makes it the better option.
att(con109, pro29).  % [rebuttal] conf=90 — The con argument states nuclear projects suffer massive cost overruns, directly contradicting the claim that nuclear is much cheaper.
att(con109b, pro29).  % [undercutting] conf=60 — It argues that other methods give more climate benefit per dollar, showing cheaper cost does not guarantee better outcomes.
att(pro82, con23).  % [rebuttal] conf=80 — [symmetric rebuttal] Pro asserts storage is safe and secure, while con claims 100% security is impossible, making the conclusions mutually exclusive.
att(pro82, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] B claims nuclear waste is an unresolved problem, directly contradicting A's claim that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] A claims disposal plans are well in hand, while B asserts nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(con36, pro15a).  % [rebuttal] conf=92 — [symmetric rebuttal] Pro15a asserts waste storage is robust, while Con36 claims nuclear waste is an unresolved problem, making the conclusions mutually exclusive.
att(pro36, con109b).  % [rebuttal] conf=82 — [symmetric rebuttal] B claims alternative methods give more climate‑saving per cost, directly contradicting A’s conclusion that nuclear is very competitive when external costs are counted.
att(pro29, con109).  % [rebuttal] conf=90 — [symmetric rebuttal] The con argument states nuclear projects suffer massive cost overruns, directly contradicting the claim that nuclear is much cheaper.