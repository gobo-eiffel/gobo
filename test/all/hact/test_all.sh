#!/bin/sh

# usage: test_all.sh [-debug]


cp $GOBO/test/all/hact/Makefile .
make all$1

echo ""
echo "Testing example calculator..."
$GOBO/test/all/common/test_harness.sh $1 hact calculator $GOBO/example/lexical/calculator
