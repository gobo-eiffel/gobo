#!/bin/sh

# usage: make_bin <bin_directory>

root_dir=`pwd`
GOBO_WINDOWS=`echo $GOBO | sed "s/^\/\/\([a-zA-Z]\)\//\1:\//g"`
GOBO=$GOBO_WINDOWS
export GOBO

mkdir gelex
cd gelex
cp $GOBO/src/gelex/Makefile .
make se
cd $root_dir
if [ -x gelex/gelex ]; then
	cp gelex/gelex $1
fi
if [ -x gelex/gelex.exe ]; then
	cp gelex/gelex.exe $1
fi
rm -rf gelex

mkdir geyacc
cd geyacc
cp $GOBO/src/geyacc/Makefile .
make se
cd $root_dir
if [ -x geyacc/geyacc ]; then
	cp geyacc/geyacc $1
fi
if [ -x geyacc/geyacc.exe ]; then
	cp geyacc/geyacc.exe $1
fi
rm -rf geyacc

mkdir gepp
cd gepp
cp $GOBO/src/gepp/Makefile .
make se
cd $root_dir
if [ -x gepp/gepp ]; then
	cp gepp/gepp $1
fi
if [ -x gepp/gepp.exe ]; then
	cp gepp/gepp.exe $1
fi
rm -rf gepp

mkdir getest
cd getest
cp $GOBO/src/getest/Makefile .
make se
cd $root_dir
if [ -x getest/getest ]; then
	cp getest/getest $1
fi
if [ -x getest/getest.exe ]; then
	cp getest/getest.exe $1
fi
rm -rf getest
