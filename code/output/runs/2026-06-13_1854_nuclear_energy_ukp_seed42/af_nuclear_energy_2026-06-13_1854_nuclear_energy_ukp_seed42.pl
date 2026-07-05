% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is also robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] They have to varying degrees either changed their public stance , or conceded that since nuclear power is virtually emission-free regarding CO2 , it merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels .
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(con71).  % [con] In 2 out of 3 melt-downs there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 melt-downs there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 melt-downs there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that can not be used in nuclear weapons?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions such as renewable energy systems.
arg(con36).  % [con] Nuclear wastes, such as spent fuel, are an unresolved problem.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con63, pro82).  % [undermining] conf=70 — B questions the security of waste, attacking the premise that storage is safe
att(con36, pro82).  % [rebuttal] conf=85 — B claims waste remains an unresolved problem, directly contradicting A's claim of safe, secure storage
att(con36, pro82b).  % [rebuttal] conf=90 — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(con71b, pro15).  % [rebuttal] conf=90 — Con71b’s claim of many deaths in a significant fraction of melt‑downs contradicts the conclusion that storage is robust.
att(con71c, pro15).  % [undermining] conf=70 — Con71c challenges the premise that storage is safe by highlighting a catastrophic outcome, even if very rare.
att(con63, pro15).  % [undermining] conf=75 — The question about terrorist use attacks the premise that storage is secure and robust against misuse.
att(con36, pro15).  % [rebuttal] conf=85 — Con36’s statement that nuclear waste is an unresolved problem directly opposes the claim that storage is robust.
att(con63, pro15b).  % [undermining] conf=70 — The question about terrorist use challenges the premise that underground storage makes nuclear waste safe.
att(con36, pro15b).  % [undermining] conf=75 — Stating that nuclear waste is an unresolved problem attacks the implication that underground storage solves the waste issue.
att(con58, pro4).  % [rebuttal] conf=80 — Con58 argues subsidies should go to renewables, directly opposing pro4's conclusion that nuclear merits support.
att(con36, pro4).  % [undercutting] conf=75 — Con36 points out unresolved nuclear waste issues, challenging the inference that nuclear power should be supported.
att(pro82, con36).  % [rebuttal] conf=85 — [symmetric rebuttal] B claims waste remains an unresolved problem, directly contradicting A's claim of safe, secure storage
att(pro82b, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand.
att(pro15, con71b).  % [rebuttal] conf=90 — [symmetric rebuttal] Con71b’s claim of many deaths in a significant fraction of melt‑downs contradicts the conclusion that storage is robust.
att(pro15, con36).  % [rebuttal] conf=85 — [symmetric rebuttal] Con36’s statement that nuclear waste is an unresolved problem directly opposes the claim that storage is robust.
att(pro4, con58).  % [rebuttal] conf=80 — [symmetric rebuttal] Con58 argues subsidies should go to renewables, directly opposing pro4's conclusion that nuclear merits support.