#!/local/bin/bash

mkdir precomp_base
cd precomp_base
cp $GOBO/test/precomp/ise_base.ace Ace.ace
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
