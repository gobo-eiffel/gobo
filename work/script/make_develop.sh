#!/bin/sh

# usage: make_develop <platform> <binaries>


# Checkout source code from CVS repository.
cvs checkout gobo

# Get binaries to allow bootstraping.
cp $2/* gobo/bin

# Set environment variable $GOBO.
cd gobo
GOBO=`pwd`
export GOBO

# Generate platform-dependent Makefile template.
cd $GOBO/misc
sed "s/^GOBO_PLATFORM/#GOBO_PLATFORM/g" platform.make | \
sed "s/^#GOBO_PLATFORM=$1/GOBO_PLATFORM=$1/g" > platform.tmp
mv platform.tmp platform.make

# Generate files in $GOBO/library.
cd $GOBO/library/kernel
make depend spec
cd $GOBO/library/lexical/lex
make parser scanner
cd $GOBO/library/lexical/regexp
make parser scanner
cd $GOBO/library/parse/yacc
make parser scanner
cd $GOBO/library/utility
make depend spec

# Generate files in $GOBO/src.
cd $GOBO/src/gelex
make depend ise.ace hact.ace
cd $GOBO/src/gelint
make depend ise.ace hact.ace
cd $GOBO/src/gepp
make depend ise.ace hact.ace
make parser scanner
cd $GOBO/src/getest
make depend ise.ace hact.ace
cd $GOBO/src/geyacc
make depend ise.ace hact.ace

# Compile binaries with SmallEiffel compiler
# and copy them to $GOBO/bin.
cd $GOBO
mkdir BINGEN
cd BINGEN
$GOBO/work/delivery/make_bin.sh $GOBO/bin
cd $GOBO
rm -rf BINGEN

# Generate files in $GOBO/example.
cd $GOBO/example/lexical/ascii2ps
make depend ise.ace hact.ace
make scanner
cd $GOBO/example/lexical/calculator
make depend hact.ace
make scanner
cd $GOBO/example/lexical/eiffel
make depend ise.ace hact.ace
make scanner
cd $GOBO/example/lexical/gegrep
make depend ise.ace hact.ace
cd $GOBO/example/parse/calc
make depend ise.ace hact.ace
make parser
cd $GOBO/example/parse/eiffel
make depend ise.ace hact.ace
make parser scanner
cd $GOBO/example/parse/mcalc
make depend ise.ace hact.ace
make parser
cd $GOBO/example/parse/rpcalc
make depend ise.ace hact.ace
make parser
