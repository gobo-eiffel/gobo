#!/local/bin/bash

mkdir precomp
cd precomp
cp $GOBO/test/precomp/se.sh .
./se.sh > tmp11.txt 2>&1

if [ -s tmp11.txt ]; then
	cat tmp11.txt
	echo "Test failed"
else
	echo "Test successful"
fi
