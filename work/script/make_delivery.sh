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
cd $GOBO
rm -rf work
rm -rf doc/structure/visio
rm -rf doc/time/visio
find . -name ".cvsignore" -print -exec rm -f {} \;
cd $rootdir
