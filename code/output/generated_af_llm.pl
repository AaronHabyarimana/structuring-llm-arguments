% Automatisch generiert — Thema: Autonomous Vehicles
% arg/1 Fakten
arg(pro1).  % [pro] Autonomous vehicles reduce traffic accidents caused by human error.
arg(pro2).  % [pro] Self-driving cars increase road capacity by optimizing vehicle spacing.
arg(pro3).  % [pro] Autonomous vehicles provide mobility for people who cannot drive themselves.
arg(pro4).  % [pro] Self-driving technology lowers fuel consumption through more efficient driving patterns.
arg(pro5).  % [pro] Autonomous vehicles enable productive use of travel time for passengers.
arg(pro6).  % [pro] Driverless cars can reduce emissions when combined with electric powertrains.
arg(pro7).  % [pro] Autonomous fleets lower transportation costs through shared usage models.
arg(pro8).  % [pro] Self-driving systems can adapt routes in real time to avoid congestion.
arg(pro9).  % [pro] Autonomous vehicles collect data that improve urban planning decisions.
arg(pro10).  % [pro] Driverless technology accelerates innovation in sensor and artificial‑intelligence fields.
arg(con1).  % [con] Autonomous vehicles raise significant cybersecurity risks.
arg(con2).  % [con] Self-driving cars can lead to massive job losses for professional drivers.
arg(con3).  % [con] Autonomous systems may struggle with unpredictable human behavior on the road.
arg(con4).  % [con] The high cost of sensor suites makes driverless cars unaffordable for many users.
arg(con5).  % [con] Liability determination becomes complex after accidents involving autonomous vehicles.
arg(con6).  % [con] Autonomous vehicles may increase urban sprawl by making long commutes easier.
arg(con7).  % [con] Overreliance on AI could erode human driving skills over time.
arg(con8).  % [con] Data collection by autonomous cars raises privacy concerns for occupants and pedestrians.
arg(con9).  % [con] Current regulations are insufficient to ensure the safe deployment of driverless cars.
arg(con10).  % [con] Autonomous vehicles can cause traffic bottlenecks when mixed with human‑driven traffic.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(con1, pro1).  % [undermining] conf=80 — con1 points to cybersecurity risks that could cause accidents, challenging the safety premise of pro1.
att(con3, pro1).  % [undermining] conf=85 — The claim that autonomous systems may struggle with unpredictable human behavior attacks the premise that AVs can reliably reduce accidents.
att(con4, pro1).  % [undermining] conf=70 — High sensor costs undermine the premise that widespread deployment will occur, which is needed for accident reduction.
att(con9, pro1).  % [undermining] conf=80 — Insufficient regulations undermine the premise that autonomous vehicles can be safely deployed to achieve accident reductions.
att(con1, pro2).  % [undermining] conf=80 — The cybersecurity risk claim challenges the reliability premise needed for capacity gains.
att(con3, pro2).  % [undermining] conf=75 — The difficulty with unpredictable human behavior undermines the premise that autonomous cars can safely optimize spacing.
att(con6, pro2).  % [undercutting] conf=70 — Increased urban sprawl could offset any capacity gains from optimized spacing
att(con10, pro2).  % [rebuttal] conf=90 — B asserts bottlenecks that contradict A’s claim of increased capacity
att(con1, pro3).  % [undermining] conf=70 — The cybersecurity risk claim challenges the safety premise needed for providing reliable mobility to non‑drivers.
att(con3, pro3).  % [undermining] conf=65 — The difficulty with unpredictable human behavior questions the premise that autonomous vehicles can safely serve non‑drivers.
att(con4, pro3).  % [undermining] conf=70 — High sensor costs undermine the premise that autonomous vehicles will be affordable enough to provide mobility for those who cannot drive.
att(con9, pro3).  % [undermining] conf=65 — The claim that regulations are insufficient challenges the implicit premise that autonomous vehicles can be safely deployed to provide mobility.
att(con1, pro5).  % [undermining] conf=85 — Cybersecurity risks challenge the reliability premise needed for productive travel time
att(con3, pro5).  % [undermining] conf=80 — Difficulty handling unpredictable human behavior undermines the safety/reliability premise behind productive use
att(con4, pro5).  % [undermining] conf=75 — High sensor costs question the premise that many users will have access to autonomous vehicles for productive travel
att(con5, pro5).  % [undermining] conf=70 — Complex liability issues weaken the assumption of safe, dependable operation needed for productive use
att(con9, pro5).  % [undermining] conf=70 — Insufficient regulations challenge the safety premise needed for passengers to reliably use travel time productively.
att(con10, pro5).  % [undermining] conf=65 — Potential traffic bottlenecks undermine the assumption that autonomous travel will be smooth enough for productive activities.
att(con1, pro6).  % [undermining] conf=75 — Cybersecurity risks call into question the feasibility of safely deploying driverless electric vehicles, undermining the emission‑reduction premise.
att(con3, pro6).  % [undermining] conf=70 — Questioning autonomous systems' ability to handle human behavior undermines the premise that they will be effective enough to cut emissions.
att(con4, pro6).  % [undermining] conf=75 — High sensor costs challenge the premise that driverless cars will be widely adopted to achieve emission reductions.
att(con9, pro6).  % [undermining] conf=70 — Regulatory insufficiency undermines the premise that driverless cars will be deployed at scale to cut emissions.
att(con10, pro6).  % [undermining] conf=70 — Possible traffic bottlenecks with mixed traffic could negate the emissions‑reduction benefit.
att(con1, pro7).  % [undermining] conf=85 — Con1 highlights cybersecurity costs that could offset the cost savings claimed by pro7.
att(con3, pro7).  % [undermining] conf=70 — Con3 questions the reliability of autonomous systems, challenging the premise that fleets can efficiently lower costs.
att(con4, pro7).  % [undermining] conf=90 — Con4 points out high sensor costs that directly contradict the premise of reduced transportation expenses.
att(con5, pro7).  % [undermining] conf=80 — Complex liability issues could increase operational costs, undermining pro7’s cost‑reduction premise.
att(con9, pro7).  % [undermining] conf=70 — Con9 claims regulations are insufficient, undermining the premise that autonomous fleets can be safely deployed to lower costs.
att(con1, pro8).  % [undermining] conf=75 — Con1’s cybersecurity risk claim attacks the premise that self‑driving systems can reliably adapt routes in real time.
att(con3, pro8).  % [undermining] conf=70 — Con3 challenges the ability of autonomous systems to handle unpredictable human behavior, undermining the premise of effective real‑time routing.
att(pro8, con10).  % [rebuttal] conf=85 — A claims self‑driving cars reduce congestion, while B claims they can create bottlenecks, making the conclusions mutually exclusive.
att(con1, pro9).  % [undermining] conf=75 — The cybersecurity risk claim attacks the premise that data collected by AVs can be safely used for urban planning.
att(con8, pro9).  % [undermining] conf=80 — Con8 challenges the premise that data collection is unproblematic by raising privacy concerns, undermining pro9's claim.
att(con3, con2).  % [undermining] conf=70 — con3 questions autonomous feasibility, undermining the premise that driverless cars will cause massive job loss
att(con4, con2).  % [undermining] conf=80 — high sensor costs limit adoption, undermining the premise of widespread job losses
att(con10, con6).  % [undermining] conf=70 — If autonomous vehicles cause bottlenecks, they may not make long commutes easier, undermining the premise of the sprawl argument.
att(con4, con6).  % [undermining] conf=65 — If driverless cars are unaffordable, widespread adoption needed to increase urban sprawl is unlikely, attacking the premise of con6.
att(pro2, con10).  % [rebuttal] conf=90 — [symmetric rebuttal] B asserts bottlenecks that contradict A’s claim of increased capacity
att(con10, pro8).  % [rebuttal] conf=85 — [symmetric rebuttal] A claims self‑driving cars reduce congestion, while B claims they can create bottlenecks, making the conclusions mutually exclusive.