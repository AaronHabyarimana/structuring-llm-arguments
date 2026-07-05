% Automatisch generiert — Thema: Minimum Wage
% arg/1 Fakten
arg(pro82).  % [pro] Increasing the minimum wage would allow teens to work fewer hours for the same amount of pay, giving teens more time to study.
arg(pro82b).  % [pro] Increasing the minimum wage would reduce the likelihood that teens would drop out of high school.
arg(pro15).  % [pro] Raising the federal minimum wage won't benefit workers in states where the hourly minimum rate is already higher than the federal minimum.
arg(pro4).  % [pro] Improvements in productivity and economic growth have outpaced increases in the minimum wage.
arg(pro95).  % [pro] Firms are allowed to pay poverty-level wages to 3.6 million people, which is 5 percent of the workforce.
arg(pro95b).  % [pro] The 3.6 million workers must rely on Federal income support programs.
arg(pro36).  % [pro] Our preliminary analysis of grocery, retail, gasoline, and rent prices has found little or no evidence of price increases in Seattle relative to the surrounding areas.
arg(pro32).  % [pro] Real GDP per capita has steadily increased for more than 75 years.
arg(pro29).  % [pro] The current federal minimum wage would need to be more than $8 per hour to equal its buying power of the early 1980s when adjusted for inflation.
arg(pro29b).  % [pro] The current federal minimum wage would need to be nearly $11 per hour to equal its buying power of the late 1960s when adjusted for inflation.
arg(con18).  % [con] Why pay a clerk a high wage to take an order when you can automate by putting up a kiosk?
arg(con95).  % [con] Businesses will essentially pass the costs of the wage increase on to consumers.
arg(con14).  % [con] The company may start outsourcing jobs to employees in countries that are willing to work for much less than $10.10 per hour.
arg(con14b).  % [con] Outsourcing jobs to lower‑wage countries would result in fewer jobs for Americans.
arg(con87).  % [con] Politicians are playing on public sympathy.
arg(con87b).  % [con] Politicians are exploiting the fact that the general public is too unintelligent to know what is really happening.
arg(con87c).  % [con] The general public is too unintelligent to know what is really happening.
arg(con87d).  % [con] The general public does not understand why a wage hike is nothing more than a bandage on a massive hemorrhage.
arg(con87e).  % [con] A wage hike is nothing more than a bandage on a massive hemorrhage.
arg(con70).  % [con] If the minimum wage is increased, fast-food restaurants would pass on almost 100 % of their increased labor costs to consumers.
arg(con70b).  % [con] If the minimum wage is increased, other firms may also pass on almost all of their increased labor costs to consumers.
arg(con12).  % [con] If businesses must pay minimum wage employees more, businesses cannot afford to hire as many employees.
arg(con76).  % [con] The observed fall in teenage employment suggests that the 2009 minimum-wage increase significantly reduced teenage employment.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con14, pro82).  % [undermining] conf=90 — Con argues jobs may be outsourced, threatening the availability of teen jobs that pro assumes.
att(con14b, pro82).  % [undermining] conf=90 — Con claims outsourcing reduces American jobs, undermining the premise that teens will have jobs to work fewer hours.
att(con87d, pro82).  % [undercutting] conf=70 — Con suggests the wage hike is merely a bandage, challenging the inference that it will meaningfully benefit teens.
att(con87e, pro82).  % [undercutting] conf=70 — Con declares the wage hike ineffective, undercutting the pro conclusion that it will give teens more study time.
att(con70, pro82).  % [undermining] conf=80 — Con predicts full cost pass‑through to consumers, undermining the premise that higher wages translate to higher net earnings for teens.
att(con70b, pro82).  % [undermining] conf=80 — Similar to con70, it challenges the premise that wage increases benefit teens by suggesting costs are shifted to prices.
att(con12, pro82).  % [undermining] conf=85 — Con argues firms will hire fewer workers, undermining the premise that teens will retain jobs to work fewer hours.
att(pro15, pro82).  % [undermining] conf=70 — pro15 claims a federal raise won’t help workers in states with higher minima, challenging the premise that a higher wage will benefit teens everywhere.
att(con18, pro82).  % [undercutting] conf=80 — con18 suggests higher wages may lead to automation, so teens might lose jobs rather than gain study time.
att(con95, pro82).  % [undermining] conf=70 — con95 argues cost pass‑through to consumers, undermining the premise that a wage rise will simply free teens’ time without other effects.
att(con95, pro82b).  % [undermining] conf=80 — Con argument claims cost pass‑through, challenging the premise that a wage hike will net‑benefit teens.
att(con14, pro82b).  % [undermining] conf=75 — Con argument warns of outsourcing, questioning the premise that higher wages will keep teen jobs and reduce dropouts.
att(con14b, pro82b).  % [undermining] conf=75 — Con argument asserts outsourcing reduces American jobs, undermining the premise that a wage rise helps teens stay in school.
att(con70, pro82b).  % [undermining] conf=80 — Con argument that fast‑food firms will pass on costs challenges the premise that a wage hike will benefit teens without negative side effects.
att(con70b, pro82b).  % [undermining] conf=80 — Con argument that other firms will shift costs undermines the premise that raising the minimum wage will help teens without harming them.
att(con76, pro82).  % [undermining] conf=80 — B shows that the wage hike cut teen employment, challenging A’s premise that teens will still be employed to work fewer hours.
att(pro15, pro82b).  % [undermining] conf=70 — B argues that a federal increase won’t help workers in states with higher state minima, questioning A’s premise that higher wages will benefit all teens.
att(con18, pro82b).  % [undermining] conf=75 — B suggests higher wages encourage automation, undermining A’s premise that teens will retain jobs to earn enough for study time.
att(con12, pro82b).  % [undermining] conf=65 — B’s claim that higher wages force businesses to cut staff weakens A’s implicit premise that teens can earn wages to stay in school.
att(con76, pro82b).  % [undermining] conf=70 — B’s evidence of reduced teenage employment challenges A’s premise that higher wages will keep teens in school.
att(pro4, pro29).  % [rebuttal] conf=90 — A claims wage growth already outpaced productivity, implying no raise needed, while B claims the wage has lost buying power and must be raised, directly contradicting A's conclusion
att(pro4, con18).  % [rebuttal] conf=85 — A claims raising the minimum wage is justified by productivity gains, while B claims high wages are unnecessary because automation can replace workers, making their conclusions mutually exclusive.
att(pro4, con95).  % [rebuttal] conf=90 — A claims productivity growth lets firms absorb higher wages, while B claims firms will pass those costs to consumers, which are mutually exclusive outcomes
att(pro4, con87d).  % [rebuttal] conf=80 — A claims wage hikes are affordable and justified, while B claims they are merely a superficial fix, directly contradicting each other's conclusions
att(pro4, con87e).  % [undercutting] conf=70 — A shows productivity growth means a wage hike could be effective, challenging B's claim it’s merely a bandage
att(pro4, con70).  % [rebuttal] conf=90 — A claims businesses can absorb higher wages because productivity outpaces wage growth, while B claims they will pass almost all extra labor costs to consumers, making the conclusions mutually exclusive.
att(pro4, con70b).  % [rebuttal] conf=80 — A claims higher minimum wages are affordable because productivity outpaces wage growth, while B claims firms will pass those higher costs to consumers, a direct contradiction.
att(pro4, con12).  % [rebuttal] conf=90 — A claims productivity growth makes higher wages affordable, contradicting B’s claim that higher wages force firms to cut employment
att(pro4, con76).  % [undermining] conf=70 — Pro4 claims productivity outpaced wage hikes, challenging con76's premise that the 2009 minimum‑wage increase caused teenage job loss.
att(con18, pro95).  % [undermining] conf=80 — Con18 questions the need for higher wages by suggesting automation, attacking the premise behind pro95's concern about poverty‑level pay.
att(con95, pro95).  % [undermining] conf=80 — Con95 argues that wage hikes will be passed to consumers, undermining pro95's implicit premise that raising wages is harmless.
att(con14, pro95).  % [undermining] conf=75 — Con14 claims firms may outsource to cheaper labor, challenging pro95's premise that low wages are the primary issue.
att(con14b, pro95).  % [undermining] conf=75 — Con14b asserts outsourcing would cut American jobs, attacking the premise underlying pro95's focus on low domestic wages.
att(con70, pro95b).  % [undermining] conf=70 — The claim that costs will be fully passed to consumers challenges the premise that a wage hike will help workers reduce reliance on support.
att(con70b, pro95b).  % [undermining] conf=70 — Suggesting that firms will pass on labor‑cost increases undermines the premise that higher wages will improve workers' net income.
att(con12, pro95b).  % [undermining] conf=75 — The argument that businesses cannot afford to hire as many employees attacks the premise that a wage increase will benefit the workers in question.
att(con76, pro95b).  % [undermining] conf=80 — Evidence of reduced teenage employment after a wage hike undermines the premise that raising the minimum wage helps the target workers.
att(con18, pro36).  % [undermining] conf=70 — The automation argument attacks the premise that higher wages are necessary for clerks.
att(con95, pro36).  % [undercutting] conf=80 — Claiming businesses will pass wage costs to consumers shows the price‑stability conclusion does not follow even if the premise were true.
att(con87d, pro29).  % [undercutting] conf=65 — Con87d claims a wage hike is merely a bandage, challenging the inference that raising the minimum wage will solve the problem.
att(con87e, pro29).  % [undercutting] conf=70 — Con87e similarly argues a wage increase is ineffective, undercutting pro29’s implication that a higher wage is the solution.
att(con18, con70).  % [undermining] conf=70 — con18 claims automation can avoid high wages, challenging con70's premise that firms will have increased labor costs to pass on.
att(con18, con70b).  % [undermining] conf=70 — By suggesting kiosks replace clerks, con18 disputes the premise that other firms will face higher labor costs to shift to consumers.
att(con14, con95).  % [undermining] conf=70 — con14 suggests firms may outsource instead of passing costs, attacking the premise behind con95's claim.
att(con14b, con95).  % [undermining] conf=70 — con14b argues outsourcing will cut American jobs, challenging con95's premise that cost‑shifting to consumers is the primary response.
att(con14, con76).  % [undermining] conf=60 — Argument con14 offers an alternative cause (outsourcing) that challenges the premise that the wage increase alone caused the drop in teenage employment.
att(con70, con12).  % [undermining] conf=70 — A claims firms can fully pass higher labor costs to consumers, which weakens B's premise that businesses cannot afford to hire more.
att(con70b, con12).  % [undermining] conf=70 — A asserts that firms may shift almost all added labor costs to consumers, challenging B's premise that higher wages force firms to cut hiring.
att(pro29, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims wage growth already outpaced productivity, implying no raise needed, while B claims the wage has lost buying power and must be raised, directly contradicting A's conclusion
att(con18, pro4).  % [rebuttal] conf=85 — [symmetric rebuttal] A claims raising the minimum wage is justified by productivity gains, while B claims high wages are unnecessary because automation can replace workers, making their conclusions mutually exclusive.
att(con95, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims productivity growth lets firms absorb higher wages, while B claims firms will pass those costs to consumers, which are mutually exclusive outcomes
att(con87d, pro4).  % [rebuttal] conf=80 — [symmetric rebuttal] A claims wage hikes are affordable and justified, while B claims they are merely a superficial fix, directly contradicting each other's conclusions
att(con70, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims businesses can absorb higher wages because productivity outpaces wage growth, while B claims they will pass almost all extra labor costs to consumers, making the conclusions mutually exclusive.
att(con70b, pro4).  % [rebuttal] conf=80 — [symmetric rebuttal] A claims higher minimum wages are affordable because productivity outpaces wage growth, while B claims firms will pass those higher costs to consumers, a direct contradiction.
att(con12, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] A claims productivity growth makes higher wages affordable, contradicting B’s claim that higher wages force firms to cut employment