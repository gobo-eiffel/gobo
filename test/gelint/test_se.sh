#!/bin/sh

mkdir gelint
cd gelint
pwd=`pwd`
export pwd

GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX
for dir in `ls -d $GOBO_UNIX/test/gelint/*/*/*_test*` ; do
	mkdir `basename $dir`
	cd `basename $dir`
	cp $dir/* .
	./se.sh > tmp11.txt 2>&1
	grep -v "warning \(C4049\|C4761\|D4002\)" tmp11.txt > tmp12.txt

	if [ -x a ]; then
		./a >> tmp12.txt 2>&1
	fi
	sed "s/(.*\([a-zA-Z0-9_]\+\.e\))/(\1)/g" tmp12.txt > tmp13.txt
	if [ -r $dir/successful.se ]; then
		sed "s/(.*\([a-zA-Z0-9_]\+\.e\))/(\1)/g" $dir/successful.se > tmp14.txt
		diff tmp13.txt tmp14.txt > tmp15.txt 2>&1
		if [ ! -s tmp15.txt ]; then
			echo "`basename $dir`	successful"
			touch known
		fi
	fi
	if [ ! -r known -a -r $dir/failed.se ]; then
		sed "s/(.*\([a-zA-Z0-9_]\+\.e\))/(\1)/g" $dir/failed.se > tmp14.txt
		diff tmp13.txt tmp14.txt > tmp15.txt 2>&1
		if [ ! -s tmp15.txt ]; then
			echo "`basename $dir`	failed"
			touch known
		fi
	fi
	if [ ! -r known ]; then
		echo "`basename $dir`	unknown"
	fi
	cd $pwd
done
