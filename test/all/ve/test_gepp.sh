#!/local/bin/bash

mkdir gepp
cd gepp
cp $GOBO/src/gepp/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x gepp ]; then
	./gepp --version
	$GOBO/test/all/common/test_gepp.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
