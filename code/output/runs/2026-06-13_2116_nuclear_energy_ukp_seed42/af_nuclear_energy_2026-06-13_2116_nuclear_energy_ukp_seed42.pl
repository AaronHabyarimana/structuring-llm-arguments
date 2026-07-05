% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro82).  % [pro] Storage is safe and secure
arg(pro82b).  % [pro] Plans are well in hand for eventual disposal
arg(pro15).  % [pro] Civil waste and spent fuel storage is also robust.
arg(pro15b).  % [pro] Civil waste and spent fuel storage is often below ground level.
arg(pro4).  % [pro] Since nuclear power is virtually emission-free regarding CO2, nuclear power merits at least grudging support as part of the response to increasing atmospheric CO2 levels and depletion of fossil fuels.
arg(pro95).  % [pro] Low levels of radiation comparable to those received naturally in some places are not harmful.
arg(con71).  % [con] In 2 out of 3 melt-downs there would be no deaths.
arg(con71b).  % [con] In 1 out of 5 melt-downs there would be over 1,000 deaths.
arg(con71c).  % [con] In 1 out of 100,000 melt-downs there would be 50,000 deaths.
arg(con63).  % [con] What can a terrorist do with nuclear waste that can not be used in nuclear weapons?
arg(con58).  % [con] Subsidies and investment could be spent on other solutions, such as renewable energy systems.
arg(con36).  % [con] Nuclear wastes (as, or in, spent fuel) are an unresolved problem.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con63, pro82b).  % [undermining] conf=70 — The question about terrorist use challenges the premise that disposal plans are secure and sufficient
att(con36, pro82b).  % [rebuttal] conf=90 — B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand
att(con63, pro82).  % [undermining] conf=75 — Con63 questions whether waste can be used for weapons, challenging the premise that storage is secure.
att(con36, pro82).  % [undermining] conf=85 — Con36 claims nuclear waste remains an unresolved problem, directly attacking the premise of safe, secure storage.
att(pro15, con63).  % [undermining] conf=70 — Claim that storage is robust attacks the premise that nuclear waste is vulnerable to terrorist misuse
att(con36, pro15).  % [rebuttal] conf=90 — Saying waste is an unresolved problem directly contradicts the claim that storage is robust
att(con63, pro15b).  % [undermining] conf=70 — B questions the safety of stored waste by raising terrorist misuse, challenging A's premise of safe underground storage.
att(con36, pro15b).  % [undermining] conf=80 — B claims nuclear waste remains an unresolved problem, directly challenging A's premise that storage below ground solves the issue.
att(con58, pro4).  % [rebuttal] conf=90 — con58 argues subsidies should go to renewables, directly contradicting pro4’s conclusion that nuclear power merits support.
att(con36, pro4).  % [undermining] conf=80 — con36 highlights unresolved nuclear waste, attacking the implicit premise that nuclear power is an overall viable solution.
att(pro82b, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] B states nuclear waste is an unresolved problem, directly contradicting A's claim that disposal plans are well in hand
att(pro15, con36).  % [rebuttal] conf=90 — [symmetric rebuttal] Saying waste is an unresolved problem directly contradicts the claim that storage is robust
att(pro4, con58).  % [rebuttal] conf=90 — [symmetric rebuttal] con58 argues subsidies should go to renewables, directly contradicting pro4’s conclusion that nuclear power merits support.