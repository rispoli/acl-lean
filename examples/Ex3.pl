/*

   Copyright 2010 Daniele Rispoli, Valerio Genovese

   This file is part of ACL-Lean.

   ACL-Lean is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   ACL-Lean is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with ACL-Lean. If not, see <http://www.gnu.org/licenses/>.

*/

% Ex3.pl
% ad says df1 -> df1: administrator has direct permission over delete file 1
% ad says (b says df1 -> df1): administrator trusts bob on delete file 1
% b says (a says df1 -> b says df1): bob says that if alice asks to delete file 1 then also bob supports it
% a says df1: alice asks to delete file 1

?- prove(((b says (a says df1 -> b says df1)) and (ad says (b says df1 -> df1)) and (a says df1) and (ad says df1 -> df1)) -> df1).
