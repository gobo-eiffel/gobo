#!/bin/sh

# usage: test_all.sh [--finalize]

echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/hact/test_structure.sh $1

echo ""
echo "Testing Gobo Eiffel Time Library..."
#$GOBO/test/all/hact/test_time.sh $1

echo ""
$GOBO/test/all/common/test_all.sh $1 hact

echo ""
echo "Testing example calculator..."
$GOBO/test/all/common/test_harness.sh $1 hact calculator $GOBO/example/lexical/calculator
