#!/local/bin/bash

mkdir gepp
cd gepp
if [ "$1" = "-boost" ]; then
	cp $GOBO/src/gepp/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/src/gepp/se.sh > se.sh
fi
./se.sh | grep -v "warning \(C4049\|C4761\)"

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
