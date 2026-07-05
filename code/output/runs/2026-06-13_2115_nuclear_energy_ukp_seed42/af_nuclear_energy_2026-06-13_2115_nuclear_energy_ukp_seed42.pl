% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is robust
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level
arg(pro4).  % [pro] Since nuclear power is virtually emission-free regarding CO2, nuclear power merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(con71).  % [con] In 2 out of 3 nuclear meltdowns there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 nuclear meltdowns there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 nuclear meltdowns there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that can not be used in nuclear weapons ?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions, such as renewable energy systems.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con71b, pro82).  % [undermining] conf=60 — Con71b suggests high death tolls in meltdowns, challenging the premise that storage is safe.
att(con63, pro82).  % [undermining] conf=70 — Con63 raises terrorist misuse of waste, questioning the security aspect of storage.
att(con36, pro82).  % [rebuttal] conf=90 — Con36 claims nuclear waste remains an unresolved problem, directly contradicting the conclusion that storage is safe and secure.
att(con63, pro82b).  % [undermining] conf=65 — The question implies waste could be weaponized, challenging the premise that disposal plans are sufficient
att(con36, pro82b).  % [rebuttal] conf=90 — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand
att(pro15, con63).  % [undermining] conf=70 — Pro15’s claim of robust storage challenges the premise that nuclear waste is easily exploitable by terrorists
att(pro15, con36).  % [rebuttal] conf=90 — Pro15 says waste storage is robust, directly contradicting con36’s claim that waste remains an unresolved problem
att(con63, pro15b).  % [undermining] conf=70 — The question about terrorist use challenges the premise that underground storage ensures safety.
att(con58, pro4).  % [undermining] conf=80 — Con58 challenges the premise that nuclear power deserves support by arguing funds could go to renewables
att(con36, pro4).  % [undermining] conf=85 — Con36 attacks the premise that nuclear power is a viable solution by highlighting unresolved waste issues
att(pro82, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] Con36 claims nuclear waste remains an unresolved problem, directly contradicting the conclusion that storage is safe and secure.
att(pro82b, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand
att(con36, pro15).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro15 says waste storage is robust, directly contradicting con36’s claim that waste remains an unresolved problem