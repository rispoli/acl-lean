partition(_, _, [], [], []).

partition(F, Pivot, [H | T], [H | Leq], Gt) :-
    P =.. [F | [H, Pivot]], P, !,
    partition(F, Pivot, T, Leq, Gt).

partition(F, Pivot, [H | T], Leq, [H | Gt]) :-
    partition(F, Pivot, T, Leq, Gt).

qsort(_, [], []).

qsort(F, [H | T], OL) :-
    partition(F, H, T, Leq, Gt),
    qsort(F, Leq, OLeq),
    qsort(F, Gt, OGt),
    append(OLeq, [H | OGt], OL).

qsort(L, OL) :-
    qsort(@=<, L, OL).
