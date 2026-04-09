:- use_module(library(lists)).

% Automatisch generiert — Thema: Nuclear energy
% arg/1 Fakten
arg(pro1).  % [pro] Nuclear energy provides a stable baseload that renewables cannot match.
arg(con1).  % [con] Nuclear waste remains dangerously radioactive for thousands of years.
arg(con2).  % [con] The risk of catastrophic accidents like Chernobyl or Fukushima is unacceptable.
arg(pro2).  % [pro] Modern reactor designs have made meltdowns virtually impossible.
arg(con3).  % [con] Storing nuclear waste safely for millennia is an unsolved problem.
arg(con4).  % [con] Wind and solar are now cheaper than new nuclear plants.
arg(con5).  % [con] Nuclear plants take 10-20 years to build, too fast for the climate crisis.

% att/2 Fakten  (Angriff-Relationen, Delta1-Ebene nach Wooldridge et al.)
att(con2, pro2).

% Lade Semantiken aus prolog.pl:
% :- [prolog].
% ?- show_all.
