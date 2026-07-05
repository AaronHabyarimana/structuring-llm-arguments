% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is also robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] Nuclear power is virtually emission‑free regarding CO₂ and therefore merits at least grudging support as part of the response to increasing atmospheric CO₂ levels and depletion of fossil fuels.
arg(con71).  % [con] In 2 out of 3 melt-downs there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 melt-downs there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 melt-downs there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that can not be used in nuclear weapons?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions, such as renewable energy systems.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con63, pro82b).  % [undermining] conf=80 — Con63 questions the security of nuclear waste, attacking the premise that disposal plans are safely in hand.
att(con71b, pro82).  % [rebuttal] conf=90 — The claim of many deaths in a melt‑down directly opposes the conclusion that storage is safe.
att(con71c, pro82).  % [rebuttal] conf=85 — Even a low‑probability scenario with massive fatalities contradicts the assertion of safety.
att(con63, pro82).  % [undermining] conf=80 — The question challenges the premise that storage is secure against terrorist misuse.
att(con63, pro15).  % [undermining] conf=80 — con63 questions waste security, challenging the premise that storage is robust
att(con63, pro15b).  % [undermining] conf=80 — con63 raises terrorist misuse, undermining the claim that underground storage is safe
att(con71b, pro4).  % [undermining] conf=85 — con71b highlights high fatality risk, challenging the safety premise underlying pro4’s support
att(pro4, con71c).  % [rebuttal] conf=85 — Pro4 claims nuclear merits support while con71c implies it is too dangerous, directly contradicting the conclusion.
att(con58, pro4).  % [undermining] conf=70 — Con58 attacks the premise that nuclear should be supported by arguing subsidies could be better spent elsewhere.
att(pro82, con71b).  % [rebuttal] conf=90 — [symmetric rebuttal] The claim of many deaths in a melt‑down directly opposes the conclusion that storage is safe.
att(pro82, con71c).  % [rebuttal] conf=85 — [symmetric rebuttal] Even a low‑probability scenario with massive fatalities contradicts the assertion of safety.
att(con71c, pro4).  % [rebuttal] conf=85 — [symmetric rebuttal] Pro4 claims nuclear merits support while con71c implies it is too dangerous, directly contradicting the conclusion.