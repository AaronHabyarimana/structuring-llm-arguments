% Automatisch generiert — Thema: Abortion
% arg/1 Fakten
arg(pro9).  % [pro] Planned children often have better life prospects because caregivers are better prepared to support the child physically, emotionally, and financially.
arg(pro110).  % [pro] The fetus is not a person with a right to life.
arg(pro124).  % [pro] The anti-abortion bill that would ban all abortions nationwide after 20 weeks of pregnancy would increase the federal deficit by $225 million over nine years due to the increased need for Medicaid coverage.
arg(pro4).  % [pro] Roe-era feminists like Kate Michelman, the former president of NARAL Pro-Choice America, proclaimed abortion to be the guarantor of a woman's right to participate fully in the social and political life of society.
arg(pro53).  % [pro] Abortion is justified as a means of population control.
arg(pro119).  % [pro] Many people have found hope and healing after abortion through programs like Project Rachel, which was established by the Catholic Church to serve all people regardless of religious affiliation.
arg(con72).  % [con] The government has a duty to protect this life.
arg(con42).  % [con] Many have lifelong regrets afterwards.
arg(con9).  % [con] Abortion is not permissible from the point at which individual human identity is realized.
arg(con134).  % [con] Individual identity is obtained at the fourteenth day of pregnancy
arg(con134b).  % [con] Abortion is not permissible after two weeks of pregnancy
arg(con126).  % [con] The fetus is the woman's child rather than a mere stranger.
arg(con126b).  % [con] Abortion kills the fetus rather than merely letting the fetus die.
arg(con126c).  % [con] In pregnancies arising from voluntary intercourse, the woman has either tacitly consented to the fetus using the woman's body, or has a duty to allow the fetus to use the woman's body since the woman herself is responsible for the fetus's need to use the woman's body.
arg(con84).  % [con] Abortion can result in medical complications later in life.
arg(con84b).  % [con] Abortion doubles the risk of ectopic pregnancies.
arg(con84c).  % [con] Abortion increases the chance of miscarriage.
arg(con84d).  % [con] Abortion increases the chance of pelvic inflammatory disease.
arg(con20).  % [con] If it is not known for certain whether a fetus has a right to life, then treating the fetus as if it lacks a right to life (for example by killing it) is reckless and morally wrong.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con20, pro110).  % [rebuttal] conf=95 — B asserts it is reckless and morally wrong to treat the fetus as lacking a right to life, directly contradicting A's claim that the fetus has no right to life.
att(pro110, con72).  % [rebuttal] conf=95 — Pro110 denies any right to life, while con72 asserts a governmental duty to protect that life, making their conclusions mutually exclusive.
att(pro110, con9).  % [rebuttal] conf=85 — Con9 presumes a point where human identity begins, implying a right to life, which conflicts with pro110's claim that the fetus never has such a right.
att(pro110, con134).  % [rebuttal] conf=90 — Con134 states identity begins at day 14, contradicting pro110's assertion that the fetus is never a person with a right to life.
att(pro110, con134b).  % [rebuttal] conf=85 — Con134b claims abortion becomes impermissible after two weeks, implying personhood, opposing pro110's denial of any fetal rights.
att(pro4, con72).  % [rebuttal] conf=90 — A's claim that abortion guarantees women's rights conflicts with B's claim that the government must protect fetal life, making the conclusions mutually exclusive.
att(con42, pro4).  % [undermining] conf=70 — B challenges the premise that abortion is wholly beneficial by asserting many experience lifelong regret.
att(con9, pro4).  % [rebuttal] conf=85 — B concludes abortion is impermissible once human identity is realized, directly contradicting A's pro‑abortion stance.
att(con134b, pro4).  % [rebuttal] conf=80 — B asserts abortion is impermissible after two weeks, which conflicts with A's claim that abortion secures women's rights.
att(con126, pro4).  % [undermining] conf=65 — B's premise that the fetus is the woman's child challenges A's framing of abortion solely as a political right.
att(con126b, pro4).  % [undermining] conf=70 — B emphasizes the killing aspect of abortion, undermining A's premise that abortion is a neutral means to achieve women's participation.
att(pro4, con126c).  % [rebuttal] conf=90 — A claims abortion secures women's rights while B claims women have a duty to let the fetus use their bodies, making the conclusions mutually exclusive
att(con84, pro4).  % [undercutting] conf=70 — B argues abortion can cause later medical complications, challenging the claim that abortion guarantees full social and political participation
att(con84b, pro4).  % [undercutting] conf=70 — B asserts abortion doubles ectopic pregnancy risk, undermining the idea that abortion ensures women's ability to participate fully
att(con84c, pro4).  % [undercutting] conf=70 — B states abortion raises miscarriage risk, which weakens the claim that abortion guarantees women's full societal involvement
att(con84d, pro4).  % [undercutting] conf=70 — B claims abortion increases pelvic inflammatory disease risk, challenging the notion that abortion secures women's full participation
att(pro4, con20).  % [rebuttal] conf=85 — A asserts abortion is a guarantor of rights, whereas B says aborting a fetus of uncertain rights is reckless, making the conclusions incompatible
att(pro53, con72).  % [rebuttal] conf=90 — A justifies abortion for population control while B claims the government must protect fetal life, directly opposing each other's conclusions
att(con42, pro53).  % [undercutting] conf=65 — B points to lifelong regret after abortion, challenging the claim that abortion is a justified population‑control measure
att(pro53, con9).  % [rebuttal] conf=85 — A argues abortion is permissible for population control, whereas B holds abortion is impermissible once human identity begins, making the conclusions mutually exclusive
att(con134, pro53).  % [undermining] conf=80 — Con asserts that individual identity begins at day 14, challenging the premise that the fetus lacks personhood which the pro argument relies on.
att(pro53, con134b).  % [rebuttal] conf=90 — Pro’s claim that abortion is justified conflicts with con’s claim that abortion is impermissible after two weeks, making the conclusions mutually exclusive.
att(con126, pro53).  % [undermining] conf=85 — Con labels the fetus as the woman's child, attacking the premise that the fetus is not a person used by the pro argument.
att(con126b, pro53).  % [undermining] conf=80 — Con argues abortion actively kills the fetus, undermining any premise that abortion is merely allowing death.
att(con126c, pro53).  % [undermining] conf=75 — Con claims the woman has consented or a duty to the fetus, attacking the premise that she can freely use abortion for population control.
att(con84, pro53).  % [undercutting] conf=70 — Con points to long‑term health complications, showing that even if abortion reduces population, the conclusion of justification may not follow.
att(con84b, pro53).  % [undercutting] conf=70 — Con’s claim of doubled ectopic‑pregnancy risk challenges the inference that abortion is a sound population‑control measure.
att(con84c, pro53).  % [undercutting] conf=70 — Con argues increased miscarriage risk, undermining the link between abortion and justified population control.
att(con84d, pro53).  % [undercutting] conf=70 — Con’s claim of higher pelvic inflammatory disease risk questions whether abortion remains a justified means of population control.
att(con20, pro53).  % [undermining] conf=85 — Con invokes moral precaution against uncertain fetal rights, attacking the premise that abortion can be justified without such certainty.
att(pro119, con134).  % [rebuttal] conf=85 — A claims abortion can bring hope and healing, while B’s claim that individual identity begins at day 14 implies abortion after that point is morally wrong, making their conclusions incompatible.
att(pro119, con134b).  % [undermining] conf=80 — A provides evidence of positive post‑abortion outcomes, challenging B's premise that abortion (after two weeks) is impermissible.
att(pro119, con126).  % [rebuttal] conf=90 — A claims abortion can provide hope and healing, while B claims abortion is wrong because the fetus is the woman's child, making their conclusions mutually exclusive.
att(pro119, con126c).  % [rebuttal] conf=90 — A claims abortion can bring hope and healing, while B claims a woman has a duty to let the fetus use her body, implying abortion is impermissible; the conclusions are mutually exclusive.
att(con134, con20).  % [undermining] conf=70 — Con134 asserts certainty about fetal identity, undermining con20's premise of uncertainty
att(pro110, con20).  % [rebuttal] conf=95 — [symmetric rebuttal] B asserts it is reckless and morally wrong to treat the fetus as lacking a right to life, directly contradicting A's claim that the fetus has no right to life.
att(con72, pro110).  % [rebuttal] conf=95 — [symmetric rebuttal] Pro110 denies any right to life, while con72 asserts a governmental duty to protect that life, making their conclusions mutually exclusive.
att(con9, pro110).  % [rebuttal] conf=85 — [symmetric rebuttal] Con9 presumes a point where human identity begins, implying a right to life, which conflicts with pro110's claim that the fetus never has such a right.
att(con134, pro110).  % [rebuttal] conf=90 — [symmetric rebuttal] Con134 states identity begins at day 14, contradicting pro110's assertion that the fetus is never a person with a right to life.
att(con134b, pro110).  % [rebuttal] conf=85 — [symmetric rebuttal] Con134b claims abortion becomes impermissible after two weeks, implying personhood, opposing pro110's denial of any fetal rights.
att(con72, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A's claim that abortion guarantees women's rights conflicts with B's claim that the government must protect fetal life, making the conclusions mutually exclusive.
att(pro4, con9).  % [rebuttal] conf=85 — [symmetric rebuttal] B concludes abortion is impermissible once human identity is realized, directly contradicting A's pro‑abortion stance.
att(pro4, con134b).  % [rebuttal] conf=80 — [symmetric rebuttal] B asserts abortion is impermissible after two weeks, which conflicts with A's claim that abortion secures women's rights.
att(con126c, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims abortion secures women's rights while B claims women have a duty to let the fetus use their bodies, making the conclusions mutually exclusive
att(con20, pro4).  % [rebuttal] conf=85 — [symmetric rebuttal] A asserts abortion is a guarantor of rights, whereas B says aborting a fetus of uncertain rights is reckless, making the conclusions incompatible
att(con72, pro53).  % [rebuttal] conf=90 — [symmetric rebuttal] A justifies abortion for population control while B claims the government must protect fetal life, directly opposing each other's conclusions
att(con9, pro53).  % [rebuttal] conf=85 — [symmetric rebuttal] A argues abortion is permissible for population control, whereas B holds abortion is impermissible once human identity begins, making the conclusions mutually exclusive
att(con134b, pro53).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro’s claim that abortion is justified conflicts with con’s claim that abortion is impermissible after two weeks, making the conclusions mutually exclusive.
att(con134, pro119).  % [rebuttal] conf=85 — [symmetric rebuttal] A claims abortion can bring hope and healing, while B’s claim that individual identity begins at day 14 implies abortion after that point is morally wrong, making their conclusions incompatible.
att(con126, pro119).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims abortion can provide hope and healing, while B claims abortion is wrong because the fetus is the woman's child, making their conclusions mutually exclusive.
att(con126c, pro119).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims abortion can bring hope and healing, while B claims a woman has a duty to let the fetus use her body, implying abortion is impermissible; the conclusions are mutually exclusive.