#!/bin/sh

# usage: test_getest.sh compiler

compiler=$1
root_dir=`pwd`

mkdir xtest1
cd xtest1
mkdir TESTGEN
cp $GOBO/test/time/hact.ace .
cp $GOBO/test/time/ise.ace .
cp $GOBO/test/time/loadpath.se .
cp $GOBO/test/time/ve.esd .
cp $GOBO/test/time/getest.$compiler .
$GOBO/bin/getest --$compiler > tmp1.txt
cd $root_dir
mkdir xtest2
cd xtest2
mkdir TESTGEN
cp $GOBO/test/time/hact.ace .
cp $GOBO/test/time/ise.ace .
cp $GOBO/test/time/loadpath.se .
cp $GOBO/test/time/ve.esd .
cp $GOBO/test/time/getest.$compiler .
../getest --$compiler > tmp1.txt
cd $root_dir
diff xtest1/tmp1.txt xtest2/tmp1.txt
