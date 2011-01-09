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
	int transition;
	PlTerm plterm_1;
	PlTerm plterm_2[2];
	PlTerm plterm_3;
	PlTerm plterm_4;
	PlTerm plterm_5[2];
	PlTerm plterm_6;
	PlTerm plterm_7[2];
	PlTerm plterm_8;
	PlTerm plterm_9[2];
	PlTerm plterm_10;
	PlTerm plterm_11[2];
	PlTerm plterm_12;
	PlTerm plterm_13[2];
	PlTerm plterm_14;
	PlTerm plterm_15[2];
	PlTerm plterm_16;
	PlTerm plterm_17;
	PlTerm plterm_18[2];
	PlTerm plterm_19;
	PlTerm plterm_20;
	PlTerm plterm_21;
	PlTerm plterm_22[2];
	PlTerm plterm_23;
	PlTerm plterm_24;
	PlTerm plterm_25;
	PlTerm plterm_26[2];
	PlTerm plterm_27;
	PlTerm plterm_28[2];
	PlTerm plterm_29;
	PlTerm plterm_30[2];
	PlTerm plterm_31;
	PlTerm plterm_32;
	PlTerm plterm_33;
	PlTerm plterm_34;
	PlTerm plterm_35;
	PlTerm plterm_36[2];
	PlTerm plterm_37;
	PlTerm plterm_38[2];
	PlTerm plterm_39;
	PlTerm plterm_40;
	PlTerm plterm_41;
	PlTerm plterm_42[2];
	PlTerm plterm_43;
	PlTerm plterm_44[2];
	PlTerm plterm_45;
	PlTerm plterm_46;
	PlTerm plterm_47[2];
	PlTerm plterm_48;
	PlTerm plterm_49;
	PlTerm plterm_50;
	PlTerm plterm_51;
	PlTerm plterm_52[2];
	PlTerm plterm_53;
	PlTerm plterm_54;
	PlTerm plterm_55;
	PlTerm plterm_56[1];
	/*****************************************************************/

	Pl_Start_Prolog(argc, argv);

	func = Pl_Find_Atom("search_nodes");

	/*****************************************************************/
	not = Pl_Find_Atom("~");
	and = Pl_Find_Atom("and");
	or = Pl_Find_Atom("or");
	says = Pl_Find_Atom("says");
	implies = Pl_Find_Atom("->");
	colon = Pl_Find_Atom(":");
	geq = Pl_Find_Atom(">=");
	transition = Pl_Find_Atom("transition");
	/*****************************************************************/

	Pl_Query_Begin(PL_TRUE);

	/*****************************************************************/
	arg[0] = Pl_Mk_Proper_List(0, NULL);
	plterm_3 = Pl_Mk_String("u");
	plterm_16 = Pl_Mk_String("a_1");
	plterm_19 = Pl_Mk_String("suu_1");
	plterm_20 = Pl_Mk_String("wpu_1");
	plterm_18[0] = plterm_19;
	plterm_18[1] = plterm_20;
	plterm_17 = Pl_Mk_Compound(implies, 2, plterm_18);
	plterm_15[0] = plterm_16;
	plterm_15[1] = plterm_17;
	plterm_14 = Pl_Mk_Compound(says, 2, plterm_15);
	plterm_23 = Pl_Mk_String("a_2");
	plterm_24 = Pl_Mk_String("suu_1");
	plterm_22[0] = plterm_23;
	plterm_22[1] = plterm_24;
	plterm_21 = Pl_Mk_Compound(says, 2, plterm_22);
	plterm_13[0] = plterm_14;
	plterm_13[1] = plterm_21;
	plterm_12 = Pl_Mk_Compound(and, 2, plterm_13);
	plterm_31 = Pl_Mk_String("a_1");
	plterm_32 = Pl_Mk_String("a_2");
	plterm_30[0] = plterm_31;
	plterm_30[1] = plterm_32;
	plterm_29 = Pl_Mk_Compound(and, 2, plterm_30);
	plterm_33 = Pl_Mk_String("df_1");
	plterm_28[0] = plterm_29;
	plterm_28[1] = plterm_33;
	plterm_27 = Pl_Mk_Compound(says, 2, plterm_28);
	plterm_34 = Pl_Mk_String("df_1");
	plterm_26[0] = plterm_27;
	plterm_26[1] = plterm_34;
	plterm_25 = Pl_Mk_Compound(implies, 2, plterm_26);
	plterm_11[0] = plterm_12;
	plterm_11[1] = plterm_25;
	plterm_10 = Pl_Mk_Compound(and, 2, plterm_11);
	plterm_39 = Pl_Mk_String("a_1");
	plterm_40 = Pl_Mk_String("a_2");
	plterm_38[0] = plterm_39;
	plterm_38[1] = plterm_40;
	plterm_37 = Pl_Mk_Compound(and, 2, plterm_38);
	plterm_45 = Pl_Mk_String("wpu_1");
	plterm_48 = Pl_Mk_String("u_1");
	plterm_49 = Pl_Mk_String("df_1");
	plterm_47[0] = plterm_48;
	plterm_47[1] = plterm_49;
	plterm_46 = Pl_Mk_Compound(says, 2, plterm_47);
	plterm_44[0] = plterm_45;
	plterm_44[1] = plterm_46;
	plterm_43 = Pl_Mk_Compound(and, 2, plterm_44);
	plterm_50 = Pl_Mk_String("df_1");
	plterm_42[0] = plterm_43;
	plterm_42[1] = plterm_50;
	plterm_41 = Pl_Mk_Compound(implies, 2, plterm_42);
	plterm_36[0] = plterm_37;
	plterm_36[1] = plterm_41;
	plterm_35 = Pl_Mk_Compound(says, 2, plterm_36);
	plterm_9[0] = plterm_10;
	plterm_9[1] = plterm_35;
	plterm_8 = Pl_Mk_Compound(and, 2, plterm_9);
	plterm_53 = Pl_Mk_String("u_1");
	plterm_54 = Pl_Mk_String("df_1");
	plterm_52[0] = plterm_53;
	plterm_52[1] = plterm_54;
	plterm_51 = Pl_Mk_Compound(says, 2, plterm_52);
	plterm_7[0] = plterm_8;
	plterm_7[1] = plterm_51;
	plterm_6 = Pl_Mk_Compound(and, 2, plterm_7);
	plterm_55 = Pl_Mk_String("df_1");
	plterm_5[0] = plterm_6;
	plterm_5[1] = plterm_55;
	plterm_4 = Pl_Mk_Compound(implies, 2, plterm_5);
	plterm_2[0] = plterm_3;
	plterm_2[1] = plterm_4;
	plterm_1 = Pl_Mk_Compound(colon, 2, plterm_2);
	plterm_56[0] = plterm_1;
	arg[1] = Pl_Mk_Proper_List(1, plterm_56);
	arg[2] = Pl_Mk_Proper_List(0, NULL);
	arg[3] = Pl_Mk_Proper_List(0, NULL);
	arg[4] = Pl_Mk_Proper_List(0, NULL);
	/*****************************************************************/

	res = Pl_Query_Call(func, 5, arg);

	printf("Query:\n\t|- u : ((a_1 says (suu_1 -> wpu_1)) and (a_2 says suu_1) and (((a_1 and a_2) says df_1) -> df_1) and (a_1 and a_2 says ((wpu_1 and (u_1 says df_1)) -> df_1)) and (u_1 says df_1)) -> df_1\n%s.\n", res ? "true" : "false");

	Pl_Query_End(PL_RECOVER);

	Pl_Stop_Prolog();
	return 0;
}

int main(int argc, char *argv[]) {
	return Main_Wrapper(argc, argv);
}
