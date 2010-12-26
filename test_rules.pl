:- [latexify].

% ∧: left
?- latexify(entails([x : '\\alpha' and '\\beta', y >= x], []), 'rules/andl.tex').

% ∧: right
?- latexify(entails([], [x : '\\alpha' and '\\beta']), 'rules/andr.tex').

% ATM
?- latexify(entails([x : 'P', y >= x], []), 'rules/atm.tex').

% AX
?- latexify(entails([x : 'P'], [x : 'P']), 'rules/ax.tex').

% AX_\\bot
?- latexify(entails([x : '\\bot'], []), 'rules/ax_bot.tex').

% C
?- latexify(entails([z >= y, transition(x, 'A', y)], []), 'rules/c.tex').

% CA - conv
?- latexify(entails([transition(x, 'A', y), 'A' or 'B' says '\\alpha'], []), 'rules/ca-conv.tex').

% CA
?- latexify(entails([transition(x, 'A' or 'B', y)], []), 'rules/ca.tex').

% DT
?- latexify(entails([transition(x, 'A', y), 'A' and 'B' says '\\alpha'], []), 'rules/dt.tex').

% EQ: left expansion
?- latexify(entails([transition(x, 'A', y)], [transition(x, 'B', y)]), 'rules/eql.tex').

% EQ: right expansion
?- latexify(entails([transition(x, 'A', y)], [transition(x, 'B', y)]), 'rules/eqr.tex').

% ID
?- latexify(entails([transition(x, 'A', y)], []), 'rules/id.tex').

% →: left
?- latexify(entails([x : '\\alpha' -> '\\beta', y >= x], []), 'rules/impl.tex').

% →: right
?- latexify(entails([], [x : '\\alpha' -> '\\beta']), 'rules/impr.tex').

% MON
?- latexify(entails([transition(x, 'A' and 'B', y)], []), 'rules/mon.tex').

% ¬: left
?- latexify(entails([x : ~'\\alpha', y >= x], []), 'rules/notl.tex').

% ¬: right
?- latexify(entails([], [x : ~'\\alpha']), 'rules/notr.tex').

% ∨: left
?- latexify(entails([x : '\\alpha' or '\\beta', y >= x], []), 'rules/orl.tex').

% ∨: right
?- latexify(entails([], [x : '\\alpha' or '\\beta']), 'rules/orr.tex').

% says: left
?- latexify(entails([x : 'A' says '\\alpha', y >= x, transition(y, 'A\'', z)], []), 'rules/saysl.tex').

% says: right
?- latexify(entails([], [x : 'A' says '\\alpha']), 'rules/saysr.tex').

% Trans
?- latexify(entails([z >= y, y >= x], []), 'rules/trans.tex').

% Unit
?- latexify(entails([transition(x, 'A', y)], []), 'rules/unit.tex').
