#!/local/bin/bash

mkdir mcalc
cd mcalc
cp $GOBO/example/parse/mcalc/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x mcalc ]; then
	$GOBO/test/all/common/test_mcalc.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
