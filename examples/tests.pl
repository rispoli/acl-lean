:- ['../latexify.pl'].

:- [test_defLIS2010].
:- [test_fossacs11].

?- latexify(([], [x : 'A' says '\\alpha' -> 'B' says ('A' says '\\alpha')], [], [], []), 'examples/v01.tex').
?- latexify(([x : 'A' says '\\alpha'], [y : 'A' says '\\alpha'], [], [], [y >=x ]), 'examples/v02.tex').
?- latexify(([x : 'A' says '\\varphi' -> '\\varphi', x : 'A' says ('B' says '\\varphi' -> '\\varphi'), x : 'B' says '\\varphi'], [x : '\\varphi'], [], [], []), 'examples/v03.tex').
?- latexify(([x : 'A' says '\\varphi' -> '\\varphi', x : 'A' says '\\varphi'], [x : '\\varphi'], [], [], []), 'examples/v04.tex').
?- latexify(([x : 'A' says (('B' says '\\varphi') -> '\\varphi'), x : 'B' says '\\varphi'], [x : 'A' says '\\varphi'], [], [], []), 'examples/v05.tex').
?- latexify(([x : 'A' says ('\\alpha' -> '\\beta'), x : 'A' says '\\alpha'], [x : 'A' says '\\beta'], [], [], []), 'examples/v06.tex').
?- latexify(([x : 'A' says '\\alpha' -> '\\alpha', x : 'A' says '\\alpha'], [x : '\\alpha'], [], [], []), 'examples/v07.tex').
?- latexify(([x : 'A' says ('B' says '\\alpha') -> '\\alpha', x : 'A' says ('B' says '\\alpha')],[x : '\\alpha'], [], [], []), 'examples/v08.tex').
?- latexify(([x : (('A' and 'B') says '\\varphi') -> '\\varphi', x : ('A' and 'B') says '\\varphi'], [x : '\\varphi'], [], [], []), 'examples/v09.tex').
?- latexify(([x : 'A' says '\\varphi'], [x : ('A' and 'B') says '\\varphi'], [], [], []), 'examples/v10.tex').
?- latexify(([x : (a_1 says suu_1) -> wpu_1, x: a_2 says suu_1], [x : (a_1 and a_2) says wpu_1], [], [], []), 'examples/v11.tex').
?- latexify(([x : 'A' says ('\\alpha' -> '\\beta'), x : 'B' says '\\alpha'], [x : 'A' and 'B' says '\\beta'], [], [], []), 'examples/v12.tex').
?- latexify(([x : 'A' says '\\alpha' -> '\\beta', x : 'A' says '\\alpha'], [x : 'A' says '\\beta'], [], [], []), 'examples/v13.tex').
