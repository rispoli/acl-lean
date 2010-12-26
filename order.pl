:- [qsort].

order(l, L, L_o) :-
	qsort(order_l, L, L_o), !.

order(r, L, L_o) :-
    qsort(order_r, L, L_o), !.

%left
order_l(_, _ or _).
order_l(_, _ says _).
order_l(_, _ -> _).
order_l(_ >= _, _ : _).
order_l(_ or _, _) :- !, fail.
order_l(_ says _, _) :- !, fail.
order_l(_ -> _, _) :- !, fail.
order_l(_ : _, _ >= _) :- !, fail.
order_l(A >= B, C >= D) :- C @> A, D @> B, !, fail.
order_l(A >= B, C >= D) :- C @=< A; D @=< B.
order_l(A, B) :- A @=< B.

%right
order_r(_, _ and _).
order_r(_ >= _, _ : _).
order_r(_ and _, _) :- !, fail.
order_r(_ : _, _ >= _) :- !, fail.
order_r(A >= B, C >= D) :- C @> A, D @> B, !, fail.
order_r(A >= B, C >= D) :- C @=< A; D @=< B.
order_r(A, B) :- A @=< B.
