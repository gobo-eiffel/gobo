#!/local/bin/bash

mkdir gegrep
cd gegrep
if [ "$1" = "-boost" ]; then
	cp $GOBO/example/lexical/gegrep/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/example/lexical/gegrep/se.sh > se.sh
fi
./se.sh | grep -v "warning \(C4049\|C4761\)"

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
