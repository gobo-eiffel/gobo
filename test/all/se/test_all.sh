#!/bin/sh

# usage: test_all.sh [-debug]

GOBO=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO

#echo "Testing precomp..."
#$GOBO/test/all/se/test_precomp.sh $1

cp $GOBO/test/all/se/Makefile .
make all$1
