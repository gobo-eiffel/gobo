#!/local/bin/bash

mkdir gelex
cd gelex
cp $GOBO/src/gelex/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x gelex ]; then
	./gelex --version
	$GOBO/test/all/common/test_gelex.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
