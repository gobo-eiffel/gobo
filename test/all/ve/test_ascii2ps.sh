#!/local/bin/bash

mkdir ascii2ps
cd ascii2ps
cp $GOBO/example/lexical/ascii2ps/ve.esd .
vec -a:ve.esd -no
vec -eu -y -no

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
