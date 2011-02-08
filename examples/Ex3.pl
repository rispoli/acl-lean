% Ex3.pl
% ad says df1 -> df1: administrator has direct permission over delete file 1
% ad says (b says df1 -> df1): administrator trusts bob on delete file 1
% b says (a says df1 -> b says df1): bob says that if alice asks to delete file 1 then also bob supports it
% a says df1: alice asks to delete file 1

?- prove(((b says (a says df1 -> b says df1)) and (ad says (b says df1 -> df1)) and (a says df1) and (ad says df1 -> df1)) -> df1).
