#!/bin/sh

# usage: test_all.sh [-debug]

GOBO=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO

echo "Testing precomp..."
$GOBO/test/all/ise/test_precomp.sh $1

echo ""
echo "Testing precomp-base..."
$GOBO/test/all/ise/test_precomp_base.sh $1

cp $GOBO/test/all/ise/Makefile .
make all$1
