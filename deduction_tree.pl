:- [inference_rules_axioms].
:- [depth_distance].

expand_premises([], _, _, []).

expand_premises([H | T], Depth, Used, [T1 | T2]) :-
    search_nodes(H, Depth, Used, T1),
    expand_premises(T, Depth, Used, T2).

expand((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Depth, Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    member(X, Γ),
    inference_rule_atm(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Depth, Used, Premises_tree).

expand((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Depth, Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    member(X, Tr_Γ),
    inference_rule_tr_Γ(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Depth, Used, Premises_tree).

expand(F, Depth, Used, ([F, Premises_tree], Rule)) :-
    inference_rule(F, Premises, Rule), !,
    expand_premises(Premises, Depth, Used, Premises_tree).

expand_l((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Depth, Used, O) :-
    member(X, Γ),
    inference_rule_l(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Depth, Used, Used_, Premises_, Rule),
    (member(Rule, ['\\lnot L', '\\lor L', '\\land L']) ->
        (Premises = Premises_, !, O = ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule));
        ((Rule = '\\mbox{{\\bf says} } L') ->
            (Premises_ = [L, R], Premises = [R], O = ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), [L | Premises_tree]], Rule));
            (Premises = Premises_, O = ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)))),
    expand_premises(Premises, Depth, Used_, Premises_tree).

expand_l(F, Depth, Used, T) :-
    expand(F, Depth, Used, T).

expand_r((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Depth, Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    select(X, Δ, Δ_minus_X),
    inference_rule_r(X, (Γ, Δ_minus_X, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Depth, Used, Premises_tree).

expand_r(F, Depth, Used, T) :-
    expand_l(F, Depth, Used, T).

search_nodes((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), _, _, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), []], Rule)) :-
    axiom(Γ, Δ, Rule), !.

search_nodes(F, Depth, Used, T) :-
    expand_r(F, Depth, Used, T).

prove(F, T) :-
    depth(F, D),
    reset_gensym,
    search_nodes(([], [u : F], [], [], []), D, [], T).

prove(F) :-
    prove(F, _).
