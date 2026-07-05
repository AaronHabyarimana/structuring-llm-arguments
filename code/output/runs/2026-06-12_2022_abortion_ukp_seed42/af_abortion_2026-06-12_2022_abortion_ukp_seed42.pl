% Automatisch generiert — Thema: Abortion
% arg/1 Fakten
arg(pro7).  % [pro] If the State is interested in protecting fetal life after viability, it may prohibit abortion during that period, except when it is necessary to preserve the life or health of the mother.
arg(pro63).  % [pro] Not all abortions are unjustified.
arg(pro63b).  % [pro] Abortion would be justified if the same justification could be applied to killing an adult human.
arg(pro58).  % [pro] Abortion reduces crime.
arg(pro36).  % [pro] The National Cancer Institute, the American Cancer Society, and the American College of Obstetricians and Gynecologists all refuted the claim that abortion can lead to a higher probability of developing breast cancer.
arg(pro27).  % [pro] They also ruled that the word "person" in the Constitution did not include a fetus.
arg(con140).  % [con] Susan B. Anthony and Elizabeth Cady Stanton spoke out against abortion.
arg(con23).  % [con] I will always support legislation that would end abortion or lead us in the direction of ending abortion.
arg(con9).  % [con] Abortion is not permissible from the point at which individual human identity is realized.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro63, pro7).  % [undermining] conf=70 — pro63 claims some abortions are justified, challenging pro7's premise that only health exceptions permit abortion after viability
att(pro63b, pro7).  % [undermining] conf=65 — pro63b argues abortion can be justified on broader grounds, undermining pro7's restriction to health exceptions
att(pro27, pro7).  % [undermining] conf=75 — pro27 asserts the Constitution does not define a fetus as a person, challenging the legal basis of pro7's protection claim
att(pro63, con23).  % [rebuttal] conf=90 — Claiming some abortions are justified contradicts the stance to support legislation ending all abortions, which assumes none are justified.
att(pro27, pro63b).  % [undermining] conf=80 — Stating that a fetus is not a person attacks the premise that abortion can be compared to killing an adult human.
att(con140, pro63b).  % [rebuttal] conf=75 — Citing historical figures who opposed abortion contradicts the conclusion that abortion would be justified under the same reasoning as killing an adult.
att(con23, pro63b).  % [rebuttal] conf=90 — Advocating legislation to end abortion opposes the claim that abortion could be justified by the same standards applied to killing an adult.
att(con23, pro63).  % [rebuttal] conf=90 — [symmetric rebuttal] Claiming some abortions are justified contradicts the stance to support legislation ending all abortions, which assumes none are justified.
att(pro63b, con140).  % [rebuttal] conf=75 — [symmetric rebuttal] Citing historical figures who opposed abortion contradicts the conclusion that abortion would be justified under the same reasoning as killing an adult.
att(pro63b, con23).  % [rebuttal] conf=90 — [symmetric rebuttal] Advocating legislation to end abortion opposes the claim that abortion could be justified by the same standards applied to killing an adult.