#!/bin/sh

# usage: make_develop <platform> <binaries>

cvs checkout gobo

cp $2/* gobo/bin
cd gobo

GOBO=`pwd`
export GOBO

cat $GOBO/misc/platform.make | \
sed "s/^GOBO_PLATFORM/#GOBO_PLATFORM/g" | \
sed "s/^#GOBO_PLATFORM=$1/GOBO_PLATFORM=$1/g" > $GOBO/misc/platform.make

cd $GOBO/library/kernel
make depend spec
cd $GOBO/library/utility
make depend spec

cd $GOBO/src/gelex
make depend ise.ace hact.ace
cd $GOBO/src/gelint
make depend ise.ace hact.ace
cd $GOBO/src/gepp
make depend ise.ace hact.ace
make parser scanner
cd $GOBO/src/getest
make depend ise.ace hact.ace
cd $GOBO/src/geyacc
make depend ise.ace hact.ace
