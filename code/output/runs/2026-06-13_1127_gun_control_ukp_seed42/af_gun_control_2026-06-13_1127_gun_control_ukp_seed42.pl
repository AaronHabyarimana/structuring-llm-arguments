% Automatisch generiert — Thema: Gun Control
% arg/1 Fakten
arg(pro29).  % [pro] American children under age 15 were nine times more likely to die of a gun accident than children in other advanced wealthy countries
arg(pro29b).  % [pro] About 200 Americans go to emergency rooms every day with gunshot wounds
arg(pro7).  % [pro] It is a terrible irony that the very same gun enthusiasts—many of whom see gun registration as an infringement on personal liberty and fear an oppressive federal government—wish to impose what they fear onto others.
arg(pro71).  % [pro] These gun owners and sellers have hopelessly perverted the original intent of the Second Amendment.
arg(pro71b).  % [pro] These gun owners and sellers have expanded the guarantee of the right to keep and bear arms far beyond its original bounds.
arg(pro63).  % [pro] Cars can be used to kill people.
arg(pro63b).  % [pro] Cars are far too large and unwieldy to replace guns; you can't exactly put a car in a backpack to sneak into a school.
arg(pro58).  % [pro] In 2007 the United States had 12,632 gun homicides (4.19 deaths per 100,000 people).
arg(pro58b).  % [pro] In 2007 the United States had 17,352 gun suicides (5.76 deaths per 100,000 people).
arg(pro36).  % [pro] Higher levels of gun ownership do not produce a safer society.
arg(pro36b).  % [pro] Higher levels of gun ownership often lead to a higher number of deaths due to gun violence.
arg(pro27).  % [pro] Armed civilians are unlikely to stop crimes.
arg(pro27b).  % [pro] Armed civilians are more likely to make dangerous situations, including mass shootings, more deadly.
arg(con23).  % [con] Strict gun control laws do not work in Mexico.
arg(con23b).  % [con] Strict gun control laws will not work in the United States.
arg(con109).  % [con] Studies show that children taught about firearms and their legitimate uses by family members have much lower rates of delinquency than children in households without guns.
arg(con109b).  % [con] Studies show that children introduced to guns associate them with freedom, security, and recreation—not violence.
arg(con9).  % [con] Car accidents kill more people every year than guns.
arg(con9b).  % [con] We should not ban cars.
arg(con8).  % [con] Strict gun control laws do not necessarily reduce gun homicide rates, as Mexico, which has some of the world’s strictest gun laws, recorded 9.97 gun homicides per 100,000 people in 2012—higher than the United States’ 2.97 per 100,000 people.
arg(con24).  % [con] Gun control laws would prevent citizens from protecting themselves from foreign invaders.
arg(con56).  % [con] A Dec. 10, 2014 Pew survey found that 57% of people believe that owning a gun protects people from being victimized.
arg(con60b).  % [con] I took the matter of the safety of myself and my family into my own hands.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con23, pro29).  % [undermining] conf=70 — Con23 challenges the premise that stricter gun laws reduce deaths, which underlies pro29's implication
att(con109, pro29).  % [undermining] conf=80 — Con109 disputes the premise that gun presence leads to negative child outcomes
att(con109b, pro29).  % [undermining] conf=80 — Con109b similarly attacks the premise linking guns to harm by highlighting positive associations
att(con8, pro29).  % [undermining] conf=75 — Con8 provides a counterexample that strict laws may not lower homicide rates, undermining the implied premise of pro29
att(con56, pro29).  % [undermining] conf=70 — Con56 cites public belief that guns provide protection, challenging the premise that guns are solely harmful to children
att(pro29, con60b).  % [undermining] conf=70 — A shows guns cause high child fatalities, challenging the premise that personal gun ownership ensures family safety.
att(pro71, con109).  % [rebuttal] conf=70 — A asserts guns are misused, while B claims gun education reduces delinquency, presenting incompatible conclusions about guns' societal impact.
att(pro71, con109b).  % [rebuttal] conf=70 — A's claim of perverted intent conflicts with B's assertion that gun exposure fosters positive values, making their conclusions mutually exclusive.
att(con109, pro71b).  % [undermining] conf=70 — B presents evidence that firearms education reduces delinquency, challenging any premise that expanding gun rights is wholly negative.
att(con109b, pro71b).  % [undermining] conf=70 — B shows children associate guns with positive values, which can undermine a premise that expanding gun rights is detrimental.
att(con109, pro36).  % [rebuttal] conf=90 — Con asserts that gun exposure lowers child delinquency, implying guns increase safety, which contradicts the pro claim that higher gun ownership does not make society safer.
att(con109b, pro36).  % [rebuttal] conf=80 — Con says children associate guns with security and freedom, suggesting guns enhance safety, directly opposing the pro conclusion.
att(con60b, pro36).  % [rebuttal] conf=75 — The personal anecdote that owning a gun protected the speaker’s family opposes the pro claim that higher gun ownership does not produce a safer society.
att(con23b, pro36b).  % [undermining] conf=70 — Asserts gun control ineffective in the United States, undermining the causal link between ownership levels and violence.
att(con8, pro36b).  % [undermining] conf=70 — Uses Mexico data to argue gun control does not reduce homicides, undermining the premise linking ownership to deaths.
att(con109, pro27b).  % [undermining] conf=80 — B challenges A's premise that armed civilians increase danger by showing firearm education can lead to lower delinquency, undermining the claim that guns inherently make situations more deadly.
att(pro27b, con8).  % [rebuttal] conf=85 — A asserts that armed civilians make dangerous situations more deadly (implying gun control would lower deaths), while B claims strict gun control does not necessarily reduce gun homicides, directly contradicting A's conclusion.
att(pro27b, con24).  % [undermining] conf=80 — A challenges B's premise that more guns aid citizen defense by claiming armed civilians increase danger, thus weakening the claim that gun control would hinder protection against invaders.
att(pro27, con8).  % [undermining] conf=80 — A can challenge B's premise that Mexico’s high homicide rate disproves gun‑control effectiveness by arguing other factors (e.g., drug cartels) invalidate the comparison.
att(pro27, con24).  % [undermining] conf=70 — A claims armed civilians are unlikely to stop crimes, which challenges B's premise that citizens need guns to protect themselves from foreign invaders.
att(con109, pro71).  % [rebuttal] conf=70 — [symmetric rebuttal] A asserts guns are misused, while B claims gun education reduces delinquency, presenting incompatible conclusions about guns' societal impact.
att(con109b, pro71).  % [rebuttal] conf=70 — [symmetric rebuttal] A's claim of perverted intent conflicts with B's assertion that gun exposure fosters positive values, making their conclusions mutually exclusive.
att(pro36, con109).  % [rebuttal] conf=90 — [symmetric rebuttal] Con asserts that gun exposure lowers child delinquency, implying guns increase safety, which contradicts the pro claim that higher gun ownership does not make society safer.
att(pro36, con109b).  % [rebuttal] conf=80 — [symmetric rebuttal] Con says children associate guns with security and freedom, suggesting guns enhance safety, directly opposing the pro conclusion.
att(pro36, con60b).  % [rebuttal] conf=75 — [symmetric rebuttal] The personal anecdote that owning a gun protected the speaker’s family opposes the pro claim that higher gun ownership does not produce a safer society.
att(con8, pro27b).  % [rebuttal] conf=85 — [symmetric rebuttal] A asserts that armed civilians make dangerous situations more deadly (implying gun control would lower deaths), while B claims strict gun control does not necessarily reduce gun homicides, directly contradicting A's conclusion.