#!/bin/sh

# usage: test_all.sh [-debug]

echo "Testing precomp..."
$GOBO/test/all/ve/test_precomp.sh $1

cp $GOBO/test/all/ve/Makefile .
make all$1
