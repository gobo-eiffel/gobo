#!/bin/sh

# usage: test_all.sh [--finalize]


$GOBO/test/all/common/test_all.sh $1 hact

echo ""
echo "Testing example calculator..."
$GOBO/test/all/common/test_harness.sh $1 hact calculator $GOBO/example/lexical/calculator
