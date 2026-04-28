
% prolog.pl  —  Dung Abstract Argumentation Framework
% Semantiken: conflict-free, admissible, complete,
%             grounded, preferred, stable
%
% Basis: Cerutti et al., "Foundations of Implementations
%        for Formal Argumentation" (2014)

:- use_module(library(lists)).
:- [generated_af].  % automatisch generierte Argumente und Angriffe

% HILFSFUNKTIONEN ----------------------------------------------

%% alle Argumente als Liste
all_args(Args) :-
    findall(X, arg(X), Args).

%% attacks(+Set, +Arg): irgendein Element von Set greift Arg an
attacks(Set, X) :-
    member(A, Set),
    att(A, X).

%% defended(+Arg, +Set): jeder Angreifer von Arg wird von Set angegriffen
defended(X, Set) :-
    forall(att(A, X), attacks(Set, A)).


% CONFLICT-FREE ----------------------------------------------
% Ein Set S ist conflict-free wenn für kein Paar a,b ∈ S gilt att(a,b)

conflict_free([]).
conflict_free(Set) :-
    Set \= [],
    \+ (member(A, Set), member(B, Set), att(A, B)).


%  4. ADMISSIBLE ----------------------------------------------
%  S ist admissible wenn:
%   (a) conflict-free
%   (b) jedes Argument in S ist von S verteidigt


admissible(Set) :-
    conflict_free(Set),
    forall(member(X, Set), defended(X, Set)).

%  5. COMPLETE ----------------------------------------------
%  S ist complete wenn:
%   (a) admissible
%   (b) alle von S verteidigten Argumente sind auch in S

complete(Set) :-
    admissible(Set),
    all_args(All),
    \+ (member(X, All), defended(X, Set), \+ member(X, Set)).


%  6. GROUNDED EXTENSION ----------------------------------------------
%  Kleinste complete Extension — iterativer Fixpunkt der
%  charakteristischen Funktion F_AF

%% char_fn(+In, -Out): ein Schritt der charakteristischen Funktion
char_fn(In, Out) :-
    all_args(All),
    findall(X, ( member(X, All), defended(X, In) ), Out).

%% grounded_extension(-Ext): berechnet Fixpunkt ab leerer Menge
grounded_extension(Ext) :-
    fixpoint([], Ext).

fixpoint(Current, Result) :-
    char_fn(Current, Next),
    sort(Current, SC),
    sort(Next, SN),
    (
        SC == SN ->  Result = SC;
        fixpoint(SN, Result)
    ).


%  7. STABLE EXTENSIONS ----------------------------------------------
%  S ist stable wenn:
%   (a) conflict-free
%   (b) S greift jedes Argument außerhalb von S an

stable(Set) :-
    conflict_free(Set),
    all_args(All),
    forall(
        (member(X, All), \+ member(X, Set)), attacks(Set, X)
    ).

%  8. PREFERRED EXTENSIONS ----------------------------------------------
%  Maximale admissible Mengen (bzgl. Inklusion)
%  Naive Enumeration via Powerset — für kleine AFs ausreichend

preferred(Set) :-
    admissible(Set),
    msort(Set, SSet),
    \+ ( admissible(Bigger),
         msort(Bigger, SBigger),
         subset(SSet, SBigger),
         SSet \== SBigger ).

%% subset/2: prüft ob jedes Element von A auch in B ist
subset([], _).
subset([H|T], B) :- member(H, B), subset(T, B).


%  9. POWERSET-HILFSPRÄDIKAT (für Enumeration)

powerset([], [[]]).
powerset([H|T], PS) :-
    powerset(T, PS1),
    findall(S, ( member(S0, PS1), (S = S0 ; S = [H|S0]) ), PS).


%  10. ABFRAGE-HELFER  (für interaktive Tests) -------------------------------

%% Alle admissible Sets ausgeben
show_admissible :-
    all_args(All),
    powerset(All, PS),
    write('=== Admissible Sets ==='), nl,
    forall((member(S, PS), sort(S, SS), admissible(SS)),
            (write(SS), nl)).

%% Alle complete Extensions ausgeben
show_complete :-
    all_args(All),
    powerset(All, PS),
    write('=== Complete Extensions ==='), nl,
    forall((member(S, PS), sort(S, SS), complete(SS)),
            (write(SS), nl)).

%% Grounded Extension ausgeben
show_grounded :-
    grounded_extension(E),
    write('=== Grounded Extension ==='), nl,
    write(E), nl.

%% Alle stable Extensions ausgeben
show_stable :-
    all_args(All),
    powerset(All, PS),
    write('=== Stable Extensions ==='), nl,
    forall((member(S, PS), sort(S, SS), stable(SS)),
            (write(SS), nl)).

%% Alle preferred Extensions ausgeben
show_preferred :-
    all_args(All),
    powerset(All, PS),
    write('=== Preferred Extensions ==='), nl,
    forall( ( member(S, PS), sort(S, SS), preferred(SS) ),
            ( write(SS), nl ) ).

%% Alles auf einmal
show_all :-

    show_admissible, nl,
    show_complete,   nl,
    show_grounded,   nl,
    show_stable,     nl,
    show_preferred.
