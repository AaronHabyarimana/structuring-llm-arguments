% Automatisch generiert — Thema: Autonomous Vehicles
% arg/1 Fakten
arg(pro1).  % [pro] Autonomous vehicles reduce traffic accidents caused by human error.
arg(pro2).  % [pro] Self-driving cars increase road capacity by optimizing vehicle spacing.
arg(pro3).  % [pro] Autonomous vehicles provide mobility for people who cannot drive themselves.
arg(pro4).  % [pro] Self-driving technology lowers fuel consumption through more efficient driving patterns.
arg(pro5).  % [pro] Autonomous vehicles enable passengers to use travel time for work or leisure.
arg(pro6).  % [pro] Autonomous fleets can reduce the total number of privately owned cars.
arg(pro7).  % [pro] Self-driving cars can integrate with smart‑city infrastructure to smooth traffic flow.
arg(pro8).  % [pro] Autonomous vehicles operate continuously without driver fatigue.
arg(pro9).  % [pro] Self‑driving technology accelerates the adoption of electric vehicles.
arg(pro10).  % [pro] Data collected by autonomous vehicles improves transportation planning and policy.
arg(con1).  % [con] Autonomous vehicles create significant cybersecurity vulnerabilities.
arg(con2).  % [con] Self‑driving cars could cause massive job losses for professional drivers.
arg(con3).  % [con] Autonomous systems often struggle to operate safely in unpredictable weather conditions.
arg(con4).  % [con] Liability becomes complex after accidents involving autonomous vehicles.
arg(con5).  % [con] High development costs make autonomous vehicles expensive for most consumers.
arg(con6).  % [con] Autonomous vehicles may encourage urban sprawl by making long commutes easier.
arg(con7).  % [con] Reliance on AI could erode human driving skills over time.
arg(con8).  % [con] Data collection by autonomous cars raises serious privacy concerns.
arg(con9).  % [con] Current sensor technology may fail to detect rare edge‑case scenarios.
arg(con10).  % [con] Autonomous vehicles could exacerbate socioeconomic inequality by limiting access to those who can afford them.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con1, pro1).  % [undermining] conf=85 — Con argument cites cybersecurity vulnerabilities that could cause accidents, challenging the safety premise of pro1.
att(con3, pro1).  % [undermining] conf=85 — The weather‑performance issue challenges the premise that autonomous vehicles can safely reduce accidents
att(con9, pro1).  % [undermining] conf=80 — Potential sensor failures undermine the premise that autonomous vehicles will lower accident rates
att(con1, pro2).  % [undermining] conf=80 — Cybersecurity vulnerabilities could prevent the reliable vehicle‑spacing optimization that underlies the capacity claim.
att(con3, pro2).  % [undermining] conf=85 — Poor performance in unpredictable weather could disrupt the precise spacing needed for increased capacity.
att(con5, pro2).  % [undermining] conf=70 — High development costs challenge the premise that many autonomous cars will be deployed to increase capacity
att(con9, pro2).  % [undermining] conf=75 — Potential sensor failures undermine the premise that autonomous cars can safely optimize spacing
att(con1, pro3).  % [undermining] conf=80 — Con1 challenges the safety premise needed for AVs to reliably provide mobility to non‑drivers.
att(con3, pro3).  % [undermining] conf=85 — Con3 questions the ability of AVs to operate safely, undermining the premise that they can reliably serve non‑drivers.
att(con4, pro3).  % [undermining] conf=70 — Con4 raises liability issues that could deter adoption, weakening the premise that AVs will provide mobility.
att(con5, pro3).  % [undermining] conf=80 — Con5 points out high costs, undermining the premise that AVs will be accessible to those who cannot drive.
att(con9, pro3).  % [undermining] conf=70 — The claim that sensor failures could occur challenges the premise that autonomous vehicles reliably provide mobility for non‑drivers.
att(con10, pro3).  % [undermining] conf=75 — The inequality argument questions the premise that autonomous vehicles will broadly increase mobility for those who cannot drive.
att(con1, pro5).  % [undermining] conf=85 — Con1 questions the safety premise underlying Pro5, suggesting cybersecurity risks could prevent passengers from freely using travel time
att(con2, pro5).  % [undermining] conf=70 — Con2 challenges the societal premise that autonomous vehicles will be accepted enough for passengers to rely on them for work or leisure
att(con3, pro5).  % [undermining] conf=80 — Con3 attacks the reliability premise of Pro5 by highlighting weather‑related safety limitations
att(con4, pro5).  % [undermining] conf=75 — Con4 undermines the trust premise of Pro5 by pointing out complex liability issues that could deter use
att(con5, pro5).  % [undermining] conf=65 — Con5 challenges the economic premise that autonomous vehicles will be widely accessible for passengers to benefit from productive travel time
att(con9, pro5).  % [undermining] conf=70 — The claim that sensors may miss edge cases attacks the safety premise that enables passengers to work during travel.
att(con10, pro5).  % [undermining] conf=65 — The inequality argument challenges the premise that autonomous vehicles will be widely accessible for all passengers.
att(con1, pro6).  % [undermining] conf=75 — Cybersecurity vulnerabilities challenge the premise that reducing private cars via fleets is an unqualified benefit.
att(con3, pro6).  % [undermining] conf=85 — The claim that autonomous systems struggle in bad weather attacks the premise that fleets will be reliable enough to reduce private car ownership
att(con4, pro6).  % [undermining] conf=80 — Complex liability after accidents challenges the feasibility premise underlying the reduction‑of‑cars argument
att(con5, pro6).  % [undermining] conf=80 — High development costs undermine the premise that autonomous fleets will be affordable enough to replace private cars
att(con6, pro6).  % [undercutting] conf=75 — Even if fleets cut private car numbers, they may encourage urban sprawl, showing the conclusion does not guarantee the intended benefit
att(con7, pro6).  % [undermining] conf=70 — Potential erosion of human driving skills attacks the societal‑benefit premise of the private‑car‑reduction claim
att(con8, pro6).  % [undermining] conf=75 — Privacy concerns undermine the acceptance premise needed for autonomous fleets to reduce private car ownership
att(con9, pro6).  % [undermining] conf=80 — Sensor failures in edge cases challenge the safety premise that makes fleet adoption—and thus car‑number reduction—plausible
att(con10, pro6).  % [undermining] conf=80 — Socio‑economic inequality concerns attack the premise that fleet benefits will be broadly accessible, weakening the reduction claim
att(con1, pro7).  % [undermining] conf=90 — Cybersecurity vulnerabilities threaten the safe integration of self‑driving cars with smart‑city systems.
att(con3, pro7).  % [undermining] conf=85 — Unreliable performance in bad weather challenges the premise that integration will reliably smooth traffic.
att(con4, pro7).  % [undermining] conf=80 — Complex liability issues could impede deployment of integrated autonomous systems.
att(con5, pro7).  % [undermining] conf=75 — High development costs may limit widespread adoption needed for traffic‑flow benefits.
att(con6, pro7).  % [undercutting] conf=70 — Even if integration works, induced urban sprawl could generate additional traffic, negating the claimed smoothing effect.
att(con7, pro7).  % [undermining] conf=70 — Erosion of human driving skills raises doubts about the reliability of a system that depends on human oversight.
att(con8, pro7).  % [undermining] conf=80 — Privacy concerns over data sharing can block the cooperation needed for smart‑city integration.
att(con9, pro7).  % [undermining] conf=70 — Con9’s claim that sensors may miss rare edge‑cases challenges the premise that integration with smart‑city infrastructure will reliably smooth traffic flow.
att(con1, pro8).  % [undermining] conf=75 — Con1’s cybersecurity vulnerability claim attacks the premise that autonomous vehicles can operate continuously without interruption.
att(con3, pro8).  % [undermining] conf=80 — Con3’s assertion that AVs struggle in unpredictable weather undermines the premise of uninterrupted, fatigue‑free operation.
att(con1, pro9).  % [undermining] conf=70 — The cybersecurity vulnerability claim challenges the premise that self‑driving tech will be widely adopted to boost EV uptake.
att(con3, pro9).  % [undermining] conf=70 — Weather‑related safety issues question the premise that self‑driving tech can reliably drive more EVs.
att(con5, pro9).  % [undermining] conf=75 — High development costs challenge the premise that self‑driving technology will be affordable enough to spur EV adoption.
att(con1, pro10).  % [undermining] conf=80 — The cybersecurity vulnerability claim attacks the premise that data collection will be beneficial for planning.
att(con3, pro10).  % [undermining] conf=70 — Weather‑related operational limits challenge the premise that sufficient data will be gathered for planning.
att(con8, pro10).  % [undermining] conf=90 — Con8 challenges the premise that data collection is beneficial by raising privacy concerns.
att(con9, pro10).  % [undermining] conf=80 — Con9 questions the reliability of the data by pointing to sensor failures, undermining the pro's premise.
att(con9, con2).  % [undermining] conf=70 — B's claim that sensor technology may fail challenges the premise that autonomous cars will be widely deployed, which A relies on to argue about massive driver job losses.
att(con5, con6).  % [undermining] conf=70 — High development costs may limit adoption, weakening the premise that AVs will make long commutes easier.
att(con9, con6).  % [undermining] conf=70 — If sensor technology cannot handle edge‑case scenarios, AVs may not become common enough to influence commuting patterns.
att(con10, con6).  % [undermining] conf=70 — Limited access to AVs for only affluent users challenges the premise that they will broadly enable longer commutes.