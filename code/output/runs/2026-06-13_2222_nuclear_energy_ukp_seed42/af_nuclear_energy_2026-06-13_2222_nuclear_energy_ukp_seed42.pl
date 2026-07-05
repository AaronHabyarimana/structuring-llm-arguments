% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level
arg(pro4).  % [pro] Various actors have, to varying degrees, either changed their public stance or conceded that nuclear power is virtually emission-free regarding CO2.
arg(pro4b).  % [pro] Because nuclear power is virtually emission-free regarding CO2, it merits at least grudging support as part of the response to increasing atmospheric CO2 levels and the depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(con71).  % [con] In 2 out of 3 melt-downs there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 melt-downs there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 melt-downs there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that can not be used in nuclear weapons?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions, such as renewable energy systems.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con63, pro82).  % [undermining] conf=75 — The question about terrorist use challenges the premise that storage is secure.
att(pro82, con36).  % [rebuttal] conf=90 — Claiming storage is safe directly contradicts the claim that nuclear waste remains an unresolved problem
att(con36, pro82b).  % [rebuttal] conf=95 — B says nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(con63, pro15).  % [undermining] conf=70 — B questions the safety of nuclear waste against terrorism, challenging the premise that storage is robust.
att(pro15, con36).  % [rebuttal] conf=90 — A claims waste storage is robust, which contradicts B’s claim that nuclear waste remains an unresolved problem.
att(pro15b, con36).  % [undermining] conf=70 — A provides a premise (storage often below ground) that challenges B’s implicit premise that waste remains unresolved because of inadequate storage.
att(con71b, pro4b).  % [undermining] conf=75 — The claim of over 1,000 deaths in 1 out of 5 melt‑downs challenges the safety premise underlying the support argument.
att(con71c, pro4b).  % [rebuttal] conf=90 — Con71c’s claim of massive deaths in a rare melt‑down contradicts pro4b’s conclusion that nuclear power should be supported.
att(con58, pro4b).  % [rebuttal] conf=95 — Con58 argues that subsidies should go to renewables, directly opposing pro4b’s claim that nuclear merits support.
att(con36, pro4b).  % [rebuttal] conf=95 — Con36’s statement that nuclear waste is an unresolved problem conflicts with pro4b’s endorsement of nuclear power.
att(con71b, pro95).  % [rebuttal] conf=70 — Con71b’s estimate of thousands of deaths in a melt‑down challenges pro95’s implication that nuclear radiation is harmless enough to justify its use.
att(con71c, pro95).  % [rebuttal] conf=70 — Con71c’s claim of 50,000 deaths in a rare accident undermines pro95’s argument that low‑level radiation poses no health risk.
att(con63, con36).  % [undermining] conf=70 — A questions the unique threat of nuclear waste, challenging a premise underlying B's claim that waste is an unresolved problem
att(con36, pro82).  % [rebuttal] conf=90 — [symmetric rebuttal] Claiming storage is safe directly contradicts the claim that nuclear waste remains an unresolved problem
att(pro82b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] B says nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(con36, pro15).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims waste storage is robust, which contradicts B’s claim that nuclear waste remains an unresolved problem.
att(pro4b, con71c).  % [rebuttal] conf=90 — [symmetric rebuttal] Con71c’s claim of massive deaths in a rare melt‑down contradicts pro4b’s conclusion that nuclear power should be supported.
att(pro4b, con58).  % [rebuttal] conf=95 — [symmetric rebuttal] Con58 argues that subsidies should go to renewables, directly opposing pro4b’s claim that nuclear merits support.
att(pro4b, con36).  % [rebuttal] conf=95 — [symmetric rebuttal] Con36’s statement that nuclear waste is an unresolved problem conflicts with pro4b’s endorsement of nuclear power.
att(pro95, con71b).  % [rebuttal] conf=70 — [symmetric rebuttal] Con71b’s estimate of thousands of deaths in a melt‑down challenges pro95’s implication that nuclear radiation is harmless enough to justify its use.
att(pro95, con71c).  % [rebuttal] conf=70 — [symmetric rebuttal] Con71c’s claim of 50,000 deaths in a rare accident undermines pro95’s argument that low‑level radiation poses no health risk.