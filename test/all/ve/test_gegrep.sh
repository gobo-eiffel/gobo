#!/local/bin/bash

mkdir gegrep
cd gegrep
cp $GOBO/example/lexical/gegrep/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x gegrep ]; then
	$GOBO/test/all/common/test_gegrep.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
