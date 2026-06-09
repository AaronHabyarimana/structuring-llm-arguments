% Automatisch generiert — Thema: Cloning
% arg/1 Fakten
arg(pro9).  % [pro] The process of transplanting human organs can become simpler.
arg(pro9b).  % [pro] The process of transplanting human organs can have an immensely improved success rate.
arg(pro124).  % [pro] Parents that have lost a child can have that child returned to them with a clone.
arg(pro4).  % [pro] Mankind is already playing God when we cure diseases, fly airplanes, create nuclear energy, or use any advanced technology.
arg(pro53).  % [pro] Having access to a tremendous amount of information about a clone's parent could greatly help in understanding the clone's psyche and physical attributes.
arg(pro119).  % [pro] Using embryos in stem cell research can possibly save human lives.
arg(pro126).  % [pro] Cloning humans has the possibility of becoming safer than naturally developing embryos by replacing randomized risks and genetic defects.
arg(con72).  % [con] Cloned children would unavoidably be raised in the shadow of their nuclear donor.
arg(con72b).  % [con] Being raised in the shadow of their nuclear donor would strongly tend to constrain the individual psychological and social development of cloned children.
arg(con42).  % [con] Adopting an orphan is much easier than trying to clone a human being.
arg(con42b).  % [con] Adopting an orphan is much cheaper than trying to clone a human being.
arg(con42c).  % [con] Adopting an orphan is a virtuous solution compared to trying to clone a human being.
arg(con42d).  % [con] Adopting an orphan is a safer solution than trying to clone a human being.
arg(con9).  % [con] Ian Wilmut, the creator of Dolly, has denounced human reproductive cloning as too dangerous to attempt.
arg(con134).  % [con] If genes are modified to create beings who are smarter than others, the average person will not have a place in society.
arg(con126).  % [con] Large scale research cloning could generate a market for women's eggs.
arg(con126b).  % [con] The market for women's eggs could easily lead to exploitation.
arg(con84).  % [con] Cloning is considered unsafe because 95% of animal cloning ends in failure due to genetic defects.
arg(con20).  % [con] This race could easily fall into slavery.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con84, pro9).  % [undermining] conf=90 — Con84 claims cloning is unsafe, undermining the premise that cloning can reliably simplify organ transplantation.
att(con72, pro124).  % [undermining] conf=70 — The con argument challenges the premise that cloning is beneficial for parents by highlighting negative psychological effects on the cloned child.
att(con72b, pro124).  % [undermining] conf=75 — It attacks the same underlying premise as con72, arguing that the child's development would be constrained, undermining the pro claim.
att(con42, pro124).  % [undermining] conf=90 — Con42 challenges the feasibility premise of cloning by claiming adoption is much easier.
att(con42b, pro124).  % [undermining] conf=90 — Con42b attacks the cost premise of cloning, asserting adoption is much cheaper.
att(con42c, pro124).  % [undermining] conf=88 — Con42c questions the moral virtue of cloning, undermining the ethical premise of the pro argument.
att(con42d, pro124).  % [undermining] conf=88 — Con42d attacks the safety premise of cloning by claiming adoption is safer.
att(con9, pro124).  % [undermining] conf=92 — Con9 cites an expert denouncing human cloning as dangerous, undermining the safety premise of the pro claim.
att(con134, pro124).  % [undermining] conf=85 — Con134 raises social‑justice concerns about engineered superiority, undermining the acceptability premise of cloning.
att(con126, pro124).  % [undermining] conf=87 — Con126 points to a market for women’s eggs, attacking the ethical premise of large‑scale cloning.
att(con126b, pro124).  % [undermining] conf=87 — Con126b highlights exploitation risks from the egg market, undermining the ethical premise of the pro argument.
att(con84, pro124).  % [undermining] conf=93 — Con84 cites high failure rates in animal cloning, directly undermining the safety premise of human cloning.
att(con20, pro124).  % [undermining] conf=84 — Con20 warns of a potential slave class, attacking the societal‑acceptability premise of cloning.
att(pro4, con42c).  % [undermining] conf=75 — Pro4 challenges the moral premise that adoption is virtuous by asserting that humanity already ‘plays God’ with other technologies.
att(con134, pro4).  % [undermining] conf=70 — B challenges the premise that playing God is harmless by highlighting harmful social consequences.
att(con126, pro4).  % [undermining] conf=75 — B introduces a new ethical problem (egg market) that weakens A's claim that advanced technology is already acceptable.
att(con126b, pro4).  % [undermining] conf=80 — B points out exploitation risk, directly attacking the assumption that further technological advances are unproblematic.
att(con84, pro4).  % [undermining] conf=85 — B provides safety data that undercuts A's implication that cloning is comparable to other accepted technologies.
att(con20, pro4).  % [undermining] conf=75 — B raises a severe societal risk, challenging the premise that playing God is ethically neutral.
att(con72, pro53).  % [undermining] conf=80 — B challenges the benefit of parental information by highlighting a negative upbringing condition.
att(con72b, pro53).  % [undermining] conf=85 — B expands on the psychological harm, directly attacking the premise that parental data is advantageous.
att(con42, pro53).  % [undermining] conf=78 — B questions the practicality of cloning, weakening A's implied justification for cloning.
att(con9, pro53).  % [undermining] conf=75 — The statement that cloning is too dangerous undermines the premise that cloning can be performed to obtain parental information.
att(con84, pro53).  % [undermining] conf=80 — High failure rates in animal cloning challenge the feasibility premise underlying the benefit of accessing parental information.
att(con72, pro119).  % [undercutting] conf=90 — B shows that even if embryos could save lives, the inevitable psychological harm to cloned children prevents the conclusion from being desirable.
att(con72b, pro119).  % [undercutting] conf=90 — B argues that the likely psychological and social constraints on cloned children undermine the desirability of using embryos, regardless of potential medical benefits.
att(con42, pro119).  % [undercutting] conf=88 — B claims a simpler alternative (adoption) exists, so the conclusion that we should use embryos does not follow even if they could save lives.
att(con42b, pro119).  % [undercutting] conf=88 — B points out that adoption is cheaper, undercutting the argument that using embryos is the preferred solution despite possible health benefits.
att(con42c, pro119).  % [undercutting] conf=88 — B frames adoption as a virtuous option, challenging the moral justification of using embryos even if they might save lives.
att(con42d, pro119).  % [undercutting] conf=88 — B argues adoption is safer, showing the conclusion to use embryos does not necessarily follow from the premise of potential medical benefit.
att(con9, pro119).  % [undercutting] conf=85 — B cites an expert denouncing human reproductive cloning as dangerous, undercutting the claim that embryo use is a worthwhile path even if it could save lives.
att(con134, pro119).  % [undercutting] conf=80 — B suggests that gene-modified clones could create social inequality, showing the conclusion to pursue embryo research may not follow from its medical promise.
att(con126, pro119).  % [undermining] conf=85 — B attacks the premise that embryo research is ethically acceptable by highlighting a market for women's eggs that could arise.
att(con126b, pro119).  % [undermining] conf=85 — B undermines the ethical premise of A by arguing that the egg market would lead to exploitation of women.
att(con9, pro126).  % [rebuttal] conf=90 — B claims human reproductive cloning is too dangerous, directly contradicting A's claim that cloning could be safer than natural embryos.
att(con84, pro126).  % [rebuttal] conf=95 — The high failure rate in animal cloning directly contradicts the claim that human cloning could be safer.
att(con9, con72).  % [undermining] conf=70 — Wilmut’s statement that cloning is too dangerous undermines the premise that cloning is feasible for creating children.
att(con84, con20).  % [undermining] conf=70 — A challenges the feasibility of cloning by citing high failure rates, thereby weakening B's premise that a cloned race could exist to be enslaved.