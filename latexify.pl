:- [deduction_tree].
:- [op_pri].

stringConcat([], Output, Output).

stringConcat([Head|Tail], TempString, Output) :-
    string_concat(TempString, Head, TempString1),
    stringConcat(Tail, TempString1, Output).

join(List, Separator, Output) :-
    innerJoin(List, Separator, '', Output), !.

innerJoin([], _, _, '').

innerJoin([Last], _, TempString, Output) :-
    string_concat(TempString, Last, Output).

innerJoin([Head | Tail], Separator, TempString, Output) :-
    stringConcat([Head, Separator], TempString, TempString1),
    innerJoin(Tail, Separator, TempString1, Output).

functor2string(and, ' \\land ').
functor2string(or, ' \\lor ').
functor2string(says, ' \\mbox{ {\\bf says} } ').
functor2string(->, ' \\rightarrow ').
functor2string(:, ' : ').
functor2string(>=, ' \\geq ').

parentheses(Parent_functor, Functor) :-
    op_pri(X, Parent_functor),
    op_pri(Y, Functor), !,
    X \= Y.

proposition2string(_, ~A, String) :-
    proposition2string(_, A, A_s),
    string_concat('\\lnot ', A_s, String), !.

proposition2string(_, A, A) :-
    atom(A), !.

proposition2string(_, transition(Before, Over, After), String) :-
    proposition2string(_, Before, B),
    proposition2string(_, Over, O),
    proposition2string(_, After, A),
    stringConcat([B, ' \\stackrel{', O, '}{\\longrightarrow} ', A], '', String), !.

proposition2string(Parent_functor, B_op, String) :-
    B_op =.. [Functor | Arguments],
    maplist(proposition2string(Functor), Arguments, [A_s, B_s]),
    functor2string(Functor, Functor_s),
    (Parent_functor \= :, parentheses(Parent_functor, Functor) ->
        stringConcat(['(', A_s, Functor_s, B_s, ')'], '', String), !;
        stringConcat([A_s, Functor_s, B_s], '', String)).

print_sequent(Indentation, entails(Γ, Δ)) :-
    maplist(proposition2string(_), Γ, Γ_s),
    maplist(proposition2string(_), Δ, Δ_s),
    join(Γ_s, ', ', Γ_s_j),
    join(Δ_s, ', ', Δ_s_j),
    stringConcat([Indentation, Γ_s_j, ' \\Rightarrow ', Δ_s_j, '~n'], '', Sequent_s),
    format(Sequent_s).

print_tree(Indentation, ([S, []], '')) :-
    string_concat(Indentation, '\t', Deeper_indentation),
    print_sequent(Deeper_indentation, S).

print_tree(Indentation, ([Conclusion, Premises], Rule)) :-
    format('~w\\prooftree~n', Indentation),
    string_concat(Indentation, '\t', Deeper_indentation),
    ((Premises \= []) ->
        maplist(print_tree(Deeper_indentation), Premises);
        format('')
    ),
    format('~w\\justifies~n', Indentation),
    print_sequent(Deeper_indentation, Conclusion),
    format('~w\\using~n', Indentation),
    stringConcat(['(', Rule, ')~n'], '', Rule_n),
    format(Deeper_indentation), format(Rule_n),
    format('~w\\endprooftree~n', Indentation).

latexify(Formula, Filename) :-
    tell(Filename),
    format('\\documentclass{article}~n\\pagestyle{empty}~n\\usepackage{prooftree}~n\\begin{document}~n~n\\begin{displaymath}~n'),
    reset_gensym,
    search_nodes(Formula, [], Sequent),
    print_tree('', Sequent),
    format('\\end{displaymath}~n~n\\end{document}'),
    told.
