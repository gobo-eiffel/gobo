#!/local/bin/bash

mkdir ascii2ps
cd ascii2ps
if [ "$1" = "-finalize" ]; then
	cp $GOBO/example/lexical/ascii2ps/hact.ace Ace.ace
	ibcomp -executable -finalize -new -ace Ace.ace -project toto.eif | grep -v "\(Degree\|Generating global files\|Features marked\|You must now run\|toto_gen[\\/]F_code$\)"
	cd toto_gen/F_code
	fish > tmp11.txt 2>&1
else
	sed "s/--assertion (all)/assertion (all)/g" $GOBO/example/lexical/ascii2ps/hact.ace > Ace.ace
	ibcomp -executable -new -ace Ace.ace -project toto.eif | grep -v "\(Degree\|Generating global files\|You must now run\|toto_gen[\\/]W_code$\)"
	cd toto_gen/W_code
	fish > tmp11.txt 2>&1
fi

if [ -x ascii2ps ]; then
	$GOBO/test/all/common/test_ascii2ps.sh > tmp12.txt 2>&1
	if [ -s tmp12.txt ]; then
		cat tmp12.txt
		echo "Test failed"
	else
		echo "Test successful"
	fi
else
	cat tmp11.txt
	echo "Test failed"
fi
