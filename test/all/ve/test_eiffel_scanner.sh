#!/local/bin/bash

mkdir eiffel_scanner
cd eiffel_scanner
cp $GOBO/example/lexical/eiffel/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x eiffel_scanner ]; then
	$GOBO/test/all/common/test_eiffel_scanner.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
