#!/bin/sh

# usage: test_all.sh [--finalize]

echo "Testing precomp..."
$GOBO/test/all/ise/test_precomp.sh $1

echo ""
echo "Testing precomp-base..."
$GOBO/test/all/ise/test_precomp_base.sh $1

echo ""
echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/ise/test_structure.sh $1

echo ""
$GOBO/test/all/common/test_all.sh $1 ise
