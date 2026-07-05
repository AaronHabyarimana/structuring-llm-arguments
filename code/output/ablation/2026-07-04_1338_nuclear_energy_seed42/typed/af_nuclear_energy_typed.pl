% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure.
arg(pro82b).  % [pro] Plans for eventual disposal are well in hand.
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] They have to varying degrees either changed their public stance , or conceded that since nuclear power is virtually emission-free regarding CO2 , it merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels .
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(pro36).  % [pro] If external costs are accounted, nuclear is very competitive.
arg(pro32).  % [pro] Also, if we know how to control atomic fusion, the same reactions that fuel the sun, we can have almost unlimited energy.
arg(pro29).  % [pro] Nuclear is much cheaper than wind or photovoltaic (PV).
arg(pro29b).  % [pro] We have to bear the high costs of wind and solar for the sake of the environment.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.
arg(con27).  % [con] Uranium sources are just as finite as other fuel sources such as coal and natural gas.
arg(con27b).  % [con] Uranium sources are expensive to mine, refine, and transport.
arg(con27c).  % [con] Uranium sources produce considerable environmental waste, including greenhouse gases, during mining, refining, and transport processes.
arg(con140).  % [con] Cooling nuclear power plant operations often requires a whole lot of water.
arg(con140b).  % [con] The drawing and releasing of that water can affect aquatic wildlife.
arg(con23).  % [con] Building a plant with 100% security is technically impossible.
arg(con152).  % [con] One of the biggest issues is environmental impact in relation to uranium.
arg(con109).  % [con] Recent price estimates for a large plant in Florida are $12 billion to $18 billion, and that is before considering the nuclear industry's history of 250 percent cost overruns.
arg(con109b).  % [con] Alternative methods would yield much more climate‑saving bang for our buck than nuclear power.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro82, con36).  % [rebuttal] conf=90 — Pro82 claims storage is safe, while con36 says nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(con23, pro82).  % [undermining] conf=90 — It claims 100% security is technically impossible, directly challenging the premise that storage can be safe and secure.
att(con9b, pro82).  % [undermining] conf=90 — It asserts nuclear waste could be terrorist targets, directly attacking the premise that storage is safe and secure.
att(con36, pro82b).  % [rebuttal] conf=95 — B claims nuclear waste is unresolved, directly contradicting A's claim that disposal plans are well in hand.
att(con152, pro82b).  % [undermining] conf=70 — Highlighting uranium’s environmental impact challenges the premise that waste disposal is the main manageable issue.
att(con9b, pro82b).  % [undermining] conf=85 — Stating nuclear waste could be terrorist targets attacks the premise that disposal plans are secure and well‑handed.
att(pro15, con36).  % [rebuttal] conf=95 — Pro15 asserts waste storage is robust, directly contradicting con36’s claim that nuclear waste remains an unresolved problem.
att(con9b, pro15).  % [undermining] conf=85 — If nuclear waste is a terrorist target, the claim that waste storage is robust is called into question.
att(pro15b, con36).  % [undermining] conf=90 — Pro15b provides evidence that waste is stored below ground, challenging the premise that nuclear waste is an unresolved problem.
att(con9b, pro15b).  % [undermining] conf=70 — The claim that nuclear waste could be terrorist targets challenges the safety implication of storing waste below ground.
att(con36, pro4).  % [undermining] conf=92 — Con36 attacks the premise that nuclear power is an acceptable solution by highlighting unresolved nuclear waste issues
att(con27, pro4).  % [undermining] conf=90 — Con27 undermines the premise that nuclear mitigates fuel depletion by pointing out uranium is also finite
att(con27b, pro4).  % [undermining] conf=88 — Con27b challenges the feasibility premise by asserting uranium extraction is costly
att(con27c, pro4).  % [undermining] conf=91 — Con27c attacks the claim that nuclear is virtually CO₂‑free by noting greenhouse‑gas emissions from uranium mining and processing
att(con140, pro4).  % [undermining] conf=85 — Con140 undermines the environmental‑benefit premise by emphasizing the large water consumption required for cooling
att(con140b, pro4).  % [undermining] conf=84 — Con140b further attacks the premise of overall environmental friendliness by citing harm to aquatic wildlife from water use
att(con23, pro4).  % [undermining] conf=87 — Con23 challenges the safety premise by stating that 100 % security in nuclear plants is technically impossible
att(con152, pro4).  % [undermining] conf=86 — Con152 attacks the premise of nuclear’s environmental advantage by highlighting uranium‑related impacts
att(con109, pro4).  % [undermining] conf=89 — Con109 undermines the economic feasibility premise by presenting high cost estimates and historic overruns
att(con109b, pro4).  % [undermining] conf=80 — Con109b claims alternatives are more cost‑effective, challenging the premise that nuclear is needed for climate mitigation.
att(con9, pro4).  % [rebuttal] conf=70 — Con9 asserts nuclear plants are terrorist targets, contradicting pro4’s claim that nuclear merits support.
att(con9b, pro4).  % [rebuttal] conf=70 — Con9b says nuclear waste could be terrorist targets, opposing the idea that nuclear should be supported.
att(con36, pro95).  % [undercutting] conf=75 — Con36 questions the safety conclusion of pro95 by highlighting unresolved nuclear waste issues.
att(con36, pro36).  % [undermining] conf=70 — The claim about unresolved nuclear waste challenges the premise that all external costs are accounted in A's competitiveness claim.
att(con27b, pro36).  % [undermining] conf=70 — Highlighting high mining and processing costs attacks the assumption that external costs are fully accounted in A.
att(con27c, pro36).  % [undermining] conf=70 — Pointing out environmental waste from uranium extraction undermines the premise of fully accounted external costs in A.
att(con140, pro36).  % [undermining] conf=65 — The large water requirement for cooling challenges the completeness of external cost accounting in A's claim.
att(con140b, pro36).  % [undermining] conf=65 — Potential harm to aquatic wildlife from water use questions whether all external costs are included in A's competitiveness argument.
att(con152, pro36).  % [undermining] conf=65 — Identifying uranium’s environmental impact attacks the premise that external costs are fully accounted in A's claim.
att(con109, pro36).  % [rebuttal] conf=92 — B claims huge costs and overruns, contradicting A's claim that nuclear is competitive when external costs are included.
att(con109b, pro36).  % [rebuttal] conf=85 — B argues alternative methods give more climate benefit per dollar, implying nuclear is not the most competitive option.
att(con9, pro36).  % [undermining] conf=88 — B introduces terrorist‑target risk, challenging the premise that all external costs (including security) are already accounted for in A.
att(con9b, pro36).  % [undermining] conf=88 — B points to nuclear waste as a terrorist target, undermining the assumption that external costs are fully accounted for.
att(con36, pro29).  % [undermining] conf=70 — The waste problem challenges the premise that nuclear’s lower cost makes it superior to wind or PV
att(con27b, pro29).  % [undermining] conf=90 — Con argument claims uranium is expensive, challenging the cost premise behind the pro claim that nuclear is cheaper.
att(con109, pro29).  % [rebuttal] conf=95 — Con argument provides high cost estimates and overruns, directly contradicting the claim that nuclear is much cheaper.
att(con36, pro82).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro82 claims storage is safe, while con36 says nuclear waste remains an unresolved problem, making the conclusions mutually exclusive.
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] B claims nuclear waste is unresolved, directly contradicting A's claim that disposal plans are well in hand.
att(con36, pro15).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro15 asserts waste storage is robust, directly contradicting con36’s claim that nuclear waste remains an unresolved problem.
att(pro4, con9).  % [rebuttal] conf=70 — [symmetric rebuttal] Con9 asserts nuclear plants are terrorist targets, contradicting pro4’s claim that nuclear merits support.
att(pro4, con9b).  % [rebuttal] conf=70 — [symmetric rebuttal] Con9b says nuclear waste could be terrorist targets, opposing the idea that nuclear should be supported.
att(pro36, con109).  % [rebuttal] conf=92 — [symmetric rebuttal] B claims huge costs and overruns, contradicting A's claim that nuclear is competitive when external costs are included.
att(pro36, con109b).  % [rebuttal] conf=85 — [symmetric rebuttal] B argues alternative methods give more climate benefit per dollar, implying nuclear is not the most competitive option.
att(pro29, con109).  % [rebuttal] conf=95 — [symmetric rebuttal] Con argument provides high cost estimates and overruns, directly contradicting the claim that nuclear is much cheaper.