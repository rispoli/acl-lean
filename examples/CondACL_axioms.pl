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
