:- use_module(library(lists)).

% Automatisch generiert — Thema: Nuclear energy
% arg/1 Fakten
arg(con1).  % [con] Despite what the nuclear industry tells us , building enough nuclear power stati
arg(pro1).  % [pro] In all countries using nuclear energy there are well established procedures for 
arg(pro2).  % [pro] Some Soviet designed and built reactors have been a safety concern for many year
arg(con2).  % [con] The process of mining and refining uranium has n’t been a clean process .
arg(con3).  % [con] It is pretty expensive to mine , refine and transport uranium .
arg(pro3).  % [pro] Although it is not expected to be ready for 50-100 years it holds the most promi
arg(con4).  % [con] In addition , the same know-how used to design nuclear power plants can to a cer
arg(con5).  % [con] Energy conservation is seven times more cost-effective than nuclear power .
arg(con6).  % [con] While the casualties were not as high as with the Chernobyl accident , the envir
arg(pro4).  % [pro] They have to varying degrees either changed their public stance , or conceded th
arg(pro5).  % [pro] Hydro and liquefied gas are the greatest killers , even before coal , but do env
arg(con7).  % [con] Abandoned mines from the Cold War era continue to pose contamination problems in
arg(pro6).  % [pro] Nuclear power is once again considered a prominent alternative , despite the dis
arg(pro7).  % [pro] It is broadly accessible , there is a lot in storage , and it is believed that t
arg(con8).  % [con] Like Chernobyl had 50 deaths .
arg(con9).  % [con] Nuclear power plants as well as nuclear waste could be preferred targets for ter
arg(pro8).  % [pro] Nuclear energy is a practical solution to many of the problems posed by fossil f
arg(con10).  % [con] Today , nuclear energy is used to make weapons .
arg(pro9).  % [pro] It ’s a valuable area of research that could guarantee abundant clean energy , s
arg(pro10).  % [pro] Also , directly mining Uranium is not the only source we can use .

% att/2 Fakten  (Angriff-Relationen nach Dung 1995)
att(pro1, con1).
att(pro2, con1).
att(con2, pro8).
att(con3, pro8).
att(con6, pro2).
att(con8, pro2).
att(con9, pro8).
att(con9, pro7).
att(con5, pro4).
att(con1, pro1).
att(con1, pro6).
att(con5, pro9).
att(con3, pro10).

% Lade Semantiken aus prolog.pl:
% :- [prolog].
% ?- show_all.
