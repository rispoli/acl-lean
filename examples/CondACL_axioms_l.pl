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
