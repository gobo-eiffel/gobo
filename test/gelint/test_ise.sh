#!/bin/sh

root_dir=`pwd`
export root_dir

GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX

for dir in `ls -d $GOBO_UNIX/test/gelint/*/*/test*` ; do
	cd $dir
	if [ -r Makefile ]; then
		make -s ise
	fi
	cd $root_dir
done
