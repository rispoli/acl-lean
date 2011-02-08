% Axioms for CondACL

?- latexify('\\bot' -> '\\varphi', 'examples/false.tex').
?- latexify(('\\varphi' -> '\\psi') -> (('\\chi' -> '\\psi') -> (('\\varphi' or '\\psi') -> '\\psi')), 'examples/or.3.tex').
?- latexify('\\chi' -> ('\\varphi' or '\\chi'), 'examples/or.2.tex').
?- latexify('\\varphi' -> ('\\varphi' or '\\chi'), 'examples/or.1.tex').
?- latexify('\\varphi' -> ('\\chi' -> ('\\varphi' and '\\chi')), 'examples/and.3.tex').
?- latexify(('\\varphi' and '\\chi') -> '\\chi', 'examples/and.2.tex').
?- latexify(('\\varphi' and '\\chi') -> '\\varphi', 'examples/and.1.tex').
?- latexify(('\\varphi' -> ('\\chi' -> '\\psi')) -> (('\\varphi' -> '\\chi') -> ('\\varphi' -> '\\psi')), 'examples/then.2.tex').
?- latexify('\\varphi' -> ('\\chi' -> '\\varphi'), 'examples/then.1.tex').
?- latexify(('A' says '\\varphi') and ('B' says '\\varphi') -> (('A' or 'B') says '\\varphi'), 'examples/ca.tex').
?- latexify(((('A' or 'B') says '\\varphi')) -> 'A' says '\\varphi', 'examples/ca_conv.tex').
?- latexify('A' says '\\varphi' -> (('A' and 'B') says '\\varphi'), 'examples/mon.tex').
?- latexify((('A' and 'B') says '\\varphi') -> ('A' says ('B' -> '\\varphi')), 'examples/dt.tex').
?- latexify('A' says 'A', 'examples/id.tex').
?- latexify('\\varphi' -> ('A' says '\\varphi'), 'examples/unit.tex').
?- latexify('A' says (('A' says '\\varphi') -> '\\varphi'), 'examples/c.tex').
