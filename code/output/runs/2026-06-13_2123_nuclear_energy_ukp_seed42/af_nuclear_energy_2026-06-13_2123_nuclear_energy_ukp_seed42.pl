% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level
arg(pro4).  % [pro] They have to varying degrees either changed their public stance , or conceded that since nuclear power is virtually emission-free regarding CO2 , it merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels .
arg(con71).  % [con] In 2 out of 3 nuclear meltdowns there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 nuclear meltdowns there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 nuclear meltdowns there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that cannot be used in nuclear weapons?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions, such as renewable energy systems.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con63, pro82b).  % [undermining] conf=75 — The question about terrorist use of nuclear waste challenges the premise that disposal plans are secure and well‑handled.
att(con63, pro82).  % [undermining] conf=75 — The question raises a security concern that challenges the premise that storage is secure.
att(con63, pro15).  % [undermining] conf=85 — The terrorist‑use question challenges the premise that waste storage is robust by implying vulnerability.
att(con63, pro15b).  % [undermining] conf=80 — The terrorist‑use question suggests underground storage may not be secure, undermining the claim of safety.
att(con71b, pro4).  % [undermining] conf=80 — The high‑death meltdown statistic attacks the premise that nuclear power’s safety justifies its CO₂‑free support.
att(con71c, pro4).  % [rebuttal] conf=85 — con71c claims massive deaths from meltdowns, directly contradicting pro4’s claim that nuclear power deserves support
att(con63, pro4).  % [undermining] conf=70 — con63 questions nuclear waste security, attacking the safety premise underlying pro4’s support
att(con58, pro4).  % [undermining] conf=80 — con58 argues that funds could be better used elsewhere, challenging the premise that nuclear is the preferred solution
att(pro4, con71c).  % [rebuttal] conf=85 — [symmetric rebuttal] con71c claims massive deaths from meltdowns, directly contradicting pro4’s claim that nuclear power deserves support