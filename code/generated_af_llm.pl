% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro1).  % [pro] Nuclear energy provides large amounts of reliable baseload electricity with minimal greenhouse gas emissions.
arg(pro2).  % [pro] Modern reactor designs incorporate passive safety features that significantly reduce accident risk.
arg(pro3).  % [pro] The high energy density of nuclear fuel means far less land use compared to renewable farms.
arg(pro4).  % [pro] Nuclear power can help stabilize electricity grids that rely on intermittent renewable sources.
arg(pro5).  % [pro] Advanced fuel cycles allow for recycling of spent fuel, extending uranium resources.
arg(pro6).  % [pro] Nuclear plants have long operational lifespans, delivering consistent power for decades.
arg(pro7).  % [pro] Investments in nuclear research drive technological innovations applicable to medicine and industry.
arg(con1).  % [con] Nuclear accidents, though rare, can cause catastrophic environmental and health impacts.
arg(con2).  % [con] The long‑term storage of radioactive waste remains an unsolved and costly challenge.
arg(con3).  % [con] High capital costs and long construction times make nuclear projects financially risky.
arg(con4).  % [con] Nuclear proliferation concerns arise from the dual‑use nature of fissile material.
arg(con5).  % [con] Decommissioning aging reactors requires substantial resources and can take decades.
arg(con6).  % [con] Public opposition to nuclear facilities often leads to delays and regulatory hurdles.
arg(con7).  % [con] Renewable energy technologies are rapidly decreasing in cost, making nuclear less competitive.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con1, pro1).  % [undermining] conf=70 — Con1 challenges the reliability premise by highlighting accident risks.
att(con5, pro1).  % [undermining] conf=80 — Con5 highlights costly, lengthy decommissioning, challenging the premise that nuclear provides reliable baseload power over time.
att(con6, pro1).  % [undermining] conf=75 — Con6 points to public opposition causing delays, which weakens the claim of reliable, uninterrupted nuclear electricity.
att(con7, pro1).  % [rebuttal] conf=85 — Con7 argues that falling renewable costs make nuclear less competitive, directly contradicting the implied superiority of nuclear in the pro argument.
att(con1, pro2).  % [rebuttal] conf=90 — Con1 emphasizes catastrophic potential of accidents, directly contradicting the pro claim of reduced accident risk.
att(con2, pro2).  % [undermining] conf=80 — Con2 challenges the overall safety narrative by highlighting unresolved waste storage issues, undermining the premise of nuclear’s safety.
att(pro3, con4).  % [undermining] conf=70 — By highlighting that less fuel is needed, the high energy density claim weakens the premise that nuclear necessarily creates proliferation‑risk material.
att(con1, pro4).  % [undermining] conf=80 — The risk of catastrophic accidents challenges the premise that nuclear can reliably stabilize the grid.
att(con3, pro4).  % [undermining] conf=70 — High capital costs and long construction times challenge the feasibility of deploying nuclear for grid stability.
att(con5, pro4).  % [undermining] conf=65 — Decommissioning costs and timelines weaken the premise that nuclear is a practical solution for grid stability.
att(con6, pro4).  % [undermining] conf=70 — Public opposition and regulatory delays undermine the premise that nuclear can be deployed to support grid stability.
att(con7, pro4).  % [rebuttal] conf=75 — The falling cost of renewables directly challenges the claim that nuclear is needed to stabilize grids.
att(con2, pro5).  % [undermining] conf=80 — The claim that waste storage is unsolved undermines the premise that advanced fuel cycles solve the waste problem.
att(pro5, con7).  % [rebuttal] conf=70 — A argues that advanced cycles improve resource availability, countering B's claim that nuclear is becoming less competitive
att(con5, pro6).  % [undermining] conf=70 — Con5 highlights costly decommissioning, challenging the premise that long lifespans are an unqualified benefit.
att(con6, pro6).  % [undermining] conf=70 — Con6 points out public opposition can cause delays, weakening the claim of consistent power delivery.
att(con7, pro6).  % [undercutting] conf=80 — Con7 shows cheaper renewables make nuclear’s long‑life advantage insufficient for competitiveness.
att(con1, pro7).  % [undermining] conf=75 — Con1 raises catastrophic accident risks, questioning the net benefit of nuclear research innovations.
att(con2, pro7).  % [undermining] conf=75 — Con2 stresses unresolved waste storage, undermining the premise that nuclear research yields overall positive outcomes.
att(con3, pro7).  % [undermining] conf=80 — Con3 highlights high costs and long build times, challenging the claim that nuclear research investment is advantageous.
att(con4, pro7).  % [undermining] conf=80 — Con4 points to proliferation concerns, attacking the premise that nuclear research benefits outweigh risks.
att(con5, pro7).  % [undermining] conf=75 — Con5 emphasizes expensive decommissioning, weakening the argument that nuclear research is broadly beneficial.
att(con6, pro7).  % [undermining] conf=70 — Con6 notes public opposition can delay projects, undermining the presumed positive impact of nuclear research.
att(con7, pro7).  % [undercutting] conf=80 — Con7 argues falling renewable costs make nuclear research less compelling, undercutting the conclusion of its overall value.