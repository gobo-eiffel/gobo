#!/local/bin/bash

mkdir precomp
cd precomp
cp $GOBO/test/precomp/ise.ace Ace.ace
es4 -precompile | grep -v "\(Degree\|Generation of auxiliary files\|You must now run\|EIFGEN[\\/]W_code$\)"
cd EIFGEN/W_code
finish_freezing -silent > tmp11.txt 2>&1
cd msc

if [ -x driver ]; then
	echo "Test successful"
else
	cat tmp11.txt
	echo "Test failed"
fi
