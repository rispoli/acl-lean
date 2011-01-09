:- ['../inference_rules_axioms'].

op_to_c(~, 'not').
op_to_c(and, 'and').
op_to_c(or, 'or').
op_to_c(says, 'says').
op_to_c(->, 'implies').
op_to_c(:, 'colon').
op_to_c(>=, 'geq').

to_c__(Px, X, Declarations, Commands, [Dec | Declarations], [Com | Commands]) :-
    atom(X), !,
    format(atom(Dec), 'PlTerm ~w', Px),
    format(atom(Com), '~w = Pl_Mk_String("~w")', [Px, X]).

to_c__(Px, X, Declarations, Commands, Decs, Coms) :-
    to_c_(Px, [X], [], [], D, C, [], _),
    append(D, Declarations, Decs),
    append(C, Commands, Coms).

to_c_(_, [], Declarations, Commands, Declarations, Commands, L, L) :- !.

to_c_(Pa_Re, [transition(X, B, Y) | T], Declarations, Commands, Declarations_T, Commands_T, Li, Li_T) :-
    !, (atom(Pa_Re) -> Pa = Pa_Re; gensym(plterm_, Pa)),
    format(atom(Da), 'PlTerm ~w', Pa),
    gensym(plterm_, Paa),
    format(atom(Daa), 'PlTerm ~w[3]', Paa),
    gensym(plterm_, Px),
    to_c__(Px, X, [Daa, Da | Declarations], Commands, Declarations_X, Commands_X),
    gensym(plterm_, Pb),
    to_c__(Pb, B, Declarations_X, Commands_X, Declarations_B, Commands_B),
    gensym(plterm_, Py),
    to_c__(Py, Y, Declarations_B, Commands_B, Declarations_Y, Commands_Y),
    format(atom(Caax), '~w[0] = ~w', [Paa, Px]),
    format(atom(Caab), '~w[1] = ~w', [Paa, Pb]),
    format(atom(Caay), '~w[2] = ~w', [Paa, Py]),
    format(atom(Ca), '~w = Pl_Mk_Compound(transition, 3, ~w)', [Pa, Paa]),
    to_c_(_, T, Declarations_Y, [Ca, Caay, Caab, Caax | Commands_Y], Declarations_T, Commands_T, [Pa | Li], Li_T).

to_c_(Pa_Re, [H | T], Declarations, Commands, Declarations_T, Commands_T, Li, Li_T) :-
    H =.. [F | [L, R]],
    (atom(Pa_Re) -> Pa = Pa_Re; gensym(plterm_, Pa)),
    format(atom(Da), 'PlTerm ~w', Pa),
    gensym(plterm_, Paa),
    format(atom(Daa), 'PlTerm ~w[2]', Paa),
    gensym(plterm_, Pl),
    to_c__(Pl, L, [Daa, Da | Declarations], Commands, Declarations_L, Commands_L),
    gensym(plterm_, Pr),
    to_c__(Pr, R, Declarations_L, Commands_L, Declarations_R, Commands_R),
    op_to_c(F, Fc),
    format(atom(Caal), '~w[0] = ~w', [Paa, Pl]),
    format(atom(Caar), '~w[1] = ~w', [Paa, Pr]),
    format(atom(Ca), '~w = Pl_Mk_Compound(~w, 2, ~w)', [Pa, Fc, Paa]),
    to_c_(_, T, Declarations_R, [Ca, Caar, Caal | Commands_R], Declarations_T, Commands_T, [Pa | Li], Li_T).

to_array(0, _, [], []) :- !.

to_array(Nd, X, [H | T], [O | O_T]) :-
    N is Nd - 1,
    format(atom(O), '~w[~w] = ~w', [X, N, H]),
    to_array(N, X, T, O_T).

get_dec_com(N, [], Declarations, Commands, Declarations, [O | Commands]) :-
    !, format(atom(O), 'arg[~w] = Pl_Mk_Proper_List(0, NULL)', N).

get_dec_com(N, L, Declarations, Commands, [Dl | Declarations_L], [Al | Commands_]) :-
    to_c_(_, L, Declarations, Commands, Declarations_L, Commands_L, [], L_l),
    length(L_l, L_l_l),
    gensym(plterm_, Pl),
    format(atom(Dl), 'PlTerm ~w[~w]', [Pl, L_l_l]),
    to_array(L_l_l, Pl, L_l, L_l_a),
    append(L_l_a, Commands_L, Commands_),
    format(atom(Al), 'arg[~w] = Pl_Mk_Proper_List(~w, ~w)', [N, L_l_l, Pl]).

format_to(P, X, O) :-
    format(atom(O), P, X).

to_c((Γ, Δ, Tr_Γ, Tr_Δ, Pre_ord)) :-
    findall(X, op_to_c(_, X), BX),
    maplist(format_to('int ~w'), BX, Declarations_I_R),
    reverse(Declarations_I_R, Declarations_I),
    findall([X, Y], op_to_c(Y, X), BXY),
    maplist(format_to('~w = Pl_Find_Atom("~w")'), BXY, Commands_I_R),
    reverse(Commands_I_R, Commands_I),
    get_dec_com(0, Γ, Declarations_I, Commands_I, Declarations_Γ, Commands_Γ),
    get_dec_com(1, Δ, Declarations_Γ, Commands_Γ, Declarations_Δ, Commands_Δ),
    get_dec_com(2, Tr_Γ, Declarations_Δ, Commands_Δ, Declarations_Tr_Γ, Commands_Tr_Γ),
    get_dec_com(3, Tr_Δ, Declarations_Tr_Γ, Commands_Tr_Γ, Declarations_Tr_Δ, Commands_Tr_Δ),
    get_dec_com(4, Pre_ord, Declarations_Tr_Δ, Commands_Tr_Δ, Declarations_Pre_ord, Commands_Pre_ord),
    reverse(Declarations_Pre_ord, Declarations),
    reverse(Commands_Pre_ord, Commands),
    maplist(format('~w;~n'), Declarations),
    maplist(format('~w;~n'), Commands).
