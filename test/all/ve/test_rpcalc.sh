#!/local/bin/bash

mkdir rpcalc
cd rpcalc
cp $GOBO/example/parse/rpcalc/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x rpcalc ]; then
	$GOBO/test/all/common/test_rpcalc.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
