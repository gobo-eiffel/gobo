#!/local/bin/bash

./eiffel_scanner 2 $GOBO/test/all/common/sample.e > tmp1.txt 2>&1
if [ -s tmp1.txt ]; then
	echo "./eiffel_scanner 2 \$GOBO/test/all/common/sample.e"
	cat tmp1.txt
fi
