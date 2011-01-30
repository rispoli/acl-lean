:- ['../latexify.pl'].

:- [test_defLIS2010].
:- [test_fossacs11].

?- latexify('A' says '\\alpha' -> 'B' says ('A' says '\\alpha'), 'examples/v01.tex').
?- latexify('A' says '\\alpha' -> 'A' says '\\alpha', 'examples/v02.tex').
?- latexify((('A' says '\\varphi' -> '\\varphi') and ('A' says ('B' says '\\varphi' -> '\\varphi')) and ('B' says '\\varphi')) -> '\\varphi', 'examples/v03.tex').
?- latexify((('A' says '\\varphi' -> '\\varphi') and ('A' says '\\varphi')) -> '\\varphi', 'examples/v04.tex').
?- latexify((('A' says (('B' says '\\varphi') -> '\\varphi')) and ('B' says '\\varphi')) -> ('A' says '\\varphi'), 'examples/v05.tex').
?- latexify((('A' says ('\\alpha' -> '\\beta')) and ('A' says '\\alpha')) -> ('A' says '\\beta'), 'examples/v06.tex').
?- latexify((('A' says '\\alpha' -> '\\alpha') and ('A' says '\\alpha')) -> '\\alpha', 'examples/v07.tex').
?- latexify((('A' says ('B' says '\\alpha') -> '\\alpha') and ('A' says ('B' says '\\alpha'))) -> '\\alpha', 'examples/v08.tex').
?- latexify((((('A' and 'B') says '\\varphi') -> '\\varphi') and (('A' and 'B') says '\\varphi')) -> '\\varphi', 'examples/v09.tex').
?- latexify(('A' says '\\varphi') -> (('A' and 'B') says '\\varphi'), 'examples/v10.tex').
?- latexify((((a_1 says suu_1) -> wpu_1) and (a_2 says suu_1)) -> ((a_1 and a_2) says wpu_1), 'examples/v11.tex').
?- latexify((('A' says ('\\alpha' -> '\\beta')) and ('B' says '\\alpha')) -> ('A' and 'B' says '\\beta'), 'examples/v12.tex').
?- latexify((('A' says '\\alpha' -> '\\beta') and ('A' says '\\alpha')) -> ('A' says '\\beta'), 'examples/v13.tex').
?- latexify(((('A' says '\\alpha') -> '\\beta') and ('A' says '\\alpha')) -> '\\beta', 'examples/v14.tex').

?- latexify(((('A' says '\\alpha') -> '\\beta') and ('A' says '\\alpha')) -> '\\beta', 'examples/distributivity.implication.tex').
?- latexify((('A' says (('B' says '\\alpha') -> '\\alpha')) and (('A' says '\\alpha') -> '\\alpha') and ('B' says '\\alpha')) -> '\\alpha', 'examples/controls.axiom.tex').
?- latexify((('A' says ('\\alpha' -> '\\beta')) and ('B' says '\\alpha')) -> (('A' and 'B') says '\\beta'), 'examples/boolean.principals.tex').

% Axioms for Intuitionistic Logic: http://en.wikipedia.org/wiki/Intuitionistic_logic
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
