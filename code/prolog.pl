
% prolog.pl  —  Dung Abstract Argumentation Framework
% Semantiken: conflict-free, admissible, complete,
%             grounded, preferred, stable
%
% Basis: Cerutti et al., "Foundations of Implementations
%        for Formal Argumentation" (2014)

:- use_module(library(lists)).
:- ( current_prolog_flag(af_source, F) -> true ; F = generated_af_ukp ),
   consult(F).

% CACHE -------------------------------------------------------
% all_args und preferred_extension werden einmalig berechnet
% und per assert gespeichert, um wiederholte findall-Aufrufe zu vermeiden.

:- dynamic cached_args/1, preferred_cache/1.

:- findall(X, arg(X), Xs), assertz(cached_args(Xs)).

% HILFSFUNKTIONEN ----------------------------------------------

all_args(Args) :- cached_args(Args).

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
    findall(X, (member(X, All), defended(X, In)), Out).

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

subset([], _).
subset([H|T], Set) :-
    member(H, Set),
    subset(T, Set).

%  8. PREFERRED EXTENSIONS ----------------------------------------------
%  Maximale admissible Mengen (bzgl. Inklusion)
%  Naive Enumeration via Powerset — für kleine AFs ausreichend

preferred_extension(E) :-
    ( preferred_cache(Prefs) -> true ; compute_preferred(Prefs) ),
    member(E, Prefs).

compute_preferred(Prefs) :-
    all_args(All),
    findall(SS,
        (cf_subsets(All, S), sort(S, SS), admissible(SS)),
        Adm),
    sort(Adm, AdmS),
    findall(E,
        (member(E, AdmS),
         \+ (member(B, AdmS), subset(E, B), E \== B)),
        Prefs),
    assertz(preferred_cache(Prefs)).

%  9. CONFLICT-FREE SUBSET GENERATOR

cf_subsets([], []).
cf_subsets([_|T], S) :-
    cf_subsets(T, S).
cf_subsets([H|T], [H|S]) :-
    cf_subsets(T, S),
    \+ (member(X, S), (att(H, X) ; att(X, H))).



%  10. ABFRAGE-HELFER -------------------------------

%% Alle admissible Sets ausgeben
show_admissible :-
    all_args(All),
    forall(
        (cf_subsets(All, S), sort(S, SS), admissible(SS)),
        (write(SS), nl)
    ).
    

%% Alle complete Extensions ausgeben
show_complete :-
    all_args(All),
    write('=== Complete Extensions ==='), nl,
    forall(
        (cf_subsets(All, S), sort(S, SS), complete(SS)),
        (write(SS), nl)
    ).

%% Grounded Extension ausgeben
show_grounded :-
    grounded_extension(E),
    write('=== Grounded Extension ==='), nl,
    write(E), nl.

%% Alle stable Extensions ausgeben
show_stable :-
    all_args(All),
    write('=== Stable Extensions ==='), nl,
    forall(
        (cf_subsets(All, S), sort(S, SS), stable(SS)),
        (write(SS), nl)
    ).

show_preferred :-
    write('=== Preferred Extensions ==='), nl,
    forall(preferred_extension(E), (write(E), nl)).


%% Ausgabe über SWI-prolog
show_all :-
    show_complete,   nl,
    show_grounded,   nl,
    show_stable,     nl,
    show_preferred,  nl.


%  11. JSON-AUSGABE (für af_tool.py) 

write_json_list([]) :- write('[]').
write_json_list([H|T]) :-
    write('['),
    format('"~w"', [H]),
    forall(member(X, T), format(',"~w"', [X])),
    write(']').

write_json_lists([]) :- write('[]').
write_json_lists([H|T]) :-
    write('['),
    write_json_list(H),
    forall(member(X, T), (write(','), write_json_list(X))),
    write(']').

%% Nur Grounded — für große AFs (preferred/stable zu teuer)
show_json_grounded :-
    grounded_extension(G),
    write('{"grounded":'),
    write_json_list(G),
    write(',"preferred":null,"stable":null}'), nl.

%% Vollständig: grounded + preferred + stable
show_json_full :-
    grounded_extension(G),
    findall(E, preferred_extension(E), Prefs),
    all_args(All),
    findall(S, (cf_subsets(All, Sx), sort(Sx, S), stable(S)), Stabs),
    write('{"grounded":'),
    write_json_list(G),
    write(',"preferred":'),
    write_json_lists(Prefs),
    write(',"stable":'),
    write_json_lists(Stabs),
    write('}'), nl.