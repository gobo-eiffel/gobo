#!/local/bin/bash

cp $GOBO/library/lexical/lex/lx_lex_parser.y .
./geyacc -t LX_LEX_TOKENS -o lx_lex_parser.e lx_lex_parser.y
grep -v "\$\(Date\|Revision\):" lx_lex_parser.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/lexical/lex/lx_lex_parser.e > tmp2.e
diff tmp1.e tmp2.e > tmp3.txt
if [ -s tmp3.txt ]; then
	echo "diff \$GOBO/library/lexical/lex/lx_lex_parser.e"
	cat tmp3.txt
fi
grep -v "generator:" lx_lex_tokens.e > tmp1.e
grep -v "generator:" $GOBO/library/lexical/lex/lx_lex_tokens.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/library/lexical/regexp/lx_regexp_parser.y .
./geyacc -t LX_REGEXP_TOKENS -o lx_regexp_parser.e lx_regexp_parser.y
grep -v "\$\(Date\|Revision\):" lx_regexp_parser.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/lexical/regexp/lx_regexp_parser.e > tmp2.e
diff tmp1.e tmp2.e
grep -v "generator:" lx_regexp_tokens.e > tmp1.e
grep -v "generator:" $GOBO/library/lexical/regexp/lx_regexp_tokens.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/library/parse/yacc/pr_yacc_parser.y .
./geyacc -t PR_YACC_TOKENS -o pr_yacc_parser.e pr_yacc_parser.y
grep -v "\$\(Date\|Revision\):" pr_yacc_parser.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/library/parse/yacc/pr_yacc_parser.e > tmp2.e
diff tmp1.e tmp2.e
grep -v "generator:" pr_yacc_tokens.e > tmp1.e
grep -v "generator:" $GOBO/library/parse/yacc/pr_yacc_tokens.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/src/gepp/gepp_parser.y .
./geyacc -t GEPP_TOKENS -o gepp_parser.e gepp_parser.y
grep -v "\$\(Date\|Revision\):" gepp_parser.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/src/gepp/gepp_parser.e > tmp2.e
diff tmp1.e tmp2.e
grep -v "generator:" gepp_tokens.e > tmp1.e
grep -v "generator:" $GOBO/src/gepp/gepp_tokens.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/parse/calc/calc.y .
./geyacc -o calc.e calc.y
grep -v "\$\(Date\|Revision\):" calc.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/parse/calc/calc.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/parse/eiffel/eiffel_parser.y .
./geyacc -t EIFFEL_TOKENS -o eiffel_parser.e eiffel_parser.y
grep -v "\$\(Date\|Revision\):" eiffel_parser.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/parse/eiffel/eiffel_parser.e > tmp2.e
diff tmp1.e tmp2.e > tmp3.txt
if [ -s tmp3.txt ]; then
	echo "diff \$GOBO/example/parse/eiffel/eiffel_parser.e"
	cat tmp3.txt
fi
grep -v "generator:" eiffel_tokens.e > tmp1.e
grep -v "generator:" $GOBO/example/parse/eiffel/eiffel_tokens.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/parse/mcalc/mcalc.y .
./geyacc -o mcalc.e mcalc.y
grep -v "\$\(Date\|Revision\):" mcalc.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/parse/mcalc/mcalc.e > tmp2.e
diff tmp1.e tmp2.e

cp $GOBO/example/parse/rpcalc/rpcalc.y .
./geyacc -o rpcalc.e rpcalc.y
grep -v "\$\(Date\|Revision\):" rpcalc.e > tmp1.e
grep -v "\$\(Date\|Revision\):" $GOBO/example/parse/rpcalc/rpcalc.e > tmp2.e
diff tmp1.e tmp2.e
