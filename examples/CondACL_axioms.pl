% Axioms for CondACL

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
