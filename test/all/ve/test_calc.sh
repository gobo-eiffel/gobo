#!/local/bin/bash

mkdir calc
cd calc
cp $GOBO/example/parse/calc/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x calc ]; then
	$GOBO/test/all/common/test_calc.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
