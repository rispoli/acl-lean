intersection([], _, []) :- !.

intersection([H | T], L, [H | R]) :-
    memberchk(H, L), !,
    intersection(T, L, R).

intersection([_ | T], L, R) :-
    intersection(T, L, R).

filter(_, [], []) :- !.

filter(P, [H | T], [H | R]) :-
    call(P, H), !,
    filter(P, T, R).

filter(P, [_ | T], R) :-
    filter(P, T, R).

% http://www.david-reitter.com/compling/prolog/compat_gnu.pl

flag(Sym, Old, NewExp) :-
    g_read(Sym, Old),
	nonvar(NewExp) ->
		New is NewExp,
		g_assign(Sym, New)
		;
		g_read(Sym, New).

gensym(Base, Atom) :-
	atom_concat('gs_', Base, Key),
	flag(Key, N, N+1),
	number_atom(N, NA),
	atom_concat(Base, NA, Atom), !.
