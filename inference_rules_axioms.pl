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
inference_rule_r(entails(Γ, [Δ, X : ~Alpha]), [entails([Y >= X, Y : Alpha | Γ], Δ)], '\\lnot R') :-
    gensym(y_, Y).

% ∧: right
inference_rule_r(entails(Γ, [Δ, X : Alpha and Beta]), [entails([Y >= X | Γ], [Y : Alpha | Δ]), entails([Y >= X | Γ], [Y : Beta | Δ])], '\\land R') :-
    gensym(y_, Y).

% ∨: right
inference_rule_r(entails(Γ, [Δ, X: Alpha or Beta]), [entails([Y >= X | Γ], [Y : Alpha, Y : Beta | Δ])], '\\lor R') :-
    gensym(y_, Y).

% says: right
inference_rule_r(entails(Γ, [Δ, X : A says Alpha]), [entails([Y >= X, transition(Y, A, Z) | Γ], [Z : Alpha | Δ])], '\\mbox{{\\bf says} } R') :-
    gensym(y_, Y),
    gensym(z_, Z).

% →: right
inference_rule_r(entails(Γ, [Δ, X : Alpha -> Beta]), [entails([Y >= X, Y : Alpha | Γ], [Y : Beta | Δ])], '\\rightarrow R') :-
    gensym(y_, Y).

% ¬: left
inference_rule_l(entails([Γ, X : ~Alpha], Δ), [entails([X : ~Alpha | Γ], [Y : Alpha | Δ])], '\\lnot L') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    \+member(Y : Alpha, Δ).

% ∧: left
inference_rule_l(entails([Γ, X : Alpha and Beta], Δ), [entails([X : Alpha and Beta, Y : Alpha, Y : Beta | Γ], Δ)], '\\land L') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    \+member(Y : Alpha, Γ),
    \+member(Y : Beta, Γ).

% ∨: left
inference_rule_l(entails([Γ, X : Alpha or Beta], Δ), [entails([X : Alpha or Beta, Y : Alpha | Γ], Δ), entails([X : Alpha or Beta, Y : Beta | Γ], Δ)], '\\lor L') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    \+member(Y : Alpha, Γ),
    \+member(Y : Beta, Γ).

% says: left
inference_rule_l(entails([Γ, X : A says Alpha], Δ), [entails([transition(Y, A_, Z)], [transition(Y, A, Z)]), entails([X : A says Alpha, Z : Alpha | Γ], Δ)], '\\mbox{{\\bf says} } L') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    member(transition(Y, A_, Z), Γ),
    \+member(Z : Alpha, Γ).

% →: left
inference_rule_l(entails([Γ, X : Alpha -> Beta], Δ), [entails([X : Alpha -> Beta | Γ], [Y : Alpha | Δ]), entails([X : Alpha -> Beta, Y : Beta | Γ], Δ)], '\\rightarrow L') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    \+member(Y : Beta, Γ),
    \+member(Y : Alpha, Δ).

% ATM
inference_rule(entails([Γ, X : P], Δ), [entails([X : P, Y : P | Γ], Δ)], 'ATM') :-
    (
        member(Y >= X, Γ), !;
        X = Y
    ),
    \+member(Y : P, [X : P | Γ]),
    atom(P).

% MON
inference_rule(entails([Γ, transition(X, A and B, Y)], Δ), [entails([transition(X, A and B, Y), transition(X, A, Y), transition(X, B, Y) | Γ], Δ)], 'MON') :-
    \+member(transition(X, A, Y), Γ),
    \+member(transition(X, B, Y), Γ).

% CA
inference_rule(entails([Γ, transition(X, A or B, Y)], Δ), [entails([transition(X, A or B, Y), transition(X, A, Y) | Γ], Δ), entails([transition(X, A or B, Y), transition(X, B, Y) | Γ], Δ)], 'CA') :-
    \+member(transition(X, A, Y), Γ),
    \+member(transition(X, B, Y), Γ).

% Unit
inference_rule(entails([Γ, transition(X, A, Y)], Δ), [entails([Y >= X, transition(X, A, Y) | Γ], Δ)], 'Unit') :-
    \+member(Y >= X, Γ).

% ID
inference_rule(entails([Γ, transition(X, A, Y)], Δ), [entails([transition(X, A, Y), Y : A | Γ], Δ)], 'ID') :-
    \+member(Y : A, Γ).

% CA - conv
inference_rule(entails([Γ, transition(X, A, Y)], Δ), [entails([transition(X, A or B, Y), transition(X, A, Y) | Γ], Δ)], 'CA - conv') :-
    member(A or B says _, Γ),
    \+member(transition(X, A or B, Y), Γ).

% DT
inference_rule(entails([Γ, transition(X, A, Y)], Δ), [entails([transition(X, A, Y) | Γ], [Y : B | Δ]), entails([transition(X, A, Y), transition(X, A and B, Y) | Γ], Δ)], 'DT') :-
    member(A and B says _, Γ),
    \+member(transition(X, A and B, Y), Γ),
    \+member(Y : B, Δ).

% EQ:
inference_rule(entails([_, transition(X, A, Y)], Δ), [entails([u : A], [u : B]), entails([u : B], [u : A])], 'EQ') :-
    member(transition(X, B, Y), Δ).

% Trans
inference_rule(entails([Γ, E], Δ), [entails([Z >= X, E | Γ], Δ)], 'Trans') :-
    member(Z >= Y, [E | Γ]),
    member(Y >= X, [E | Γ]),
    \+member(Z >= X, [E | Γ]).

% C
inference_rule(entails([Γ, E], Δ), [entails([transition(Z, A, Z), E | Γ], Δ)], 'C') :-
    (
        member(Z >= Y, [E | Γ]), !;
        Y = Z
    ),
    member(transition(_, A, Y), [E | Γ]),
    \+member(transition(Z, A, Z), [E | Γ]).

% VD
inference_rule(entails([Γ, E], Δ), [entails([transition(X, A, Z), E | Γ], Δ)], 'VD') :-
    member(Y >= X, [E | Γ]),
    member(transition(Y, A, Z), [E | Γ]).
