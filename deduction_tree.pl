:- [inference_rules_axioms].
:- [order].

expand_premises([], []).

expand_premises([H | T], [T1 | T2]) :-
    search_nodes(H, T1),
    expand_premises(T, T2).

expand_r(Γ, Δ, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Δ, Δ_minus_X),
    inference_rule_r(entails(Γ, [Δ_minus_X, X]), Premises, Rule), !,
    expand_premises(Premises, Premises_tree).

expand_r(Γ, Δ, ([entails(Γ, Δ), []], '')) :- !.

expand_l(Γ, Δ, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Γ, Γ_minus_X),
    inference_rule_l(entails([Γ_minus_X, X], Δ), Premises, Rule), !,
    expand_premises(Premises, Premises_tree).

expand_l(Γ, Δ, T) :-
    order(r, Δ, Δ_o),
    expand_r(Γ, Δ_o, T).

search_nodes(entails(Γ, Δ), ([entails(Γ_o, Δ_o), []], Rule)) :-
    axiom(Γ, Δ, Rule), !,
    order(l, Γ, Γ_o),
    order(r, Δ, Δ_o).

search_nodes(entails(Γ, Δ), T) :-
    order(l, Γ, Γ_o),
    expand_l(Γ_o, Δ, T).
