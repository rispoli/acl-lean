:- [inference_rules_axioms].
:- [order].

expand_premises([], _, []).

expand_premises([H | T], Used, [T1 | T2]) :-
    search_nodes(H, Used, T1),
    expand_premises(T, Used, T2).

expand(Γ, Δ, Used, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Γ, Γ_minus_X),
    \+member(X, Used),
    inference_rule(entails([Γ_minus_X, X], Δ), Premises, Rule),
    expand_premises(Premises, [X | Used], Premises_tree).

expand(Γ, Δ, Used, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Γ, Γ_minus_X),
    inference_rule(entails([Γ_minus_X, X], Δ), Premises, Used, Used_after, Rule),
    expand_premises(Premises, Used_after, Premises_tree).

expand(Γ, Δ, _, ([entails(Γ, Δ), []], '')).

expand_l(Γ, Δ, Used, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Γ, Γ_minus_X),
    \+member(X, Used),
    inference_rule_l(entails([Γ_minus_X, X], Δ), Premises, Rule),
    expand_premises(Premises, [X | Used], Premises_tree).

expand_l(Γ, Δ, Used, T) :-
    order(l, Γ, Γ_o),
    expand(Γ_o, Δ, Used, T).

expand_r(Γ, Δ, Used, ([entails(Γ, Δ), Premises_tree], Rule)) :-
    select(X, Δ, Δ_minus_X),
    inference_rule_r(entails(Γ, [Δ_minus_X, X]), Premises, Rule),
    expand_premises(Premises, Used, Premises_tree).

expand_r(Γ, Δ, Used, T) :-
    order(l, Γ, Γ_o),
    expand_l(Γ_o, Δ, Used, T).

search_nodes(entails(Γ, Δ), _, ([entails(Γ_o, Δ_o), []], Rule)) :-
    axiom(Γ, Δ, Rule).
    order(l, Γ, Γ_o),
    order(r, Δ, Δ_o).

search_nodes(entails(Γ, Δ), Used, T) :-
    order(l, Γ, Γ_o),
    order(r, Δ, Δ_o),
    expand_r(Γ_o, Δ_o, Used, T).
