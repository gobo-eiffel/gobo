#!/local/bin/bash

mkdir eiffel_parser
cd eiffel_parser
if [ "$1" = "-boost" ]; then
	cp $GOBO/example/parse/eiffel/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/example/parse/eiffel/se.sh > se.sh
fi
./se.sh > tmp11.txt 2>&1
cat tmp11.txt | grep -v "warning \(C4049\|C4761\|D4002\)"

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
