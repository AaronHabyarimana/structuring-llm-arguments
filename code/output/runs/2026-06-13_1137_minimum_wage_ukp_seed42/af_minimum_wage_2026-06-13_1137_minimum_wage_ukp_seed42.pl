% Automatisch generiert — Thema: Minimum Wage
% arg/1 Fakten
arg(pro82).  % [pro] Increasing the minimum wage would allow teens to work fewer hours for the same amount of pay, giving teens more time to study.
arg(pro82b).  % [pro] Increasing the minimum wage would reduce the likelihood that teens would drop out of high school.
arg(pro15).  % [pro] Raising the federal minimum wage will benefit workers in states where the hourly minimum rate is already higher than the federal minimum.
arg(pro4).  % [pro] Improvements in productivity have outpaced increases in the minimum wage.
arg(pro4b).  % [pro] Improvements in economic growth have outpaced increases in the minimum wage.
arg(pro95).  % [pro] Firms are allowed to pay poverty-level wages to 3.6 million people, which is 5 percent of the workforce.
arg(pro95b).  % [pro] The 3.6 million workers must rely on Federal income support programs.
arg(pro36).  % [pro] The researchers' preliminary analysis of grocery, retail, gasoline, and rent prices found little or no evidence of price increases in Seattle relative to the surrounding areas.
arg(pro32).  % [pro] For more than 75 years, real GDP per capita has steadily increased, even when the minimum wage has been raised.
arg(pro29).  % [pro] The current federal minimum wage would need to be more than $8 per hour to equal its buying power of the early 1980s.
arg(pro29b).  % [pro] The current federal minimum wage would need to be nearly $11 per hour to equal its buying power of the late 1960s.
arg(con18).  % [con] Why pay a clerk a high wage to take an order when you can automate by putting up a kiosk ?
arg(con14).  % [con] The company may start outsourcing jobs to employees in countries that are willing to work for much less than $10.10 per hour.
arg(con14b).  % [con] Outsourcing jobs to low-wage countries results in fewer jobs for Americans.
arg(con87).  % [con] Politicians are playing on public sympathy.
arg(con87b).  % [con] The general public is too braindead to know what is really happening.
arg(con87c).  % [con] A wage hike is nothing more than a bandage on a massive hemorrhage.
arg(con70).  % [con] If the minimum wage is increased, fast-food restaurants would pass on almost 100% of their increased labor costs onto consumers.
arg(con70b).  % [con] If the minimum wage is increased, other firms may also pass on almost 100% of their increased labor costs onto consumers.
arg(con12).  % [con] If businesses must pay their minimum wage employees more, businesses cannot afford to hire as many employees.
arg(con76).  % [con] The teenage employment index fell sharply after the July 2009 minimum-wage increase, dropping about 8% in three months, whereas the previous 8% drop took over a year.
arg(con76b).  % [con] The 2009 minimum-wage increase significantly reduced teenage employment.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con18, pro82).  % [undermining] conf=80 — Con18 challenges the premise that higher wages will simply reduce teen hours by suggesting employers may replace workers with automation
att(con14, pro82).  % [undermining] conf=80 — Con argues firms may outsource, threatening the premise that teens will retain jobs to work fewer hours.
att(con14b, pro82).  % [undermining] conf=80 — Con claims outsourcing reduces American jobs, undermining the premise that teen employment will persist.
att(con87c, pro82).  % [undercutting] conf=70 — Con says a wage hike is only a bandage, suggesting the pro conclusion about teen study time does not follow.
att(con12, pro82).  % [undermining] conf=85 — Con asserts higher wages force firms to cut staff, undermining the premise that teens can keep jobs and work fewer hours.
att(con76, pro82).  % [undermining] conf=90 — Con cites a post‑2009 drop in teen employment, directly challenging the premise that teens will stay employed.
att(con76b, pro82).  % [undermining] conf=90 — Con presents evidence of reduced teen employment after a wage hike, undermining the pro premise.
att(con14, pro82b).  % [undermining] conf=70 — The outsourcing claim challenges the premise that higher wages will keep teens in school by suggesting jobs may disappear.
att(con14b, pro82b).  % [undermining] conf=70 — It attacks the premise that higher wages protect teen employment by pointing to job loss through off‑shoring.
att(con87c, pro82b).  % [undercutting] conf=65 — It argues that a wage hike is merely a superficial fix, so the conclusion that it reduces teen dropout does not follow.
att(con12, pro82b).  % [undermining] conf=75 — It challenges the premise that higher wages allow firms to retain or hire teens by asserting firms can’t afford as many employees.
att(con76, pro82b).  % [undermining] conf=80 — Empirical evidence of a sharp drop in teen employment after a wage hike undermines the premise that higher wages keep teens in school.
att(con76b, pro82b).  % [undermining] conf=85 — The claim that the 2009 increase reduced teenage employment directly attacks the premise linking higher wages to lower dropout rates.
att(con18, pro15).  % [undermining] conf=70 — Con18 suggests employers may replace workers with kiosks, undermining the premise that raising the wage will benefit workers
att(con14, pro15).  % [undermining] conf=70 — Con14 argues higher wages could trigger outsourcing, undermining the premise that workers will benefit from a federal raise
att(con87c, pro15).  % [undercutting] conf=60 — B argues that a wage hike is merely a bandage, suggesting A’s conclusion that it will benefit workers does not follow.
att(con12, pro15).  % [undercutting] conf=80 — B claims higher wages reduce hiring ability, challenging the inference that raising the federal minimum wage will benefit workers.
att(con76, pro15).  % [undercutting] conf=85 — B provides evidence of a sharp teen employment drop after a wage increase, undermining A’s benefit claim.
att(con76b, pro15).  % [undercutting] conf=85 — B asserts the 2009 wage hike significantly reduced teenage employment, directly challenging A’s conclusion of benefit.
att(pro4, con18).  % [undermining] conf=70 — Pro4 shows wages are low relative to productivity, undermining con18’s premise that paying a clerk a high wage is a realistic concern.
att(pro4, con14).  % [undermining] conf=65 — By asserting wages lag productivity, pro4 challenges con14’s premise that companies would need to outsource because wages are high.
att(pro4, con76).  % [rebuttal] conf=90 — Pro asserts productivity outpaces wage increases implying no harm, while con reports a sharp drop in teenage employment, a direct contradiction.
att(pro4, con76b).  % [rebuttal] conf=90 — Pro’s claim of outpacing productivity conflicts with con’s evidence of reduced teenage employment after the wage hike.
att(con12, pro4b).  % [undermining] conf=80 — B challenges the premise that economic growth can absorb wage hikes by claiming higher wages limit hiring
att(con76, pro4b).  % [undermining] conf=85 — B provides empirical evidence that a wage increase reduced teenage employment, undermining A's premise that growth outpaced wage rises
att(con76b, pro4b).  % [undermining] conf=80 — B asserts the 2009 wage hike cut teenage jobs, attacking the premise that growth makes wage hikes harmless
att(con70, pro36).  % [rebuttal] conf=95 — con70 predicts price increases that directly conflict with pro36's claim of little or no price rise
att(con70b, pro36).  % [rebuttal] conf=95 — con70b asserts widespread price pass‑through, contradicting pro36's empirical finding of no price increase
att(con14, pro32).  % [undercutting] conf=70 — Con14 argues that outsourcing could occur despite GDP growth, showing the pro’s conclusion that raises are harmless doesn’t follow even if the premise is true.
att(con14b, pro32).  % [undercutting] conf=75 — Con14b claims outsourcing reduces American jobs, challenging the inference that minimum‑wage hikes are economically benign.
att(con70, pro32).  % [undercutting] conf=70 — Con70 predicts full cost pass‑through to consumers, showing the pro’s claim that raises are harmless is not logically guaranteed.
att(con70b, pro32).  % [undercutting] conf=70 — Con70b extends the cost‑pass‑through argument to all firms, similarly undercutting the pro’s conclusion.
att(con12, pro32).  % [undercutting] conf=70 — Con12 argues higher wages limit hiring, challenging the pro’s inference that economic growth proves no negative employment effects.
att(con76, pro32).  % [undercutting] conf=75 — Con76 presents evidence of a sharp teenage‑employment drop after a wage hike, questioning the pro’s claim that raises are without adverse effects.
att(con76b, pro32).  % [undercutting] conf=75 — Con76b asserts the 2009 increase reduced teenage employment, undermining the pro’s implication that raises are benign.
att(con76, pro29).  % [undermining] conf=70 — B provides evidence that raising the minimum wage led to a sharp drop in teenage employment, challenging the premise that increasing the wage is beneficial.
att(con76b, pro29).  % [undermining] conf=85 — B provides evidence that a past minimum‑wage increase hurt employment, challenging the premise that raising the wage is harmless.
att(con18, pro29b).  % [undermining] conf=85 — B argues automation can replace clerks, attacking the premise that higher wages are a viable solution.
att(con14, pro29b).  % [undermining] conf=85 — B suggests firms may outsource to cheaper labor, undermining the premise that a higher domestic minimum wage will keep jobs at home.
att(con14b, pro29b).  % [undermining] conf=85 — B claims outsourcing reduces American jobs, attacking the premise that raising the wage will not harm domestic employment.
att(con87, pro29b).  % [undermining] conf=80 — B attacks the political motive, questioning the premise that the wage argument is based on objective economic need.
att(con87b, pro29b).  % [undermining] conf=80 — B dismisses public understanding, undermining the premise that popular support reflects a sound economic argument.
att(con87c, pro29b).  % [undercutting] conf=85 — B argues a wage hike is only a superficial fix, showing the conclusion that higher wages solve the problem does not follow even if the buying‑power premise is true.
att(con70, pro29b).  % [undermining] conf=85 — B claims firms will pass the full cost to consumers, attacking the premise that a higher wage is without broader economic harm.
att(con70b, pro29b).  % [undermining] conf=85 — B extends the cost‑pass‑through argument to other firms, undermining the premise that raising the wage has limited side effects.
att(con12, pro29b).  % [undermining] conf=85 — B states higher wages limit hiring capacity, attacking the premise that businesses can absorb wage increases without reducing employment.
att(con76, pro29b).  % [undermining] conf=75 — B shows a negative employment effect of a past minimum‑wage hike, challenging the premise that raising the wage (as A implies) is beneficial.
att(con76b, pro29b).  % [undermining] conf=75 — B claims the 2009 increase cut teenage jobs, undermining the assumption that a higher wage (as A suggests) would be a positive policy.
att(con14, con70b).  % [undermining] conf=80 — A claims firms can outsource to cheaper labor, which weakens B's premise that firms must pass increased labor costs onto consumers
att(con70, con12).  % [undermining] conf=78 — Con70’s premise that firms can pass 100% of costs implies they can afford wages, which challenges con12’s premise that firms cannot afford to hire.
att(con76, con70).  % [undermining] conf=75 — Con76’s observed employment drop undermines con70’s premise that firms will simply pass costs to consumers without cutting jobs.
att(con76b, con70).  % [undermining] conf=75 — Evidence of reduced teenage employment contradicts con70’s assumption that firms can fully shift labor costs to prices.
att(con70b, con12).  % [undermining] conf=78 — Con70b’s claim that firms can pass costs suggests they can afford wages, opposing con12’s premise of unaffordable hiring.
att(con76, con70b).  % [undermining] conf=75 — The employment decline reported in con76 challenges con70b’s premise that firms will merely pass costs to consumers.
att(con76b, con70b).  % [undermining] conf=75 — Con76b’s claim of reduced teenage employment undermines con70b’s assumption of full cost pass‑through without job loss.
att(con76, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro asserts productivity outpaces wage increases implying no harm, while con reports a sharp drop in teenage employment, a direct contradiction.
att(con76b, pro4).  % [rebuttal] conf=90 — [symmetric rebuttal] Pro’s claim of outpacing productivity conflicts with con’s evidence of reduced teenage employment after the wage hike.
att(pro36, con70).  % [rebuttal] conf=95 — [symmetric rebuttal] con70 predicts price increases that directly conflict with pro36's claim of little or no price rise
att(pro36, con70b).  % [rebuttal] conf=95 — [symmetric rebuttal] con70b asserts widespread price pass‑through, contradicting pro36's empirical finding of no price increase