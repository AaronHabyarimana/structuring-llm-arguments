% Automatisch generiert — Thema: Abortion
% arg/1 Fakten
arg(pro5).  % [pro] Even in the case of nonfatal conditions, such as Down syndrome, parents may be unable to care for a severely disabled child.
arg(pro62).  % [pro] The abortion rate is similar in countries where it is illegal and where it is widely available, legal and safe.
arg(pro2).  % [pro] The fetus is not a person.
arg(pro2b).  % [pro] Abortion is morally permissible.
arg(pro27).  % [pro] The cortex does not become functional until at least the 26th week of a fetus' development, long after most abortions are performed.
arg(pro60).  % [pro] Abortion is a safe medical procedure.
arg(con72).  % [con] Abortion will burden the woman's conscience in life and burden her soul in death.
arg(con72b).  % [con] The person who drove the woman to desperation that led her to the crime is thrice guilty.
arg(con42).  % [con] A destructive activity not being completely eradicated is no reason to make or keep it legal.
arg(con9).  % [con] Hundreds of women have died from abortion since Roe v. Wade, according to the Centers for Disease Control and Prevention.
arg(con9b).  % [con] The number of women who have died from abortion is likely only a fraction of the actual number because several states, including California, have failed to report abortion data for many years.
arg(con9c).  % [con] The number of women who have died from abortion is likely only a fraction of the actual number because doctors have latitude in reporting causes of death, such as listing "hemorrhage" instead of "induced abortion".
arg(con134).  % [con] It would be permissible to unplug and thereby cause the death of a person who is using another person's kidneys.
arg(con134b).  % [con] It is permissible to abort the fetus because the fetus has no right to use a person's body's life-support functions against that person's will.
arg(con20).  % [con] Giving a quick recitation of the child's development will weaken the "not a person yet" mentality.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con72, pro5).  % [rebuttal] conf=85 — The claim that abortion burdens a woman's conscience directly opposes the implication that abortion is an acceptable solution for caring difficulties.
att(con42, pro62).  % [rebuttal] conf=80 — B argues that the persistence of abortion does not justify its legality, directly contradicting A's implication that legality is acceptable because rates are unchanged
att(con9, pro62).  % [undermining] conf=70 — B challenges the safety premise implied by A by presenting CDC data on abortion-related deaths
att(con20, pro2).  % [rebuttal] conf=90 — B argues that presenting fetal development weakens the view that the fetus is not a person, directly contradicting A's conclusion.
att(con72, pro2b).  % [rebuttal] conf=90 — B claims abortion burdens conscience and soul, directly contradicting A's claim that abortion is morally permissible.
att(con42, pro2b).  % [rebuttal] conf=85 — B argues that a destructive activity should not be legal, directly opposing A's assertion that abortion is permissible.
att(con9, pro2b).  % [rebuttal] conf=80 — B presents data on women’s deaths from abortion, contesting A's moral permissibility stance.
att(con9b, pro2b).  % [rebuttal] conf=75 — B asserts that reported death figures are underestimates, strengthening the claim that abortion is harmful and thus opposing A.
att(con9c, pro2b).  % [rebuttal] conf=75 — B argues that death counts are likely higher due to reporting practices, further challenging A's permissibility claim.
att(con134, pro2b).  % [undercutting] conf=85 — B uses a thought experiment to show that accepting abortion’s permissibility leads to an implausible conclusion, undermining A's argument.
att(con20, pro2b).  % [undermining] conf=80 — B suggests that highlighting fetal development weakens the premise that the fetus is not a person, which A relies on.
att(con20, pro27).  % [undermining] conf=70 — Con20 challenges the premise that lack of cortical function means the fetus is not a person, thereby undermining pro27's basis.
att(con9, pro60).  % [rebuttal] conf=90 — The claim that hundreds of women have died directly contradicts the assertion that abortion is safe.
att(con9b, pro60).  % [undermining] conf=85 — It challenges the premise of safety by suggesting official death counts are underreported.
att(con9c, pro60).  % [undermining] conf=85 — It attacks the safety premise by arguing deaths are hidden through ambiguous cause-of-death reporting.
att(con134b, con72).  % [rebuttal] conf=90 — con134b asserts that abortion is permissible, directly contradicting con72's claim that abortion burdens a woman's conscience and soul.