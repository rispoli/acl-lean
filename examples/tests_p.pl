:- ['../deduction_tree.pl'].

:- [test_defLIS2010_p].
:- [test_fossacs11_p].

?- prove('A' says '\\alpha' -> 'B' says ('A' says '\\alpha')).
?- prove('A' says '\\alpha' -> 'A' says '\\alpha').
?- prove((('A' says '\\varphi' -> '\\varphi') and ('A' says ('B' says '\\varphi' -> '\\varphi')) and ('B' says '\\varphi')) -> '\\varphi').
?- prove((('A' says '\\varphi' -> '\\varphi') and ('A' says '\\varphi')) -> '\\varphi').
?- prove((('A' says (('B' says '\\varphi') -> '\\varphi')) and ('B' says '\\varphi')) -> ('A' says '\\varphi')).
?- prove((('A' says ('\\alpha' -> '\\beta')) and ('A' says '\\alpha')) -> ('A' says '\\beta')).
?- prove((('A' says '\\alpha' -> '\\alpha') and ('A' says '\\alpha')) -> '\\alpha').
?- prove((('A' says ('B' says '\\alpha') -> '\\alpha') and ('A' says ('B' says '\\alpha'))) -> '\\alpha').
?- prove((((('A' and 'B') says '\\varphi') -> '\\varphi') and (('A' and 'B') says '\\varphi')) -> '\\varphi').
?- prove(('A' says '\\varphi') -> (('A' and 'B') says '\\varphi')).
?- prove((((a_1 says suu_1) -> wpu_1) and (a_2 says suu_1)) -> ((a_1 and a_2) says wpu_1)).
?- prove((('A' says ('\\alpha' -> '\\beta')) and ('B' says '\\alpha')) -> ('A' and 'B' says '\\beta')).
?- prove((('A' says '\\alpha' -> '\\beta') and ('A' says '\\alpha')) -> ('A' says '\\beta')).
?- prove(((('A' says '\\alpha') -> '\\beta') and ('A' says '\\alpha')) -> '\\beta').

?- prove(((('A' says '\\alpha') -> '\\beta') and ('A' says '\\alpha')) -> '\\beta').
?- prove((('A' says (('B' says '\\alpha') -> '\\alpha')) and (('A' says '\\alpha') -> '\\alpha') and ('B' says '\\alpha')) -> '\\alpha').
?- prove((('A' says ('\\alpha' -> '\\beta')) and ('B' says '\\alpha')) -> (('A' and 'B') says '\\beta')).

% Axioms for Intuitionistic Logic: http://en.wikipedia.org/wiki/Intuitionistic_logic
?- prove('\\bot' -> '\\varphi').
?- prove(('\\varphi' -> '\\psi') -> (('\\chi' -> '\\psi') -> (('\\varphi' or '\\psi') -> '\\psi'))).
?- prove('\\chi' -> ('\\varphi' or '\\chi')).
?- prove('\\varphi' -> ('\\varphi' or '\\chi')).
?- prove('\\varphi' -> ('\\chi' -> ('\\varphi' and '\\chi'))).
?- prove(('\\varphi' and '\\chi') -> '\\chi').
?- prove(('\\varphi' and '\\chi') -> '\\varphi').
?- prove(('\\varphi' -> ('\\chi' -> '\\psi')) -> (('\\varphi' -> '\\chi') -> ('\\varphi' -> '\\psi'))).
?- prove('\\varphi' -> ('\\chi' -> '\\varphi')).
?- prove(('A' says '\\varphi') and ('B' says '\\varphi') -> (('A' or 'B') says '\\varphi')).
?- prove(((('A' or 'B') says '\\varphi')) -> 'A' says '\\varphi').
?- prove('A' says '\\varphi' -> (('A' and 'B') says '\\varphi')).
?- prove((('A' and 'B') says '\\varphi') -> ('A' says ('B' -> '\\varphi'))).
?- prove('A' says 'A').
?- prove('\\varphi' -> ('A' says '\\varphi')).
?- prove('A' says (('A' says '\\varphi') -> '\\varphi')).
