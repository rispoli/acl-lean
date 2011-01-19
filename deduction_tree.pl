:- [inference_rules_axioms].

expand_premises([], _, []).

expand_premises([H | T], Used, [T1 | T2]) :-
    search_nodes(H, Used, T1),
    expand_premises(T, Used, T2).

expand((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    member(X, Γ),
    inference_rule_atm(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Used, Premises_tree).

expand(F, Used, ([F, Premises_tree], Rule)) :-
    inference_rule_EQ(F, Premises, Rule),
    expand_premises(Premises, Used, Premises_tree).

expand((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    member(X, Tr_Γ),
    inference_rule_tr_Γ(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Used, Premises_tree).

expand(F, Used, ([F, Premises_tree], Rule)) :-
    inference_rule(F, Premises, Rule), !,
    expand_premises(Premises, Used, Premises_tree).

expand_l((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    member(X, Γ),
    inference_rule_l(X, (Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Used, Used_, Premises, Rule), (member(Rule, ['\\lnot L', '\\lor L', '\\land L']) -> !; true),
    expand_premises(Premises, Used_, Premises_tree).

expand_l(F, Used, T) :-
    expand(F, Used, T).

expand_r((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Used, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), Premises_tree], Rule)) :-
    select(X, Δ, Δ_minus_X),
    inference_rule_r(X, (Γ, Δ_minus_X, Tr_Γ, Tr_Δ, Pre_ord), Premises, Rule), !,
    expand_premises(Premises, Used, Premises_tree).

expand_r(F, Used, T) :-
    expand_l(F, Used, T).

search_nodes((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), _, ([(Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord), []], Rule)) :-
    axiom(Γ, Δ, Rule), !.

search_nodes(F, Used, T) :-
    expand_r(F, Used, T).
