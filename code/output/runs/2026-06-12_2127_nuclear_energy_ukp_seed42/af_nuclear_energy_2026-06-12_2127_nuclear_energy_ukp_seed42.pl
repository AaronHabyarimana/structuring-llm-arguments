% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans for eventual disposal are well in hand
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] Nuclear power is virtually emission-free regarding CO2 and therefore merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(pro36).  % [pro] If external costs are accounted, nuclear is very competitive.
arg(pro32).  % [pro] If we know how to control atomic fusion, the same reactions that fuel the sun, we can have almost unlimited energy.
arg(pro29).  % [pro] Nuclear is much cheaper than wind or photovoltaic energy.
arg(pro29b).  % [pro] The high costs of wind and solar must be borne for the sake of the environment.
arg(con36).  % [con] Nuclear wastes, such as spent fuel, are an unresolved problem.
arg(con27).  % [con] Uranium sources are just as finite as other fuel sources such as coal and natural gas.
arg(con27b).  % [con] Uranium sources are expensive to mine, refine, and transport.
arg(con27c).  % [con] Uranium sources produce considerable environmental waste, including greenhouse gases, during mining, refining, and transport processes.
arg(con140).  % [con] Cooling nuclear power plant operations often requires a whole lot of water.
arg(con140b).  % [con] The drawing and releasing of that water can affect aquatic wildlife.
arg(con23).  % [con] It is technically impossible to build a plant with 100 % security .
arg(con152).  % [con] One of the biggest issues is environmental impact in relation to uranium.
arg(con109).  % [con] Recent price estimates for a large nuclear plant in Florida are $12 billion to $18 billion, and the nuclear industry has a history of 250 percent cost overruns.
arg(con109b).  % [con] Alternative energy methods would yield much more climate‑saving benefit per dollar than nuclear power.
arg(con9).  % [con] Nuclear power plants and nuclear waste could be preferred targets for terrorist attacks.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con23, pro82).  % [undermining] conf=90 — The claim that 100 % security is impossible attacks the premise that storage can be fully safe and secure
att(con9, pro82).  % [undermining] conf=90 — Terrorist targeting concerns undermine the premise that storage is secure
att(con36, pro82).  % [rebuttal] conf=90 — The conclusion that nuclear waste is an unresolved problem directly contradicts the claim that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=95 — Con36 claims nuclear waste is an unresolved problem, directly contradicting the claim that disposal plans are well in hand.
att(con36, pro15).  % [rebuttal] conf=95 — B claims nuclear waste is an unresolved problem, directly contradicting A's claim that waste storage is robust
att(con23, pro15).  % [undermining] conf=70 — con23 claims 100 % security is impossible, challenging the premise that waste storage is robust.
att(con9, pro15).  % [undermining] conf=65 — con9 suggests nuclear waste could be terrorist targets, questioning the claim that storage is robust.
att(pro15b, con36).  % [rebuttal] conf=90 — A claims waste storage is often below ground, implying safe handling, which directly contradicts B's claim that nuclear waste remains an unresolved problem.
att(con9, pro15b).  % [undermining] conf=70 — The terrorist‑target claim challenges the safety implication of underground storage presented by the pro argument.
att(con27, pro4).  % [undermining] conf=55 — Stating uranium is as finite as fossil fuels undermines the premise that nuclear can sustainably replace them.
att(con27c, pro4).  % [undermining] conf=90 — Con27c claims uranium mining emits greenhouse gases, contradicting pro4's premise that nuclear is virtually CO2‑free.
att(con152, pro4).  % [undermining] conf=88 — Con152 asserts significant environmental impact from uranium, undermining pro4's premise of near‑zero emissions.
att(con109b, pro4).  % [rebuttal] conf=70 — Con109b argues alternative energies give more climate benefit per dollar, directly opposing pro4's endorsement of nuclear support.
att(con36, pro36).  % [undermining] conf=90 — Con36 points out unresolved waste problems, challenging the premise that all external costs are already accounted for in pro36.
att(con27b, pro36).  % [undermining] conf=75 — Con27b highlights additional mining and transport expenses, undermining the premise that external costs are fully accounted for.
att(con27c, pro36).  % [undermining] conf=75 — Con27c stresses environmental waste from uranium production, challenging the completeness of the external‑cost accounting in pro36.
att(con140, pro36).  % [undermining] conf=80 — B points out water use, an external cost not accounted for, challenging the premise that all external costs are included.
att(con140b, pro36).  % [undermining] conf=80 — B highlights ecological harm from water discharge, questioning whether such external costs are truly accounted.
att(con23, pro36).  % [undermining] conf=70 — B claims 100 % security is impossible, suggesting safety risks (external costs) are omitted from A's competitiveness claim.
att(con152, pro36).  % [undermining] conf=75 — B emphasizes uranium’s environmental impact, implying a missing external cost in A’s analysis.
att(con109, pro36).  % [undercutting] conf=85 — B shows that even with external costs accounted, huge capital overruns make nuclear uncompetitive, breaking the inference to A’s conclusion.
att(con109b, pro36).  % [rebuttal] conf=80 — B asserts alternative energies give more climate benefit per dollar, directly contradicting A’s claim that nuclear is competitive.
att(con9, pro36).  % [undermining] conf=75 — B raises terrorism risk, an external cost that A’s competitiveness claim assumes has been accounted for.
att(con36, pro29).  % [undermining] conf=70 — Con36 highlights waste disposal costs that challenge the cost premise of pro29
att(con27, pro29).  % [undermining] conf=60 — Con27 argues uranium’s finiteness could raise future costs, weakening pro29’s cheapness claim
att(con27b, pro29).  % [undermining] conf=80 — Con27b points out high mining, refining and transport expenses, directly attacking the cost premise of pro29
att(con140, pro29).  % [undercutting] conf=55 — Con140 shows water‑intensive cooling adds hidden costs, questioning whether pro29’s cheapness conclusion follows
att(con109, pro29).  % [rebuttal] conf=90 — Con109 provides evidence of massive overruns and high price estimates, directly contradicting pro29’s cheaper‑than‑renewables claim
att(con109b, pro29).  % [undercutting] conf=70 — Con109b argues alternative energies give more climate benefit per dollar, undercutting the cost‑effectiveness conclusion of pro29
att(con27c, pro29b).  % [undermining] conf=70 — B shows uranium mining creates environmental waste, challenging A’s premise that only wind/solar impose environmental costs.
att(con23, pro29b).  % [undermining] conf=70 — B argues nuclear cannot achieve 100 % security, attacking A’s premise that nuclear is a safe alternative to costly renewables.
att(con152, pro29b).  % [undermining] conf=70 — B emphasizes uranium’s environmental impact, undermining A’s claim that wind/solar costs are justified solely for environmental reasons.
att(con109, pro29b).  % [undermining] conf=75 — B provides evidence of large cost overruns for nuclear plants, challenging A’s premise that nuclear is cheaper than wind/solar.
att(pro82, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] The conclusion that nuclear waste is an unresolved problem directly contradicts the claim that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36 claims nuclear waste is an unresolved problem, directly contradicting the claim that disposal plans are well in hand.
att(pro15, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] B claims nuclear waste is an unresolved problem, directly contradicting A's claim that waste storage is robust
att(con36, pro15b).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims waste storage is often below ground, implying safe handling, which directly contradicts B's claim that nuclear waste remains an unresolved problem.
att(pro4, con109b).  % [rebuttal] conf=70 — [symmetric rebuttal] Con109b argues alternative energies give more climate benefit per dollar, directly opposing pro4's endorsement of nuclear support.
att(pro36, con109b).  % [rebuttal] conf=80 — [symmetric rebuttal] B asserts alternative energies give more climate benefit per dollar, directly contradicting A’s claim that nuclear is competitive.
att(pro29, con109).  % [rebuttal] conf=90 — [symmetric rebuttal] Con109 provides evidence of massive overruns and high price estimates, directly contradicting pro29’s cheaper‑than‑renewables claim