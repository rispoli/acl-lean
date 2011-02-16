/*

   Copyright 2010 Daniele Rispoli, Valerio Genovese

   This file is part of ACL-Lean.

   ACL-Lean is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   ACL-Lean is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with ACL-Lean. If not, see <http://www.gnu.org/licenses/>.

*/

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
