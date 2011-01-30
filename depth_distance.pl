depth(T, 1) :-
    atom(T), !.

depth(T, D) :-
    T =.. [_, L, R],
    depth(L, DL),
    depth(R, DR),
    D is max(DL, DR) + 1.

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
