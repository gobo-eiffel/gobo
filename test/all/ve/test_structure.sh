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

	cp $dir/ve.esd .
	vec -a:ve.esd -no
	vec -eu -y -no

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
