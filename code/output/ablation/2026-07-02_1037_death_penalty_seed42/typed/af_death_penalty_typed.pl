% Automatisch generiert — Thema: Death Penalty
% arg/1 Fakten
arg(pro82).  % [pro] On the contrary, sometimes defendants insist on execution.
arg(pro15).  % [pro] Deserved punishment protects society morally by restoring the just order.
arg(pro15b).  % [pro] Deserved punishment makes the wrongdoer pay a price equivalent to the harm the wrongdoer has caused.
arg(pro4).  % [pro] The framers of the Constitution clearly believed that capital punishment was an acceptable means of protecting society from wicked dissolute men.
arg(pro4b).  % [pro] Thomas Jefferson liked to talk about capital punishment.
arg(pro95).  % [pro] The fact has been proven that these killers reoffend repeatedly.
arg(pro36).  % [pro] If the criminal knows that the justice system will not stop at putting him to death, then the system appears more draconian to him.
arg(pro32).  % [pro] Retribution or "an eye for an eye" honors the victim.
arg(pro32b).  % [pro] Retribution or "an eye for an eye" helps console grieving families.
arg(pro32c).  % [pro] Retribution or "an eye for an eye" ensures that perpetrators of heinous crimes never have an opportunity to cause future tragedy.
arg(pro29).  % [pro] Capital punishment is a threat to criminals.
arg(con36).  % [con] The sad thing about the death penalty, according to those who are opposed, is that innocence is proven after the execution has been carried out.
arg(con189).  % [con] Once an inmate is executed, nothing can be done to make amends if a mistake has been made.
arg(con27).  % [con] Thus, for every seven people executed, we have found one person on death row who never should have been convicted.
arg(con174).  % [con] Capital punishment means that people without capital receive the punishment.
arg(con190).  % [con] Is it fair that a person should be murdered just because the person was unlucky enough to be born with a brain defect?
arg(con229).  % [con] A recent study by Columbia University Law School found that two thirds of all capital trials contained serious errors.
arg(con140).  % [con] Allowing executions sanctions killing as a form of pay‑back.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro82, pro29).  % [undermining] conf=70 — Shows that some criminals desire execution, challenging the premise that the death penalty functions as a deterrent threat.
att(con36, pro15).  % [undermining] conf=80 — B highlights the risk of executing innocents, attacking the premise that punishment is deserved
att(con189, pro15).  % [undermining] conf=80 — B points out the irreversibility of execution, undermining the claim that punishment restores justice
att(con27, pro15).  % [undermining] conf=85 — B provides evidence of wrongful executions, challenging the notion of deserved punishment
att(con174, pro15).  % [undermining] conf=70 — B argues that capital punishment leads to unjust application, weakening the moral justification in A
att(con190, pro15).  % [undermining] conf=85 — B questions the fairness of executing individuals with brain defects, attacking the premise of moral deservedness
att(con229, pro15).  % [undermining] conf=80 — B challenges the premise that capital punishment is just by citing widespread trial errors.
att(pro15, con140).  % [rebuttal] conf=85 — A claims execution restores moral order, while B asserts it merely sanctions killing as pay‑back, a direct moral contradiction.
att(con36, pro15b).  % [undermining] conf=90 — Con36 questions the certainty of guilt, undermining the premise that the punished person is the true wrongdoer.
att(con189, pro15b).  % [undermining] conf=88 — Con189 highlights the irreversibility of execution, challenging the premise that the convicted individual is correctly identified.
att(con27, pro15b).  % [undermining] conf=85 — Con27 presents evidence of wrongful convictions, undermining the premise that the punished are indeed the wrongdoers.
att(con174, pro15b).  % [undercutting] conf=80 — Con174 argues that capital punishment can be disproportionate, showing the conclusion of deserved equivalence does not follow.
att(con190, pro15b).  % [undercutting] conf=78 — Con190 questions the fairness of executing individuals with brain defects, undercutting the claim that punishment always matches harm.
att(con229, pro15b).  % [undermining] conf=87 — Con229 cites systematic trial errors, undermining the premise that the executed are correctly identified as wrongdoers.
att(con140, pro15b).  % [undermining] conf=82 — Con140 frames executions as sanctioned pay‑back killing, challenging the moral premise that such punishment is deserved.
att(con36, pro4).  % [undermining] conf=80 — Con36 challenges the acceptability of capital punishment by highlighting the risk of executing innocent people, undermining the premise that it protects society.
att(con189, pro4).  % [undermining] conf=80 — Con189 argues that wrongful executions are irreversible, attacking the premise that capital punishment is a justified protective measure.
att(con27, pro4).  % [undermining] conf=85 — Con27 presents evidence of wrongful convictions, undermining the claim that capital punishment reliably protects society.
att(con174, pro4).  % [undermining] conf=70 — Con174 asserts that capital punishment unfairly punishes non‑capital offenders, challenging the premise of its justified use.
att(con190, pro4).  % [undermining] conf=80 — Con190 questions the fairness of executing individuals with brain defects, attacking the moral premise of capital punishment’s acceptability.
att(con229, pro4).  % [undermining] conf=85 — Con229 cites systematic trial errors, undermining the premise that capital punishment is a reliable protective tool.
att(con140, pro4).  % [undermining] conf=75 — Con140 frames executions as sanctioned pay‑back killing, challenging the moral justification underlying pro4’s claim.
att(con36, pro4b).  % [rebuttal] conf=80 — A implies death penalty is justified, while B argues it risks executing innocent, a direct contradiction
att(con189, pro4b).  % [rebuttal] conf=80 — A supports death penalty; B claims execution is irreversible if a mistake occurs, contradicting A’s implied endorsement
att(con27, pro4b).  % [rebuttal] conf=80 — A’s implied support of capital punishment conflicts with B’s claim that many executed were innocent
att(con174, pro4b).  % [rebuttal] conf=80 — A suggests death penalty is acceptable, while B states it punishes people who do not deserve it, a logical incompatibility
att(con36, pro95).  % [undercutting] conf=70 — B shows that even if killers reoffend, the death penalty may be unjust because innocent people could be executed.
att(con189, pro95).  % [undercutting] conf=70 — B argues that the irreversibility of execution undermines the justification based on repeat offenses.
att(pro95, con174).  % [rebuttal] conf=85 — A asserts the death penalty is justified, whereas B asserts it is unjust, directly contradicting each other's conclusions
att(pro95, con229).  % [rebuttal] conf=90 — A claims the death penalty is justified by recidivism, while B claims it is unjustified due to trial errors, making their conclusions mutually exclusive.
att(pro95, con140).  % [rebuttal] conf=90 — A concludes the death penalty is justified, whereas B concludes it is immoral, directly contradicting each other
att(con174, pro32).  % [undermining] conf=85 — con174 claims the death penalty punishes people who are not deserving, challenging the premise that retribution honors the victim
att(con190, pro32).  % [undermining] conf=85 — con190 questions the fairness of killing someone with a brain defect, attacking the moral premise behind honoring the victim
att(con229, pro32).  % [undermining] conf=85 — con229 cites systematic trial errors, undermining the claim that retributive execution properly honors victims
att(con140, pro32).  % [undermining] conf=85 — con140 argues that executions sanction killing as pay‑back, challenging the premise that such retribution is a proper honor
att(con36, pro32b).  % [undermining] conf=85 — con36 highlights the risk of executing the innocent, weakening the premise that retribution consoles families
att(con189, pro32b).  % [undermining] conf=85 — con189 points out the irreversibility of execution errors, undermining the claim that retribution benefits grieving families
att(con27, pro32b).  % [undermining] conf=85 — con27 provides statistics on wrongful executions, challenging the premise that retributive death penalties aid families
att(con174, pro32b).  % [undermining] conf=85 — con174 argues that capital punishment punishes undeserving individuals, attacking the justification that it honors victims
att(con190, pro32b).  % [undermining] conf=85 — con190 questions the fairness of killing someone with a brain defect, undermining the moral basis of retributive consolation
att(pro32, con36).  % [rebuttal] conf=90 — A claims the death penalty is justified to honor victims, while B claims it is unjust because innocent people may be executed, directly opposing the same normative proposition.
att(pro32, con189).  % [rebuttal] conf=90 — A claims the death penalty is justified by honoring victims, while B claims it is unjust because execution is irreversible, making their conclusions mutually exclusive.
att(con27, pro32).  % [undercutting] conf=80 — B shows that even if retribution honors victims, the death penalty’s wrongful executions prevent the conclusion from following
att(con229, pro32b).  % [undermining] conf=70 — Con argument shows many trials have serious errors, undermining the premise that executions will correctly target the guilty, which the pro claim relies on for consolation.
att(con140, pro32b).  % [undermining] conf=65 — Con claim that executions sanction killing as pay‑back attacks the moral premise that retributive killing is justified, which the pro argument assumes.
att(con36, pro32c).  % [undermining] conf=80 — Con argument highlights the risk of executing the innocent, undermining the pro premise that execution reliably prevents future tragedy.
att(con189, pro32c).  % [undermining] conf=80 — Con claim that mistakes are irreversible undermines the pro premise that execution safely eliminates future threats.
att(con27, pro32c).  % [undermining] conf=85 — Con evidence of wrongful convictions attacks the pro assumption that only guilty perpetrators are executed.
att(con174, pro32c).  % [undermining] conf=70 — Con argument that non‑capital offenders receive the punishment challenges the pro claim that retribution is justly applied only to the guilty.
att(con190, pro32c).  % [undermining] conf=75 — Con question of fairness to those with brain defects attacks the moral premise underlying the pro retributive justification.
att(con229, pro32c).  % [undermining] conf=80 — Con study of trial errors undermines the pro premise that executions will correctly target the true perpetrators.
att(con140, pro32c).  % [undermining] conf=70 — Con claim that executions sanction killing as pay‑back attacks the moral justification assumed by the pro retributive argument.
att(con36, pro29).  % [undermining] conf=70 — con36 shows wrongful executions, challenging the premise that capital punishment effectively threatens criminals
att(con189, pro29).  % [undermining] conf=70 — con189 argues mistakes are irreversible, undermining the premise that capital punishment is a reliable threat
att(con27, pro29).  % [undermining] conf=80 — con27 provides evidence of innocent people executed, weakening the claim that capital punishment threatens only criminals
att(con174, pro29).  % [rebuttal] conf=75 — con174 claims the death penalty punishes non‑capital offenders, directly contradicting the idea that it is a threat to criminals
att(con229, pro29).  % [undermining] conf=80 — con229 cites high error rates in capital trials, undermining the premise that capital punishment reliably threatens criminals
att(con140, pro15).  % [rebuttal] conf=85 — [symmetric rebuttal] A claims execution restores moral order, while B asserts it merely sanctions killing as pay‑back, a direct moral contradiction.
att(pro4b, con36).  % [rebuttal] conf=80 — [symmetric rebuttal] A implies death penalty is justified, while B argues it risks executing innocent, a direct contradiction
att(pro4b, con189).  % [rebuttal] conf=80 — [symmetric rebuttal] A supports death penalty; B claims execution is irreversible if a mistake occurs, contradicting A’s implied endorsement
att(pro4b, con27).  % [rebuttal] conf=80 — [symmetric rebuttal] A’s implied support of capital punishment conflicts with B’s claim that many executed were innocent
att(pro4b, con174).  % [rebuttal] conf=80 — [symmetric rebuttal] A suggests death penalty is acceptable, while B states it punishes people who do not deserve it, a logical incompatibility
att(con174, pro95).  % [rebuttal] conf=85 — [symmetric rebuttal] A asserts the death penalty is justified, whereas B asserts it is unjust, directly contradicting each other's conclusions
att(con229, pro95).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims the death penalty is justified by recidivism, while B claims it is unjustified due to trial errors, making their conclusions mutually exclusive.
att(con140, pro95).  % [rebuttal] conf=90 — [symmetric rebuttal] A concludes the death penalty is justified, whereas B concludes it is immoral, directly contradicting each other
att(con36, pro32).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims the death penalty is justified to honor victims, while B claims it is unjust because innocent people may be executed, directly opposing the same normative proposition.
att(con189, pro32).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims the death penalty is justified by honoring victims, while B claims it is unjust because execution is irreversible, making their conclusions mutually exclusive.
att(pro29, con174).  % [rebuttal] conf=75 — [symmetric rebuttal] con174 claims the death penalty punishes non‑capital offenders, directly contradicting the idea that it is a threat to criminals