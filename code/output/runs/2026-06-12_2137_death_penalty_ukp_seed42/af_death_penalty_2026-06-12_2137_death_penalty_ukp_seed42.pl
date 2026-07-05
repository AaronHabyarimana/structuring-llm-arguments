% Automatisch generiert — Thema: Death Penalty
% arg/1 Fakten
arg(pro82).  % [pro] Sometimes defendants insist on execution.
arg(pro15).  % [pro] Deserved punishment protects society morally by restoring a just order.
arg(pro15b).  % [pro] Deserved punishment makes the wrongdoer pay a price equivalent to the harm the wrongdoer has done.
arg(pro4).  % [pro] The framers of the Constitution clearly believed that capital punishment was an acceptable means of protecting society from wicked, dissolute men.
arg(pro4b).  % [pro] Thomas Jefferson liked to talk about capital punishment.
arg(pro95).  % [pro] It has been proven that these killers kill again and again.
arg(pro36).  % [pro] If the criminal knows that the justice system will not stop at putting the criminal to death, then the system appears more draconian to the criminal.
arg(pro32).  % [pro] Retribution, or "an eye for an eye", honors the victim.
arg(pro32b).  % [pro] Retribution helps console grieving families.
arg(pro32c).  % [pro] Retribution ensures that perpetrators of heinous crimes never have an opportunity to cause future tragedy.
arg(pro29).  % [pro] Capital punishment is still a threat to the criminal.
arg(con36).  % [con] The sad thing about the death penalty, according to those who are opposed, is that innocence is proven after the execution has been carried out.
arg(con189).  % [con] Once an inmate is executed, nothing can be done to make amends if a mistake has been made.
arg(con27).  % [con] Thus, for every seven people executed, we have found one person on death row who never should have been convicted.
arg(con174).  % [con] Capital punishment means that people without capital receive the punishment.
arg(con190).  % [con] Is it fair that someone should be murdered just because they were unlucky enough to be born with a brain defect?
arg(con229).  % [con] A recent study by Columbia University Law School found that two thirds of all capital trials contained serious errors.
arg(con140).  % [con] Allowing executions sanctions killing as a form of pay‑back.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro36, pro15).  % [undermining] conf=70 — pro36 claims the system appears draconian, challenging the premise that deserved punishment restores a just moral order
att(con36, pro15).  % [undermining] conf=90 — con36 highlights wrongful executions, undermining the premise that punishment is deserved and just
att(con189, pro15).  % [undermining] conf=90 — con189 points out irreversibility of errors, challenging the claim that punishment restores a just order
att(con27, pro15).  % [undermining] conf=90 — con27 provides evidence of innocent people executed, attacking the deservedness premise
att(con174, pro15).  % [undermining] conf=85 — con174 argues non‑deserving individuals receive death, weakening the claim of deserved punishment
att(con190, pro15).  % [undermining] conf=85 — con190 questions fairness for those with brain defects, undermining the notion of deserved moral punishment
att(con229, pro15).  % [undermining] conf=80 — B shows that many capital trials err, challenging A's premise that deserved punishment reliably restores a just order
att(pro15, con140).  % [rebuttal] conf=90 — A claims deserved punishment restores moral order, which directly contradicts B's claim that executions merely sanction killing as pay‑back
att(con36, pro15b).  % [undermining] conf=90 — Con36 shows executions can kill innocents, attacking the premise that the punished are the wrongdoers.
att(con189, pro15b).  % [undermining] conf=90 — Con189 argues irreversible mistakes make deserved punishment impossible, undermining the premise of guilt.
att(con27, pro15b).  % [undermining] conf=90 — Con27 cites wrongful convictions, challenging the premise that the executed are truly deserving.
att(con174, pro15b).  % [undermining] conf=85 — Con174 claims capital punishment punishes people who lack capital crimes, attacking the premise of deservedness.
att(con190, pro15b).  % [undermining] conf=85 — Con190 questions fairness for those with brain defects, undermining the premise of full responsibility.
att(con229, pro15b).  % [undermining] conf=90 — Con229 points to widespread trial errors, attacking the premise that the executed are correctly convicted.
att(con140, pro15b).  % [undercutting] conf=80 — Con140 argues that sanctioning killing as pay‑back shows the conclusion doesn’t follow even if proportionality holds.
att(con36, pro4).  % [rebuttal] conf=85 — B asserts executions can kill innocent, directly contradicting A’s claim that capital punishment is an acceptable protective measure.
att(con189, pro4).  % [rebuttal] conf=85 — B highlights irreversibility of wrongful execution, opposing A’s stance that the practice is acceptable.
att(con27, pro4).  % [rebuttal] conf=85 — B points to frequent wrongful convictions, challenging the acceptability asserted by A.
att(con174, pro4).  % [rebuttal] conf=80 — B claims capital punishment punishes those not deserving it, contradicting A’s view of its acceptability.
att(con190, pro4).  % [rebuttal] conf=80 — B questions the fairness of executing individuals with brain defects, opposing A’s acceptance of the penalty.
att(con229, pro4).  % [rebuttal] conf=80 — B cites systematic trial errors, undermining the notion that capital punishment is a sound protective tool.
att(con140, pro4).  % [rebuttal] conf=80 — B argues execution sanctions pay‑back killing, directly conflicting with A’s claim of its acceptability.
att(con27, pro95).  % [undermining] conf=80 — B shows some executed are innocent, challenging A's premise that all are repeat killers
att(con174, pro95).  % [undermining] conf=70 — B claims capital punishment punishes people without capital, questioning A's premise that it targets proven killers
att(con190, pro95).  % [undermining] conf=75 — B raises fairness concerns, attacking the moral premise underlying A's justification
att(con229, pro95).  % [undermining] conf=90 — B presents evidence of serious trial errors, undermining A's premise that death penalty applies to proven repeat offenders
att(con140, pro95).  % [undermining] conf=80 — B argues execution is pay‑back, challenging the moral premise that supports A's claim
att(con36, pro95).  % [undermining] conf=75 — The con argument highlights the risk of executing innocent people, undermining the premise that the killers are definitively guilty.
att(con189, pro95).  % [undermining] conf=80 — It stresses the irreversibility of execution, undermining the justification based on repeat‑killer evidence.
att(con174, pro32).  % [undermining] conf=85 — Con174 challenges the premise that execution honors the victim by claiming innocent people are punished.
att(con190, pro32).  % [undermining] conf=90 — Con190 attacks the moral premise of retributive justice by questioning the fairness of killing a person with a brain defect.
att(con229, pro32).  % [undermining] conf=90 — Con229 undermines the justification for retribution by pointing to systematic errors in capital trials.
att(con36, pro32b).  % [undermining] conf=90 — Con36 attacks the premise that retribution consoles families by highlighting the tragedy of executing the innocent.
att(con189, pro32b).  % [undermining] conf=90 — Con189 undermines the consolatory benefit of retribution by noting the irreversibility of wrongful executions.
att(con27, pro32b).  % [undermining] conf=85 — Con27 challenges the premise that retribution helps families by showing a high rate of wrongful convictions.
att(con174, pro32b).  % [undermining] conf=85 — Con174 attacks the premise that retributive execution honors victims by asserting innocent people are punished.
att(con190, pro32b).  % [undermining] conf=90 — Con190 questions the fairness of executing individuals with brain defects, undermining the moral premise of retributive consolation.
att(con229, pro32b).  % [undermining] conf=80 — B shows many trials have errors, challenging the premise that the executed are truly guilty, which A relies on to claim retribution consoles families.
att(con140, pro32b).  % [undermining] conf=70 — B argues that executions sanction killing as pay‑back, attacking the moral premise that retribution is a beneficial consolation.
att(con36, pro32c).  % [undermining] conf=85 — B points out post‑execution discovery of innocence, undermining the premise that the executed offender is correctly identified.
att(con189, pro32c).  % [undermining] conf=85 — B highlights the irreversibility of execution errors, challenging the premise that retribution safely prevents future harm.
att(con27, pro32c).  % [undermining] conf=90 — B provides statistics on wrongful convictions, attacking the premise that executed perpetrators are always guilty.
att(con190, pro32c).  % [undermining] conf=80 — B questions the fairness of executing someone with a brain defect, attacking the moral premise underlying A's retributive justification.
att(con229, pro32c).  % [undermining] conf=85 — B's study of trial errors challenges the assumption that executed offenders are correctly convicted, undermining A's premise.
att(con140, pro32c).  % [undermining] conf=75 — B claims executions sanction pay‑back killing, attacking the moral premise that retribution is a justified means of preventing future harm.
att(con36, pro29).  % [undermining] conf=70 — con36 shows wrongful executions, challenging the premise that capital punishment reliably threatens only guilty criminals
att(con189, pro29).  % [undermining] conf=70 — con189 highlights the irreversibility of errors, undermining the assumption that death penalty can be a safe deterrent
att(con27, pro29).  % [undermining] conf=75 — con27 provides evidence of innocent people being executed, weakening the claim that the penalty effectively threatens criminals
att(con190, pro29).  % [undermining] conf=70 — con190 raises fairness concerns for vulnerable defendants, attacking the moral premise behind the threat claim
att(con229, pro29).  % [undermining] conf=80 — con229 cites widespread trial errors, directly undermining the reliability of capital punishment as a threat
att(con27, con140).  % [undermining] conf=70 — The claim about innocent people being executed challenges the moral premise that executions are a justified form of pay‑back.
att(con190, con140).  % [undermining] conf=70 — Highlighting the unfairness of killing people with brain defects attacks the moral premise that executions are a legitimate pay‑back.
att(con229, con140).  % [undermining] conf=70 — Evidence of widespread trial errors undermines the justification that executions are a morally acceptable form of retribution.
att(con140, pro15).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims deserved punishment restores moral order, which directly contradicts B's claim that executions merely sanction killing as pay‑back
att(pro4, con36).  % [rebuttal] conf=85 — [symmetric rebuttal] B asserts executions can kill innocent, directly contradicting A’s claim that capital punishment is an acceptable protective measure.
att(pro4, con189).  % [rebuttal] conf=85 — [symmetric rebuttal] B highlights irreversibility of wrongful execution, opposing A’s stance that the practice is acceptable.
att(pro4, con27).  % [rebuttal] conf=85 — [symmetric rebuttal] B points to frequent wrongful convictions, challenging the acceptability asserted by A.
att(pro4, con174).  % [rebuttal] conf=80 — [symmetric rebuttal] B claims capital punishment punishes those not deserving it, contradicting A’s view of its acceptability.
att(pro4, con190).  % [rebuttal] conf=80 — [symmetric rebuttal] B questions the fairness of executing individuals with brain defects, opposing A’s acceptance of the penalty.
att(pro4, con229).  % [rebuttal] conf=80 — [symmetric rebuttal] B cites systematic trial errors, undermining the notion that capital punishment is a sound protective tool.
att(pro4, con140).  % [rebuttal] conf=80 — [symmetric rebuttal] B argues execution sanctions pay‑back killing, directly conflicting with A’s claim of its acceptability.