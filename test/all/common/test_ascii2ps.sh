#!/local/bin/bash

./ascii2ps $GOBO/test/all/common/sample.e toto.ps > tmp1.txt 2>&1
if [ -s tmp1.txt ]; then
	echo "./ascii2ps \$GOBO/test/all/common/sample.e toto.ps"
	cat tmp1.txt
else
	diff $GOBO/test/all/common/sample.ps toto.ps > tmp2.txt 2>&1
	if [ -s tmp2.txt ]; then
		echo "diff \$GOBO/test/all/common/sample.ps toto.ps"
		cat tmp2.txt
	fi
fi
