#!/local/bin/bash

cp $GOBO/library/lexical/lex/lx_lex_scanner.l .
./gelex lx_lex_scanner.l
grep -v "\$\(Date\|Revision\):" lx_lex_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/lexical/lex/lx_lex_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/library/lexical/regexp/lx_regexp_scanner.l .
./gelex lx_regexp_scanner.l
grep -v "\$\(Date\|Revision\):" lx_regexp_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/lexical/regexp/lx_regexp_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/library/parse/yacc/pr_yacc_scanner.l .
./gelex pr_yacc_scanner.l
grep -v "\$\(Date\|Revision\):" pr_yacc_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/parse/yacc/pr_yacc_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/src/gepp/gepp_scanner.l .
./gelex gepp_scanner.l
grep -v "\$\(Date\|Revision\):" gepp_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/src/gepp/gepp_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/lexical/ascii2ps/ascii2ps.l .
./gelex ascii2ps.l
grep -v "\$\(Date\|Revision\):" ascii2ps.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/lexical/ascii2ps/ascii2ps.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/lexical/calculator/calc_scanner.l .
./gelex calc_scanner.l
grep -v "\$\(Date\|Revision\):" calc_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/lexical/calculator/calc_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/lexical/eiffel/eiffel_scanner.l .
./gelex eiffel_scanner.l
grep -v "\$\(Date\|Revision\):" eiffel_scanner.e >  tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/lexical/eiffel/eiffel_scanner.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/parse/eiffel/eiffel_scanner.l .
./gelex eiffel_scanner.l
grep -v "\$\(Date\|Revision\):" eiffel_scanner.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/parse/eiffel/eiffel_scanner.e > tmp2.e
diff tmp1.e tmp2.e
