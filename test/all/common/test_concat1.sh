#!/bin/sh

# usage: test_concat1.sh compiler

compiler=$1
root_dir=`pwd`

$GOBO/bin/getest --$compiler > tmp1.txt 2>&1
diff tmp1.txt $GOBO/test/all/common/concat1.log
