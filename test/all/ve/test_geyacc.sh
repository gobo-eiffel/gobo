#!/local/bin/bash

mkdir geyacc
cd geyacc
cp $GOBO/src/geyacc/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x geyacc ]; then
	./geyacc --version
	$GOBO/test/all/common/test_geyacc.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
