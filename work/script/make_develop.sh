#!/bin/sh

# usage: make_develop <platform> <binaries> <compiler>
if [ -z "$1" ]; then platform="windows"; else platform=$1; fi
if [ -z "$2" ]; then binaries="bin"; else binaries=$2; fi
if [ -z "$3" ]; then compiler="se"; else compiler=$3; fi

rootdir=`pwd`

# Checkout source code from CVS repository.
cvs checkout -P gobo

# Set environment variable $GOBO.
GOBO=$rootdir/gobo
GOBO=`echo $GOBO | sed "s/^\/\/\([a-zA-Z]\)\//\1:\//g"`
export GOBO
echo ''; echo "#### \$GOBO = $GOBO"

# Get binaries to allow bootstraping.
cd $rootdir
cd $binaries
cp * $GOBO/bin
cd $rootdir

# Build Gobo files.
$GOBO/work/script/make_gobo.sh $platform $compiler

cd $rootdir
