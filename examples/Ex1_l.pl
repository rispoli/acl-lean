% Ex1.pl
% ad says df1 -> df1: administrator has direct permission over delete file 1
% ad says (b says df1 -> df1): administrator trusts bob on delete file 1
% b says df1: bob asks to delete file 1

?- latexify(((ad says (b says df1 -> df1)) and (ad says df1 -> df1) and (b says df1)) -> df1, 'examples/Ex1.tex').
