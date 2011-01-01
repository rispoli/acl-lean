:- op(400, fy, ~),
   op(500, yfx, and),
   op(600, yfx, or),
   op(650, xfy, says),
   op(700, xfy, ->),
   op(800, xfx, :),
   op(700, xfx, >=).

labelled_atm(_ : P) :-
    atom(P).

axiom(Γ, _, 'AX_\\bot') :-
    member(_ : '\\bot', Γ).

axiom(Γ, Δ, 'AX') :-
    list_to_set(Γ, G), list_to_set(Δ, D),
    intersection(G, D, I),
    include(labelled_atm, I, I_l_a),
    I_l_a \= [].

% ¬: right
inference_rule_r(X : ~Alpha, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : Alpha | Γ], Δ, Tr_Γ, Tr_Δ, [Y >= X | Pre_ord])], '\\lnot R') :-
    gensym(y_, Y).

% ∧: right
inference_rule_r(X : Alpha and Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Y : Alpha | Δ], Tr_Γ, Tr_Δ, [Y >= X | Pre_ord]), (Γ, [Y : Beta | Δ], Tr_Γ, Tr_Δ, [Y >= X | Pre_ord])], '\\land R') :-
    gensym(y_, Y).

% ∨: right
inference_rule_r(X: Alpha or Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Y : Alpha, Y : Beta | Δ], Tr_Γ, Tr_Δ, [Y >= X | Pre_ord])], '\\lor R') :-
    gensym(y_, Y).

% says: right
inference_rule_r(X : A says Alpha, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Z : Alpha | Δ], [transition(Y, A, Z) | Tr_Γ], Tr_Δ, [Y >= X | Pre_ord])], '\\mbox{{\\bf says} } R') :-
    gensym(y_, Y),
    gensym(z_, Z).

% →: right
inference_rule_r(X : Alpha -> Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : Alpha | Γ], [Y : Beta | Δ], Tr_Γ, Tr_Δ, [Y >= X | Pre_ord])], '\\rightarrow R') :-
    gensym(y_, Y).

% ¬: left
inference_rule_l(X : ~Alpha, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Y : Alpha | Δ], Tr_Γ, Tr_Δ, Pre_ord)], '\\lnot L') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    \+member(Y : Alpha, Δ).

% ∧: left
inference_rule_l(X : Alpha and Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : Alpha, Y : Beta | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], '\\land L') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    \+member(Y : Alpha, Γ),
    \+member(Y : Beta, Γ).

% ∨: left
inference_rule_l(X : Alpha or Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : Alpha | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord), ([Y : Beta | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], '\\lor L') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    \+member(Y : Alpha, Γ),
    \+member(Y : Beta, Γ).

% says: left
inference_rule_l(X : A says Alpha, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([], [], [transition(Y, A_, Z)], [transition(Y, A, Z)], []), ([Z : Alpha | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], '\\mbox{{\\bf says} } L') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    member(transition(Y, A_, Z), Tr_Γ),
    \+member(Z : Alpha, Γ).

% →: left
inference_rule_l(X : Alpha -> Beta, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Y : Alpha | Δ], Tr_Γ, Tr_Δ, Pre_ord), ([Y : Beta | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], '\\rightarrow L') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    \+member(Y : Beta, Γ),
    \+member(Y : Alpha, Δ).

% ATM
inference_rule_atm(X : P, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : P | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], 'ATM') :-
    (
        member(Y >= X, Pre_ord);
        X = Y
    ),
    atom(P),
    \+member(Y : P, Γ).

% MON
inference_rule_tr_Γ(transition(X, A and B, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, [transition(X, A, Y), transition(X, B, Y) | Tr_Γ], Tr_Δ, Pre_ord)], 'MON') :-
    \+member(transition(X, A, Y), Tr_Γ),
    \+member(transition(X, B, Y), Tr_Γ).

% CA
inference_rule_tr_Γ(transition(X, A or B, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, [transition(X, A, Y) | Tr_Γ], Tr_Δ, Pre_ord), (Γ, Δ, [transition(X, B, Y) | Tr_Γ], Tr_Δ, Pre_ord)], 'CA') :-
    \+member(transition(X, A, Y), Tr_Γ),
    \+member(transition(X, B, Y), Tr_Γ).

% EQ:
inference_rule_tr_Γ(transition(X, A, Y), (_, _, _, Tr_Δ, _), [([u : A], [u : B], [], [], []), ([u : B], [u : A], [], [], [])], 'EQ') :-
    member(transition(X, B, Y), Tr_Δ).

% Unit
inference_rule_tr_Γ(transition(X, _, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, Tr_Γ, Tr_Δ, [Y >= X | Pre_ord])], 'Unit') :-
    \+member(Y >= X, Pre_ord).

% ID
inference_rule_tr_Γ(transition(_, A, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [([Y : A | Γ], Δ, Tr_Γ, Tr_Δ, Pre_ord)], 'ID') :-
    \+member(Y : A, Γ).

% CA - conv
inference_rule_tr_Γ(transition(X, A, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, [transition(X, A or B, Y) | Tr_Γ], Tr_Δ, Pre_ord)], 'CA - conv') :-
    member(A or B says _, Γ),
    \+member(transition(X, A or B, Y), Tr_Γ).

% DT
inference_rule_tr_Γ(transition(X, A, Y), (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, [Y : B | Δ], Tr_Γ, Tr_Δ, Pre_ord), (Γ, Δ, [transition(X, A and B, Y) | Tr_Γ], Tr_Δ, Pre_ord)], 'DT') :-
    member(A and B says _, Γ),
    \+member(transition(X, A and B, Y), Tr_Γ),
    \+member(Y : B, Δ).

% C
inference_rule((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, [transition(Z, A, Z) | Tr_Γ], Tr_Δ, Pre_ord)], 'C') :-
    (
        member(Z >= Y, Pre_ord);
        Y = Z
    ),
    member(transition(_, A, Y), Tr_Γ),
    \+member(transition(Z, A, Z), Tr_Γ).

% Trans
inference_rule((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [(Γ, Δ, Tr_Γ, Tr_Δ, [Z >= X | Pre_ord])], 'Trans') :-
    member(Z >= Y, Pre_ord),
    member(Y >= X, Pre_ord),
    \+member(Z >= X, Pre_ord).
