#!/bin/sh

# usage: make_bin <bin_directory>

root_dir=`pwd`

mkdir gelex
cd gelex
cp $GOBO/src/gelex/Makefile .
make se
cd $root_dir
cp gelex/gelex $1
cp gelex/gelex.exe $1
rm -rf gelex

mkdir geyacc
cd geyacc
cp $GOBO/src/geyacc/Makefile .
make se
cd $root_dir
cp geyacc/geyacc $1
cp geyacc/geyacc.exe $1
rm -rf geyacc

mkdir gepp
cd gepp
cp $GOBO/src/gepp/Makefile .
make se
cd $root_dir
cp gepp/gepp $1
cp gepp/gepp.exe $1
rm -rf gepp

mkdir getest
cd getest
cp $GOBO/src/getest/Makefile .
make se
cd $root_dir
cp getest/getest $1
cp getest/getest.exe $1
rm -rf getest
