#!/local/bin/bash

mkdir eiffel_parser
cd eiffel_parser
cp $GOBO/example/parse/eiffel/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

if [ -x eiffel_parser ]; then
	$GOBO/test/all/common/test_eiffel_parser.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
