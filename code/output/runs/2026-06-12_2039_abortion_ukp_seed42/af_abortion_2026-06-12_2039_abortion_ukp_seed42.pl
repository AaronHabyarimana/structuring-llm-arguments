% Automatisch generiert — Thema: Abortion
% arg/1 Fakten
arg(pro7).  % [pro] If the State is interested in protecting fetal life after viability, the State may go so far as to prescribe abortion during that period, except when preserving the life or health of the mother is necessary.
arg(pro63).  % [pro] Not all abortions are unjustified.
arg(pro63b).  % [pro] Abortion would be justified if the same justification could be applied to killing an adult human.
arg(pro58).  % [pro] Abortion reduces crime.
arg(pro36).  % [pro] The National Cancer Institute, the American Cancer Society, and the American College of Obstetricians and Gynecologists refute the claim that abortion increases the probability of developing breast cancer.
arg(pro27).  % [pro] They also ruled that the word "person" in the Constitution did not include a fetus.
arg(pro109).  % [pro] Teenagers who become mothers have grim prospects for the future.
arg(pro9).  % [pro] Planned children often have better life prospects because caregivers are better prepared to support the child physically, emotionally, and financially.
arg(con56).  % [con] It is immoral to kill an unborn child for convenience.
arg(con60).  % [con] Technology has clearly helped define how people think about a fetus as a full, breathing human being.
arg(con130).  % [con] If women are unprepared to care for their children, women should at least put their children up for adoption.
arg(con155a).  % [con] When an abortion is performed on a 12-week-old fetus, the child's mouth is open in a silent scream as seen in an ultrasound image.
arg(con155b).  % [con] The silent scream observed in the ultrasound image is the silent scream of a child threatened imminently with extinction.
arg(con7).  % [con] Killing an adult human being is wrong because killing an adult human being deprives the victim of a future like ours—a future containing highly valuable or desirable experiences, activities, projects, and enjoyments.
arg(con144).  % [con] Unplugging and thereby causing the death of a person who is using one's kidneys would be permissible.
arg(con144b).  % [con] Aborting the fetus is permissible because the fetus similarly has no right to use one's body's life-support functions against one's will.
arg(con140).  % [con] Susan B. Anthony and Elizabeth Cady Stanton spoke out against abortion.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro36, pro7).  % [undermining] conf=70 — B refutes a health‑risk premise that could justify A’s exception for the mother’s health.
att(pro27, pro7).  % [undermining] conf=75 — B’s legal finding that a fetus is not a constitutional person attacks A’s underlying premise of fetal protection.
att(con56, pro7).  % [undermining] conf=80 — B attacks the moral premise that abortion can be allowed for convenience, which A’s policy implicitly permits.
att(con140, pro63).  % [rebuttal] conf=70 — Con140 cites historical anti‑abortion statements, implying abortion is unjustified, which directly contradicts pro63's claim that not all abortions are unjustified.
att(pro63b, con56).  % [rebuttal] conf=90 — A concludes abortion is justified, while B claims it is immoral, making their conclusions mutually exclusive.
att(con155a, pro63b).  % [undermining] conf=75 — B attacks the premise that abortion can be likened to killing an adult by emphasizing fetal sentience.
att(con155b, pro63b).  % [undermining] conf=75 — B challenges the moral equivalence premise by portraying the fetus as a threatened child.
att(con7, pro63b).  % [undermining] conf=80 — B claims killing an adult is wrong, challenging the premise that the same justification could apply to adult killing.
att(con56, pro58).  % [undermining] conf=70 — B attacks the moral premise that abortion is permissible, undermining A's justification.
att(con130, pro58).  % [undermining] conf=70 — B suggests adoption as an alternative, challenging the premise that abortion is needed to prevent crime.
att(pro27, con56).  % [rebuttal] conf=90 — Pro27 claims a fetus is not a constitutional person, while con56 says killing an unborn child is immoral, making their conclusions mutually exclusive.
att(pro27, con60).  % [rebuttal] conf=85 — Pro27 denies personhood for a fetus, whereas con60 argues technology defines the fetus as a full human being, directly opposing the status claim.
att(con155a, pro27).  % [undermining] conf=70 — Con155a presents evidence of fetal sentience that challenges the premise that a fetus is not a person.
att(con155b, pro27).  % [undermining] conf=70 — Con155b’s claim of a fetal “silent scream” attacks the premise that a fetus lacks moral status.
att(pro27, con140).  % [rebuttal] conf=80 — Pro27 denies fetal personhood, while con140 cites historical anti‑abortion statements, implying the opposite moral status.
att(con144, con56).  % [undermining] conf=70 — B claims killing a dependent person is permissible, challenging the premise that killing an unborn child (a dependent) is immoral.
att(con144b, con56).  % [undermining] conf=85 — B argues the fetus has no right to use the mother's body, directly attacking the moral premise of A.
att(con155a, con144b).  % [undermining] conf=80 — A's depiction of fetal suffering undermines B's premise that the fetus lacks a right to use the mother's body.
att(con155b, con144b).  % [undermining] conf=80 — A's claim of a suffering child attacks B's premise that the fetus has no right to use the mother's body.
att(con7, con144).  % [rebuttal] conf=90 — A says killing a person is wrong while B says killing a kidney‑using person is permissible, directly contradicting each other.
att(pro63, con140).  % [rebuttal] conf=70 — [symmetric rebuttal] Con140 cites historical anti‑abortion statements, implying abortion is unjustified, which directly contradicts pro63's claim that not all abortions are unjustified.
att(con56, pro63b).  % [rebuttal] conf=90 — [symmetric rebuttal] A concludes abortion is justified, while B claims it is immoral, making their conclusions mutually exclusive.
att(con56, pro27).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro27 claims a fetus is not a constitutional person, while con56 says killing an unborn child is immoral, making their conclusions mutually exclusive.
att(con60, pro27).  % [rebuttal] conf=85 — [symmetric rebuttal] Pro27 denies personhood for a fetus, whereas con60 argues technology defines the fetus as a full human being, directly opposing the status claim.
att(con140, pro27).  % [rebuttal] conf=80 — [symmetric rebuttal] Pro27 denies fetal personhood, while con140 cites historical anti‑abortion statements, implying the opposite moral status.
att(con144, con7).  % [rebuttal] conf=90 — [symmetric rebuttal] A says killing a person is wrong while B says killing a kidney‑using person is permissible, directly contradicting each other.