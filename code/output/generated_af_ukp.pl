% Automatisch generiert — Thema: nuclear energy
% arg/1 Fakten
arg(pro74).  % [pro] The last to close, in 2013, ran with much reduced emissions, well under 1 % of total US CFC emissions.
arg(pro5).  % [pro] Hydro and liquefied gas are the greatest killers, even before coal.
arg(pro5b).  % [pro] Environmentalists do not care that hydro and liquefied gas are the greatest killers.
arg(pro55a).  % [pro] Any reactor licensable in the West has a substantial containment structure.
arg(pro55b).  % [pro] Most reactors licensable in the West have a very robust pressure vessel.
arg(pro55c).  % [pro] Most reactors licensable in the West have internal structures.
arg(pro62).  % [pro] Renewables may be used as much as possible.
arg(pro62b).  % [pro] Intrinsic limitations of diffuse, intermittent sources mean that wind and solar can never economically replace coal, gas, and nuclear power for large-scale, continuous, reliable supply.
arg(pro2).  % [pro] Some Soviet-designed and built reactors have been a safety concern for many years
arg(pro2b).  % [pro] Some Soviet-designed and built reactors are much better now than in 1986
arg(pro27).  % [pro] The latest generation of nuclear reactor designs are much less likely to meltdown.
arg(pro60).  % [pro] Nuclear energy is a clean source of energy.
arg(pro60b).  % [pro] Nuclear energy would be cost effective.
arg(con126).  % [con] Renewable energy sources should be used instead.
arg(con72).  % [con] The legacy of environmental contamination and health costs for miners and mines has been catastrophic.
arg(con168).  % [con] Radiation is not easily dealt with, especially in nuclear waste and maintenance materials.
arg(con168b).  % [con] Expensive solutions are needed to contain, control, and shield both people and the environment from radiation's harm.
arg(con42).  % [con] Uranium, the nuclear fuel used to produce nuclear energy, is limited.
arg(con42b).  % [con] Uranium cannot be produced again and again on demand.
arg(con9).  % [con] Nuclear power plants could be preferred targets for terrorist attacks.
arg(con9b).  % [con] Nuclear waste could be preferred targets for terrorist attacks.
arg(con134).  % [con] Used nuclear fuel cannot be simply taken to a landfill.
arg(con134b).  % [con] Used nuclear fuel is radioactive and dangerous.
arg(con84).  % [con] There is no safe level of radiation exposure.

% att/2 Fakten  (Dung 1995 — binär; Typ/conf aus LLM-Kandidaten als Kommentar)
att(pro5, con126).  % [rebuttal] conf=75 — Pro5 claims hydro and liquefied gas are the biggest killers, contradicting con126’s call to prefer renewables over nuclear.
att(pro5, con72).  % [rebuttal] conf=75 — Pro5 asserts other sources are deadlier than coal, rebutting con72’s emphasis on mining’s catastrophic legacy.
att(con126, pro74).  % [rebuttal] conf=95 — Claims renewables should replace nuclear, directly contradicting the implication that nuclear’s low emissions justify its use.
att(con72, pro74).  % [undermining] conf=70 — Points to catastrophic mining impacts, undermining the premise that nuclear is overall environmentally benign.
att(con168, pro74).  % [undermining] conf=80 — Highlights difficulty of handling radiation, attacking the premise of nuclear’s safety.
att(con168b, pro74).  % [undermining] conf=80 — Emphasizes costly radiation containment, undermining the claim of nuclear’s overall benefit.
att(con42, pro74).  % [undermining] conf=75 — States uranium is limited, challenging the premise that nuclear can sustain low‑emission energy supply.
att(con42b, pro74).  % [undermining] conf=75 — Claims uranium cannot be produced on demand, undermining long‑term viability of nuclear.
att(con9, pro74).  % [undermining] conf=70 — Points to terrorist target risk, attacking the safety premise of nuclear plants.
att(con9b, pro74).  % [undermining] conf=70 — Highlights waste as terrorist target, undermining nuclear’s safety premise.
att(con134, pro74).  % [undermining] conf=80 — Notes that used fuel cannot be landfilled, challenging the premise of manageable waste.
att(con134b, pro74).  % [undermining] conf=80 — Emphasizes radioactivity and danger of spent fuel, undermining the claim of nuclear’s cleanliness.
att(con84, pro74).  % [undermining] conf=85 — Asserts no safe radiation level, attacking the premise that nuclear emissions are harmless.
att(con126, pro55a).  % [rebuttal] conf=70 — Con126 argues renewables should replace nuclear, contradicting the implied safety/acceptability of nuclear in pro55a
att(con168, pro55a).  % [undermining] conf=70 — Con168 points out difficulties in handling radiation, undermining the safety assurance of containment structures
att(con168b, pro55a).  % [undermining] conf=70 — Con168b stresses costly radiation control measures, weakening the safety premise of pro55a
att(con9, pro55a).  % [undermining] conf=75 — Con9 suggests nuclear plants are terrorist targets, challenging the safety implied by containment structures
att(con9b, pro55a).  % [undermining] conf=75 — Con9b claims nuclear waste could be terrorist targets, undermining the safety premise of pro55a
att(con134, pro55a).  % [undermining] conf=80 — Con134 states used fuel cannot be landfilled, weakening the safety claim of containment
att(con134b, pro55a).  % [undermining] conf=80 — Con134b emphasizes the radioactivity of spent fuel, attacking the safety premise of pro55a
att(con84, pro55a).  % [undermining] conf=80 — Con84 asserts no safe radiation level, directly challenging the safety assurance of containment
att(pro55b, con126).  % [undermining] conf=80 — The claim of a robust pressure vessel challenges the premise that nuclear plants are unsafe, weakening the argument for renewables.
att(pro55b, con9).  % [undermining] conf=55 — A strong pressure vessel reduces the vulnerability of plants to terrorist attacks, weakening that premise.
att(pro55c, con126).  % [undermining] conf=80 — Internal structures suggest safety, challenging the premise that nuclear should be replaced by renewables.
att(pro2, pro62b).  % [undermining] conf=80 — Safety concerns about Soviet reactors undermine the premise that nuclear can reliably replace renewables
att(con126, pro62b).  % [rebuttal] conf=85 — Saying renewables should be used instead directly contradicts the claim that they cannot replace nuclear
att(con72, pro62b).  % [undermining] conf=80 — Environmental damage from mining undermines the premise that nuclear is a viable alternative
att(con168, pro62b).  % [undermining] conf=80 — Difficulty handling radiation undermines the premise that nuclear can replace renewables
att(con168b, pro62b).  % [undermining] conf=80 — High cost of radiation containment undermines nuclear’s viability as a replacement
att(con42, pro62b).  % [undermining] conf=80 — Limited uranium supply attacks the premise that nuclear can reliably replace renewables
att(con42b, pro62b).  % [undermining] conf=80 — Inability to produce uranium on demand undermines nuclear’s reliability premise
att(con9, pro62b).  % [undermining] conf=75 — Terrorist target risk attacks the safety premise of nuclear as a replacement
att(con9b, pro62b).  % [undermining] conf=75 — Nuclear waste as terrorist target attacks the security premise of nuclear replacement
att(con134, pro62b).  % [undermining] conf=80 — Inability to landfill used fuel undermines feasibility of nuclear as a replacement
att(con134b, pro62b).  % [undermining] conf=80 — Radioactive danger of spent fuel undermines the premise that nuclear can safely replace renewables
att(pro2, pro60).  % [undermining] conf=70 — Safety concerns challenge the claim that nuclear energy is clean
att(pro2, pro60b).  % [undermining] conf=65 — Safety concerns imply higher hidden costs, weakening cost‑effectiveness claim
att(con168, pro2).  % [undermining] conf=75 — Radiation‑waste difficulty undermines the premise that safety concerns are limited to reactor design
att(con168b, pro2).  % [undermining] conf=75 — High cost of radiation containment challenges the notion that safety issues are only historical
att(con9, pro2).  % [undermining] conf=70 — Terrorist‑target risk adds a new safety dimension, weakening the original safety‑concern premise
att(con9b, pro2).  % [undermining] conf=70 — Risk to nuclear waste expands the safety critique beyond reactor design
att(con84, pro2).  % [undermining] conf=80 — Claim of no safe radiation level undermines the premise that safety concerns are limited to certain reactors
att(con168, pro2b).  % [undermining] conf=75 — Radiation‑waste difficulty challenges the claim that newer reactors are safer
att(con168b, pro2b).  % [undermining] conf=75 — High containment costs question the safety improvement claim
att(con9, pro2b).  % [undermining] conf=70 — Terrorist‑target risk adds a safety concern beyond reactor design
att(con9b, pro2b).  % [undermining] conf=70 — Risk to waste expands the safety critique
att(con84, pro2b).  % [undermining] conf=80 — No safe radiation level undermines the premise that safety concerns are limited to older designs
att(con9b, pro60b).  % [undermining] conf=85 — B claims nuclear waste is a terrorist target, raising security costs that weaken the cost‑effectiveness premise of A
att(con134, pro60b).  % [undermining] conf=80 — B states used fuel cannot be landfilled, implying extra disposal expenses that undercut A's cost‑effectiveness claim
att(con134b, pro60b).  % [undermining] conf=80 — B highlights the radioactivity and danger of spent fuel, introducing safety and remediation costs that challenge A's cost claim
att(con84, pro60b).  % [undermining] conf=75 — B argues no safe radiation level exists, suggesting health‑related costs that weaken A's cost‑effectiveness argument
att(con126, pro27).  % [rebuttal] conf=90 — The claim that renewables should be used instead directly opposes the implication that newer reactors are safe enough to adopt.
att(con72, pro27).  % [undermining] conf=85 — Highlighting past environmental contamination attacks the safety premise of newer reactor designs.
att(con168, pro27).  % [undermining] conf=80 — Stating that radiation is hard to manage challenges the premise that newer reactors are safer.
att(con168b, pro27).  % [undermining] conf=75 — Emphasising costly radiation‑control measures undermines the claim of improved safety.
att(con9, pro27).  % [undermining] conf=80 — Terrorist‑target risk questions the overall safety advantage of newer reactors.
att(con9b, pro27).  % [undermining] conf=80 — Risk of attacks on nuclear waste undermines the safety premise of newer designs.
att(con134, pro27).  % [undermining] conf=75 — Inability to landfill used fuel challenges the claim of reduced meltdowns risk.
att(con134b, pro27).  % [undermining] conf=80 — Radioactive, dangerous spent fuel contradicts the notion of safer new reactors.
att(con84, pro27).  % [rebuttal] conf=85 — Stating no safe radiation level directly refutes the claim that newer reactors are much less likely to melt down.
att(con126, pro60).  % [rebuttal] conf=90 — Advocating renewables opposes the conclusion that nuclear energy is a clean source worth using.
att(con72, pro60).  % [undermining] conf=85 — Citing catastrophic mining impacts attacks the premise that nuclear energy is clean.
att(con168, pro60).  % [undermining] conf=80 — Difficulty handling radiation undermines the claim of nuclear energy’s cleanliness.
att(con168b, pro60).  % [undermining] conf=75 — Expensive radiation‑control solutions challenge the notion of a clean energy source.
att(con134b, pro60).  % [undermining] conf=70 — Radioactive, dangerous spent fuel questions the cleanliness of nuclear power.
att(con84, pro60).  % [rebuttal] conf=85 — Claiming no safe radiation level directly contradicts the assertion that nuclear energy is clean.
att(con126, pro60b).  % [rebuttal] conf=80 — Suggesting renewables should be used instead opposes the claim that nuclear is cost‑effective.
att(con72, pro60b).  % [undermining] conf=75 — Highlighting catastrophic mining impacts undermines the cost‑effectiveness argument.
att(con168, pro60b).  % [undermining] conf=75 — Radiation handling difficulties imply hidden costs, challenging cost‑effectiveness.
att(con168b, pro60b).  % [rebuttal] conf=90 — Stating that expensive solutions are needed directly contradicts the claim of cost‑effectiveness.
att(con42, pro60b).  % [undermining] conf=70 — Limited uranium supply threatens long‑term cost‑effectiveness.
att(con42b, pro60b).  % [undermining] conf=70 — Inability to produce uranium on demand undermines the cost‑effectiveness claim.
att(con9, pro60b).  % [undermining] conf=70 — Potential terrorist attacks raise security costs, weakening the cost‑effectiveness argument.
att(con84, con168b).  % [undercutting] conf=70 — Stating there is no safe radiation level challenges the conclusion that expensive shielding solutions are sufficient.