% Automatisch generiert — Thema: Abortion
% arg/1 Fakten
arg(pro55).  % [pro] The same study also found that 95 % of women who received abortions felt it was the right decision a week after the procedure.
arg(pro2b).  % [pro] The fetus is not a person.
arg(pro2c).  % [pro] Abortion is morally permissible.
arg(pro27).  % [pro] The cortex does not become functional until at least the 26th week of a fetus' development, long after most abortions are performed.
arg(pro60).  % [pro] Abortion is a safe medical procedure.
arg(con72).  % [con] Abortion will burden the woman's conscience in life and will burden the woman's soul in death.
arg(con72b).  % [con] The person who drove the woman to the desperation that impelled her to have an abortion is also thrice guilty.
arg(con42).  % [con] The fact that a destructive activity will not be completely eradicated is no reason to make or keep that activity legal.
arg(con9).  % [con] Hundreds of women have died from abortion in the United States since Roe v. Wade, according to the Centers for Disease Control and Prevention.
arg(con9b).  % [con] The actual number of women who have died from abortion is likely higher than reported because several states, including California, have failed to report abortion data for many years.
arg(con9c).  % [con] The number of abortion-related deaths is likely undercounted because doctors have latitude in reporting causes of death, such as listing "hemorrhage" instead of "induced abortion".
arg(con134).  % [con] Unplugging a life‑support device that is using a person's kidneys, thereby causing that person's death, would be permissible.
arg(con134b).  % [con] Aborting a fetus is permissible because the fetus has no right to use a woman's body’s life‑support functions against her will.
arg(con20).  % [con] Giving a quick recitation of the child's development will weaken the "not a person yet" mentality.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con72, pro2b).  % [rebuttal] conf=70 — B claims abortion burdens conscience, contradicting A's implication that abortion is permissible.
att(con9b, pro2b).  % [rebuttal] conf=70 — B asserts that abortion deaths are underreported, strengthening the rebuttal against A's permissive claim.
att(pro55, con72).  % [rebuttal] conf=90 — A's finding that 95 % felt it was the right decision directly contradicts B's claim that abortion burdens the woman's conscience and soul.
att(con9b, pro2c).  % [undermining] conf=80 — con9b challenges the safety premise that underlies the moral permissibility claim of pro2c
att(con9c, pro2c).  % [undermining] conf=80 — con9c disputes the premise that abortion poses minimal risk to women, which pro2c may rely on
att(con134, pro2c).  % [undercutting] conf=70 — con134 shows that the moral reasoning supporting abortion would also justify a widely rejected act, so the conclusion doesn’t follow
att(con20, pro2c).  % [undermining] conf=75 — con20 attacks the premise that the fetus lacks personhood by urging a stronger perception of its development
att(con72, pro27).  % [undermining] conf=80 — con72 attacks the premise that abortion has no moral cost to the woman, undermining pro27’s permissibility claim
att(con42, pro27).  % [rebuttal] conf=70 — con42 directly contradicts the conclusion that abortion should be legal despite incomplete eradication of a harmful activity
att(con9, pro27).  % [undermining] conf=85 — con9 challenges the safety premise that underlies pro27’s claim about permissibility
att(con20, pro2b).  % [rebuttal] conf=90 — The con argument asserts that reciting development will weaken the 'not a person yet' view, directly contradicting the pro claim that the fetus is not a person.
att(con72, pro2c).  % [rebuttal] conf=90 — The con argument claims abortion burdens conscience and soul, directly opposing the pro claim that abortion is morally permissible.
att(con134b, pro27).  % [rebuttal] conf=90 — B directly contradicts A's conclusion by asserting abortion is permissible regardless of fetal personhood.
att(con20, pro27).  % [rebuttal] conf=80 — B challenges A's 'not a person yet' claim by arguing that developmental information weakens that view.
att(con72, pro60).  % [rebuttal] conf=75 — B argues that abortion imposes moral/spiritual burdens, contradicting A's claim of overall safety.
att(con42, pro60).  % [rebuttal] conf=75 — B disputes the implication that safety alone justifies legality, opposing A's safety‑based endorsement.
att(con9, pro60).  % [rebuttal] conf=95 — B provides mortality data that directly contradicts A's assertion that abortion is safe.
att(con9b, pro60).  % [rebuttal] conf=90 — B claims underreported deaths, undermining A's safety conclusion with evidence of higher risk.
att(con9c, pro60).  % [undermining] conf=90 — con9c challenges the premise that abortion is safe by claiming death counts are underreported
att(con42, con134b).  % [rebuttal] conf=80 — con42 claims the activity should not be legal, contradicting con134b's permissibility conclusion
att(con134b, con72b).  % [rebuttal] conf=75 — Con134b asserts abortion is permissible, directly contradicting con72b’s implicit anti‑abortion stance that those causing desperation are morally culpable.