:- include('gnu_prolog/ginference_rules_axioms').

op_to_c(~, 'not').
op_to_c(and, 'and').
op_to_c(or, 'or').
op_to_c(says, 'says').
op_to_c(->, 'implies').
op_to_c(:, 'colon').
op_to_c(>=, 'geq').

to_c__(Px, X, Declarations, Commands, [Dec | Declarations], [Com | Commands]) :-
    atom(X), !,
    format_to('PlTerm ~w', [Px], Dec),
    format_to('~w = Pl_Mk_String("~w")', [Px, X], Com).

to_c__(Px, X, Declarations, Commands, Decs, Coms) :-
    to_c_(Px, X, [], [], D, C, [], _),
    append(D, Declarations, Decs),
    append(C, Commands, Coms).

to_c_(Pa_Re, X, Declarations, Commands, Declarations_R, [Ca, Caar, Caal | Commands_R], Li, [Pa | Li]) :-
    X =.. [F | [L, R]],
    (atom(Pa_Re) -> Pa = Pa_Re; gensym(plterm_, Pa)),
    format_to('PlTerm ~w', [Pa], Da),
    gensym(plterm_, Paa),
    format_to('PlTerm ~w[2]', [Paa], Daa),
    gensym(plterm_, Pl),
    to_c__(Pl, L, [Daa, Da | Declarations], Commands, Declarations_L, Commands_L),
    gensym(plterm_, Pr),
    to_c__(Pr, R, Declarations_L, Commands_L, Declarations_R, Commands_R),
    op_to_c(F, Fc),
    format_to('~w[0] = ~w', [Paa, Pl], Caal),
    format_to('~w[1] = ~w', [Paa, Pr], Caar),
    format_to('~w = Pl_Mk_Compound(~w, 2, ~w)', [Pa, Fc, Paa], Ca).

get_dec_com(N, L, Declarations, Commands, Declarations_L, [Al | Commands_L]) :-
    to_c_(_, L, Declarations, Commands, Declarations_L, Commands_L, [], [L_l]),
    format_to('arg[~w] = ~w', [N, L_l], Al).

format_to(P, X, [O]) :-
	open_output_atom_stream(S),
    format(S, P, X),
	close_output_atom_stream(S, O).

maplist(_, [], []).

maplist(Goal, [H | T], [GH | GT]) :-
    call(Goal, H, GH),
    maplist(Goal, T, GT).

maplist(_, []).

maplist(Goal, [H | T]) :-
    call(Goal, H),
    maplist(Goal, T).

to_c(F) :-
    findall([X], op_to_c(_, X), BX),
    maplist(format_to('int ~w'), BX, Declarations_I_R),
    reverse(Declarations_I_R, Declarations_I),
    findall([X, Y], op_to_c(Y, X), BXY),
    maplist(format_to('~w = Pl_Find_Atom("~w")'), BXY, Commands_I_R),
    reverse(Commands_I_R, Commands_I),
    get_dec_com(0, F, Declarations_I, Commands_I, Declarations_F, Commands_F),
    reverse(Declarations_F, Declarations),
    reverse(Commands_F, Commands),
    maplist(format('~w;~n'), Declarations),
    maplist(format('~w;~n'), Commands).
