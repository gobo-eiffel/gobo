#!/local/bin/bash

mkdir ascii2ps
cd ascii2ps
if [ "$1" = "-boost" ]; then
	cp $GOBO/example/lexical/ascii2ps/se.sh .
else
	sed "s/-boost/-ensure_check/g" $GOBO/example/lexical/ascii2ps/se.sh > se.sh
fi
./se.sh | grep -v "warning \(C4049\|C4761\)"

if [ -x ascii2ps ]; then
	$GOBO/test/all/common/test_ascii2ps.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	echo "Test failed"
fi
