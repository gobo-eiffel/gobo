#!/local/bin/bash

mkdir geyacc
cd geyacc
if [ "$1" = "-boost" ]; then
	cp $GOBO/src/geyacc/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/src/geyacc/se.sh > se.sh
fi
./se.sh | grep -v "warning \(C4049\|C4761\)"

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
