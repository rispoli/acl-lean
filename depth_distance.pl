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

depth(~ T, D) :-
    !, depth(T, DT),
    D is DT + 1.

depth(T, 1) :-
    atom(T), !.

depth(T, D) :-
    T =.. [F, L, R],
    depth(L, DL),
    depth(R, DR),
    (member(F, [says, ->]) -> D is max(DL, DR) + 1; D is max(DL, DR)).

distance([], _, _, _) :-
    !, fail.

distance(L, U, X, 1) :-
    member(X >= U, L).

distance(L, U, X, D) :-
    select(X >= Y, L, L_),
    X \= Y,
    distance(L_, U, Y, D_),
    D is D_ + 1.

max_distance(L, U, X, D) :-
    findall(D_, distance(L, U, X, D_), Ds),
    max_list(Ds, D).
