#!/bin/sh

# usage: test_all.sh [--finalize]

echo "Testing precomp..."
$GOBO/test/all/se/test_precomp.sh $1

echo ""
echo "Testing Gobo Eiffel Structure Library..."
#$GOBO/test/all/se/test_structure.sh $1

echo ""
echo "Testing Gobo Eiffel Time Library..."
#$GOBO/test/all/se/test_time.sh $1

echo ""
$GOBO/test/all/common/test_all.sh $1 se
