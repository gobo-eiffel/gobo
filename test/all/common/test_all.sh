#!/bin/sh

# usage: test_all.sh [--finalize] compiler

echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/common/test_harness.sh --getest $1 $2 structure $GOBO/test/structure

echo ""
echo "Testing Gobo Eiffel Time Library..."
$GOBO/test/all/common/test_harness.sh --getest $1 $2 time $GOBO/test/time

echo ""
echo "Testing geyacc..."
$GOBO/test/all/common/test_harness.sh --version $1 $2 geyacc $GOBO/src/geyacc

echo ""
echo "Testing gelex..."
$GOBO/test/all/common/test_harness.sh --version $1 $2 gelex $GOBO/src/gelex

echo ""
echo "Testing gepp..."
$GOBO/test/all/common/test_harness.sh --version $1 $2 gepp $GOBO/src/gepp

echo ""
echo "Testing getest..."
$GOBO/test/all/common/test_harness.sh --version $1 $2 getest $GOBO/src/getest

echo ""
echo "Testing example ascii2ps..."
$GOBO/test/all/common/test_harness.sh $1 $2 ascii2ps $GOBO/example/lexical/ascii2ps

echo ""
echo "Testing example gegrep..."
$GOBO/test/all/common/test_harness.sh $1 $2 gegrep $GOBO/example/lexical/gegrep

echo ""
echo "Testing example eiffel_scanner..."
$GOBO/test/all/common/test_harness.sh $1 $2 eiffel_scanner $GOBO/example/lexical/eiffel

echo ""
echo "Testing example eiffel_parser..."
$GOBO/test/all/common/test_harness.sh $1 $2 eiffel_parser $GOBO/example/parse/eiffel

echo ""
echo "Testing example rpcalc..."
$GOBO/test/all/common/test_harness.sh $1 $2 rpcalc $GOBO/example/parse/rpcalc

echo ""
echo "Testing example calc..."
$GOBO/test/all/common/test_harness.sh $1 $2 calc $GOBO/example/parse/calc

echo ""
echo "Testing example mcalc..."
$GOBO/test/all/common/test_harness.sh $1 $2 mcalc $GOBO/example/parse/mcalc
