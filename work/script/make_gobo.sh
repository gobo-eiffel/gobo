#!/bin/sh

# usage: make_gobo <platform> <compiler>
if [ -z "$1" ]; then platform="windows"; else platform=$1; fi
if [ -z "$2" ]; then compiler="se"; else compiler=$2; fi

rootdir=`pwd`
GOBO=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO
echo "#### \$GOBO = $GOBO"
cd $GOBO

# Generate platform-dependent Makefile template.
echo ''; echo "#### Use \$GOBO/misc/$1.mk"
cd $GOBO/misc
sed "s/^GOBO_PLATFORM/#GOBO_PLATFORM/g" platform.mk | \
sed "s/^#GOBO_PLATFORM=$platform/GOBO_PLATFORM=$platform/g" > platform.tmp
mv platform.tmp platform.mk

# Generate files in $GOBO/library.
echo ''; echo "#### Generate files in \$GOBO/library/kernel"
cd $GOBO/library/kernel
make depend spec
echo ''; echo "#### Generate files in \$GOBO/library/lexical/lex"
cd $GOBO/library/lexical/lex
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/library/lexical/regexp"
cd $GOBO/library/lexical/regexp
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/library/parse/yacc"
cd $GOBO/library/parse/yacc
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/library/utility"
cd $GOBO/library/utility
make depend spec
echo ''; echo "#### Generate files in \$GOBO/library/test/generation"
cd $GOBO/library/test/generation
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/library/time"
cd $GOBO/library/time
make depend spec
echo ''; echo "#### Generate files in \$GOBO/library/tools/parser"
cd $GOBO/library/tools/parser
make parser scanner

# Generate files in $GOBO/src.
echo ''; echo "#### Generate files in \$GOBO/src/gelex"
cd $GOBO/src/gelex
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/src/gelint"
cd $GOBO/src/gelint
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/src/gepp"
cd $GOBO/src/gepp
make depend ise.ace hact.ace
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/src/getest"
cd $GOBO/src/getest
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/src/geyacc"
cd $GOBO/src/geyacc
make depend ise.ace hact.ace

# Compile binaries with desired compiler
# and copy them to $GOBO/bin.
echo ''; echo "#### Compile binaries with $compiler compiler"
cd $GOBO/bin
make $compiler

# Generate files in $GOBO/example.
echo ''; echo "#### Generate files in \$GOBO/example/lexical/ascii2ps"
cd $GOBO/example/lexical/ascii2ps
make depend ise.ace hact.ace
make scanner
echo ''; echo "#### Generate files in \$GOBO/example/lexical/calculator"
cd $GOBO/example/lexical/calculator
make depend hact.ace
make scanner
echo ''; echo "#### Generate files in \$GOBO/example/lexical/eiffel_scanner"
cd $GOBO/example/lexical/eiffel_scanner
make depend ise.ace hact.ace
make scanner
echo ''; echo "#### Generate files in \$GOBO/example/lexical/gegrep"
cd $GOBO/example/lexical/gegrep
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/example/parse/calc"
cd $GOBO/example/parse/calc
make depend ise.ace hact.ace
make parser
echo ''; echo "#### Generate files in \$GOBO/example/parse/eiffel_parser"
cd $GOBO/example/parse/eiffel_parser
make depend ise.ace hact.ace
make parser scanner
echo ''; echo "#### Generate files in \$GOBO/example/parse/mcalc"
cd $GOBO/example/parse/mcalc
make depend ise.ace hact.ace
make parser
echo ''; echo "#### Generate files in \$GOBO/example/parse/rpcalc"
cd $GOBO/example/parse/rpcalc
make depend ise.ace hact.ace
make parser
echo ''; echo "#### Generate files in \$GOBO/example/time/clock"
cd $GOBO/example/time/clock
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/example/test/concat1"
cd $GOBO/example/test/concat1
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/example/test/concat2"
cd $GOBO/example/test/concat2
make depend ise.ace hact.ace

# Generate files in $GOBO/test.
echo ''; echo "#### Generate files in \$GOBO/test/structure"
cd $GOBO/test/structure
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/test/time"
cd $GOBO/test/time
make depend ise.ace hact.ace
echo ''; echo "#### Generate files in \$GOBO/test/precomp"
cd $GOBO/test/precomp
make depend ise.ace ise_base.ace hact.ace

cd $rootdir
