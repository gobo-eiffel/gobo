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
		cp $dir/ise.ace Ace.ace
		es4 -finalize | grep -v "\(Degree\|Generation of auxiliary files\|You must now run\|EIFGEN[\\/]F_code$\|Features done:\)"
		cd EIFGEN/F_code
		finish_freezing -silent > tmp11.txt 2>&1
	else
		sed "s/--assertion (all)/assertion (all)/g" $dir/ise.ace > Ace.ace
		es4 | grep -v "\(Degree\|Generation of auxiliary files\|You must now run\|EIFGEN[\\/]W_code$\)"
		cd EIFGEN/W_code
		finish_freezing -silent > tmp11.txt 2>&1
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
