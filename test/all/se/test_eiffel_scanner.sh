#!/local/bin/bash

mkdir eiffel_scanner
cd eiffel_scanner
if [ "$1" = "-boost" ]; then
	cp $GOBO/example/lexical/eiffel/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/example/lexical/eiffel/se.sh > se.sh
fi
./se.sh > tmp11.txt 2>&1
cat tmp11.txt | grep -v "warning \(C4049\|C4761\|D4002\)"

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
