#!/bin/sh

# usage: make_delivery <platform> <binaries>


rootdir=`pwd`

# Checkout source code from CVS repository.
cvs export -D now gobo

# Set environment variable $GOBO.
cd gobo
GOBO=`pwd`
GOBO=`echo $GOBO | sed "s/^\/\/\([a-zA-Z]\)\//\1:\//g"`
export GOBO
echo ''; echo "#### \$GOBO = $GOBO"

# Get binaries to allow bootstraping.
cd $rootdir
cd $2
cp * $GOBO/bin
cd $rootdir

# Build Gobo files.
$GOBO/work/script/make_gobo.sh $1

# Remove hidden files.
rm -rf $GOBO/work
rm -rf $GOBO/doc/structure/visio
rm -rf $GOBO/doc/time/visio

cd $rootdir
