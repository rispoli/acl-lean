GPLC=gplc
CFLAGS=-Wall -O
GNU_FOLDER=gnu_prolog/

all: op_pri.pl gdeduction_tree

op_pri.pl: inference_rules_axioms.pl
	@grep "op(.*)." $< | sed 's/.*op(\(.*\),.*, \(.*\))./op_pri(\1, \2)./' > $@

$(GNU_FOLDER)ginference_rules_axioms.pl: inference_rules_axioms.pl
	cat $< | sed -e 's/.*\(op(.*)\)./:- \1./' -e s/Γ/Gamma/g -e s/Δ/Delta/g -e s/list_to_set/sort/g -e s/include/filter/ > $@
	echo -e "\n:- include('$(GNU_FOLDER)utilities_gnu')." >> $@

$(GNU_FOLDER)gdeduction_tree.pl: deduction_tree.pl
	cat $< | sed -e "s|:- \[\(.*\)\].|:- include('$(GNU_FOLDER)g\1').|" -e s/Γ/Gamma/g -e s/Δ/Delta/g > $@
	echo -ne "\nsearch_nodes(G, D, Tr_G, Tr_D, Pre) :-\n    search_nodes((G, D, Tr_G, Tr_D, Pre), [], _)." >> $@

gdeduction_tree: $(GNU_FOLDER)ginference_rules_axioms.pl $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)deduction_tree_c.c
	$(GPLC) -C "$(CFLAGS)" $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)deduction_tree_c.c -o $(GNU_FOLDER)gdeduction_tree

clean:
	rm -f $(GNU_FOLDER)ginference_rules_axioms.pl $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)gdeduction_tree
