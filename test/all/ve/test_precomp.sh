#!/bin/sh

mkdir precomp
cd precomp
cp $GOBO/test/precomp/ve.eld .
vec -p:ve.eld -no
vec -eu -y -no
if [ -s Result.out ]; then
	cat Result.out
	echo "Test failed"
else
	echo "Test successful"
fi
