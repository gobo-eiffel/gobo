#!/local/bin/bash

mkdir structure
cd structure
touch tmp200.txt
pwd=`pwd`
export pwd

GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX
for dir in `ls -d $GOBO_UNIX/test/structure/test*` ; do
	mkdir `basename $dir`
	cd `basename $dir`

	if [ "$1" = "-finalize" ]; then
		cp $dir/hact.ace Ace.ace
		ibcomp -executable -finalize -new -ace Ace.ace -project toto.eif | grep -v "\(Degree\|Generating global files\|Features marked\|You must now run\|toto_gen[\\/]F_code$\)"
		cd toto_gen/F_code
		fish > tmp11.txt 2>&1
	else
		sed "s/--assertion (all)/assertion (all)/g" $dir/hact.ace > Ace.ace
		ibcomp -executable -new -ace Ace.ace -project toto.eif | grep -v "\(Degree\|Generating global files\|You must now run\|toto_gen[\\/]W_code$\)"
		cd toto_gen/W_code
		fish > tmp11.txt 2>&1
	fi
	if [ -x ds_tester ]; then
		./ds_tester > tmp12.txt 2>&1
		if [ -s tmp12.txt ]; then
			cat tmp12.txt >> $pwd/tmp200.txt
			echo "`basename $dir` failed" >> $pwd/tmp200.txt
		else
			diff $dir/output.txt output.txt > tmp13.txt 2>&1
			if [ -s tmp13.txt ]; then
				cat tmp13.txt >> $pwd/tmp200.txt
				echo "`basename $dir` failed" >> $pwd/tmp200.txt
			fi
		fi
	else
		cat tmp11.txt >> $pwd/tmp200.txt
		echo "`basename $dir` failed" >> $pwd/tmp200.txt
	fi

	cd $pwd
done

if [ -s tmp200.txt ]; then
	cat tmp200.txt
	echo "Test failed"
else
	echo "Test successful"
fi
