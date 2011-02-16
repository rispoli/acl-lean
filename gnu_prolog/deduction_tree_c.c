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

#include <stdio.h>
#include <string.h>

#define __GPROLOG_FOREIGN_STRICT__
#include "gprolog.h"

static int Main_Wrapper(int argc, char *argv[]) {
	int func;
	PlTerm arg[3];
	PlBool res;

	/*****************************************************************/
	int not;
	int and;
	int or;
	int says;
	int implies;
	int colon;
	int geq;
	PlTerm plterm_0;
	PlTerm plterm_1[2];
	PlTerm plterm_2;
	PlTerm plterm_3[2];
	PlTerm plterm_4;
	PlTerm plterm_5[2];
	PlTerm plterm_6;
	PlTerm plterm_7[2];
	PlTerm plterm_8;
	PlTerm plterm_9[2];
	PlTerm plterm_10;
	PlTerm plterm_11[2];
	PlTerm plterm_12;
	PlTerm plterm_13;
	PlTerm plterm_14[2];
	PlTerm plterm_15;
	PlTerm plterm_16;
	PlTerm plterm_17;
	PlTerm plterm_18[2];
	PlTerm plterm_19;
	PlTerm plterm_20;
	PlTerm plterm_21;
	PlTerm plterm_22[2];
	PlTerm plterm_23;
	PlTerm plterm_24[2];
	PlTerm plterm_25;
	PlTerm plterm_26[2];
	PlTerm plterm_27;
	PlTerm plterm_28;
	PlTerm plterm_29;
	PlTerm plterm_30;
	PlTerm plterm_31;
	PlTerm plterm_32[2];
	PlTerm plterm_33;
	PlTerm plterm_34[2];
	PlTerm plterm_35;
	PlTerm plterm_36;
	PlTerm plterm_37;
	PlTerm plterm_38[2];
	PlTerm plterm_39;
	PlTerm plterm_40[2];
	PlTerm plterm_41;
	PlTerm plterm_42;
	PlTerm plterm_43[2];
	PlTerm plterm_44;
	PlTerm plterm_45;
	PlTerm plterm_46;
	PlTerm plterm_47;
	PlTerm plterm_48[2];
	PlTerm plterm_49;
	PlTerm plterm_50;
	PlTerm plterm_51;
	/*****************************************************************/

	Pl_Start_Prolog(argc, argv);

	func = Pl_Find_Atom("prove");

	/*****************************************************************/
	not = Pl_Find_Atom("~");
	and = Pl_Find_Atom("and");
	or = Pl_Find_Atom("or");
	says = Pl_Find_Atom("says");
	implies = Pl_Find_Atom("->");
	colon = Pl_Find_Atom(":");
	geq = Pl_Find_Atom(">=");
	/*****************************************************************/

	Pl_Query_Begin(PL_TRUE);

	/*****************************************************************/
	plterm_12 = Pl_Mk_String("a_1");
	plterm_15 = Pl_Mk_String("suu_1");
	plterm_16 = Pl_Mk_String("wpu_1");
	plterm_14[0] = plterm_15;
	plterm_14[1] = plterm_16;
	plterm_13 = Pl_Mk_Compound(implies, 2, plterm_14);
	plterm_11[0] = plterm_12;
	plterm_11[1] = plterm_13;
	plterm_10 = Pl_Mk_Compound(says, 2, plterm_11);
	plterm_19 = Pl_Mk_String("a_2");
	plterm_20 = Pl_Mk_String("suu_1");
	plterm_18[0] = plterm_19;
	plterm_18[1] = plterm_20;
	plterm_17 = Pl_Mk_Compound(says, 2, plterm_18);
	plterm_9[0] = plterm_10;
	plterm_9[1] = plterm_17;
	plterm_8 = Pl_Mk_Compound(and, 2, plterm_9);
	plterm_27 = Pl_Mk_String("a_1");
	plterm_28 = Pl_Mk_String("a_2");
	plterm_26[0] = plterm_27;
	plterm_26[1] = plterm_28;
	plterm_25 = Pl_Mk_Compound(and, 2, plterm_26);
	plterm_29 = Pl_Mk_String("df_1");
	plterm_24[0] = plterm_25;
	plterm_24[1] = plterm_29;
	plterm_23 = Pl_Mk_Compound(says, 2, plterm_24);
	plterm_30 = Pl_Mk_String("df_1");
	plterm_22[0] = plterm_23;
	plterm_22[1] = plterm_30;
	plterm_21 = Pl_Mk_Compound(implies, 2, plterm_22);
	plterm_7[0] = plterm_8;
	plterm_7[1] = plterm_21;
	plterm_6 = Pl_Mk_Compound(and, 2, plterm_7);
	plterm_35 = Pl_Mk_String("a_1");
	plterm_36 = Pl_Mk_String("a_2");
	plterm_34[0] = plterm_35;
	plterm_34[1] = plterm_36;
	plterm_33 = Pl_Mk_Compound(and, 2, plterm_34);
	plterm_41 = Pl_Mk_String("wpu_1");
	plterm_44 = Pl_Mk_String("u_1");
	plterm_45 = Pl_Mk_String("df_1");
	plterm_43[0] = plterm_44;
	plterm_43[1] = plterm_45;
	plterm_42 = Pl_Mk_Compound(says, 2, plterm_43);
	plterm_40[0] = plterm_41;
	plterm_40[1] = plterm_42;
	plterm_39 = Pl_Mk_Compound(and, 2, plterm_40);
	plterm_46 = Pl_Mk_String("df_1");
	plterm_38[0] = plterm_39;
	plterm_38[1] = plterm_46;
	plterm_37 = Pl_Mk_Compound(implies, 2, plterm_38);
	plterm_32[0] = plterm_33;
	plterm_32[1] = plterm_37;
	plterm_31 = Pl_Mk_Compound(says, 2, plterm_32);
	plterm_5[0] = plterm_6;
	plterm_5[1] = plterm_31;
	plterm_4 = Pl_Mk_Compound(and, 2, plterm_5);
	plterm_49 = Pl_Mk_String("u_1");
	plterm_50 = Pl_Mk_String("df_1");
	plterm_48[0] = plterm_49;
	plterm_48[1] = plterm_50;
	plterm_47 = Pl_Mk_Compound(says, 2, plterm_48);
	plterm_3[0] = plterm_4;
	plterm_3[1] = plterm_47;
	plterm_2 = Pl_Mk_Compound(and, 2, plterm_3);
	plterm_51 = Pl_Mk_String("df_1");
	plterm_1[0] = plterm_2;
	plterm_1[1] = plterm_51;
	plterm_0 = Pl_Mk_Compound(implies, 2, plterm_1);
	arg[0] = plterm_0;
	/*****************************************************************/

	res = Pl_Query_Call(func, 1, arg);

	printf("Query:\n\t|- u : ((a_1 says (suu_1 -> wpu_1)) and (a_2 says suu_1) and (((a_1 and a_2) says df_1) -> df_1) and (a_1 and a_2 says ((wpu_1 and (u_1 says df_1)) -> df_1)) and (u_1 says df_1)) -> df_1\n%s.\n", res ? "true" : "false");

	Pl_Query_End(PL_RECOVER);

	Pl_Stop_Prolog();
	return 0;
}

int main(int argc, char *argv[]) {
	return Main_Wrapper(argc, argv);
}
