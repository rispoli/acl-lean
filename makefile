GPLC=gplc
CFLAGS=-Wall -O
GNU_FOLDER=gnu_prolog/

all: op_pri.pl gdeduction_tree

op_pri.pl: inference_rules_axioms.pl
	@grep "op(.*)." $< | sed 's/.*op(\(.*\),.*, \(.*\))./op_pri(\1, \2)./' > $@

$(GNU_FOLDER)ginference_rules_axioms.pl: inference_rules_axioms.pl
	cat $< | sed -e 's/.*\(op(.*)\)./:- \1./' -e s/Γ/Gamma/g -e s/Δ/Delta/g -e s/list_to_set/sort/g -e s/include/filter/ > $@
	echo -e "\n:- include('$(GNU_FOLDER)utilities_gnu')." >> $@

$(GNU_FOLDER)gdepth_distance.pl: depth_distance.pl
	cp $< $@

$(GNU_FOLDER)gdeduction_tree.pl: deduction_tree.pl
	cat $< | sed -e "s|:- \[\(.*\)\].|:- include('$(GNU_FOLDER)g\1').|" -e s/Γ/Gamma/g -e s/Δ/Delta/g -e s/\s*reset_gensym,// > $@

gdeduction_tree: $(GNU_FOLDER)ginference_rules_axioms.pl $(GNU_FOLDER)gdepth_distance.pl $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)deduction_tree_c.c
	$(GPLC) -C "$(CFLAGS)" $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)deduction_tree_c.c -o $(GNU_FOLDER)gdeduction_tree

examples/test_defLIS2010_p.pl: examples/test_defLIS2010.pl
	cat $< | sed -e "s/latexify(\(.*\), 'examples.*')\./prove(\1)./" > $@

examples/test_fossacs11_p.pl: examples/test_fossacs11.pl
	cat $< | sed -e "s/latexify(\(.*\), 'examples.*')\./prove(\1)./" > $@

examples/tests_p.pl: examples/tests.pl examples/test_defLIS2010_p.pl examples/test_fossacs11_p.pl
	cat $< | sed -e "s/latexify(\(.*\), 'examples.*')\./prove(\1)./" -e 's/latexify/deduction_tree/' -e 's/\[\(test_.*\)\]/\[\1_p\]/'> $@

tests_p: examples/tests_p.pl

clean:
	rm -f $(GNU_FOLDER)ginference_rules_axioms.pl $(GNU_FOLDER)gdeduction_tree.pl $(GNU_FOLDER)gdeduction_tree
