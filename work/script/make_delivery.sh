#!/bin/sh

# usage: make_delivery <platform> <binaries>


rootdir=`pwd`

# Checkout source code from CVS repository.
cvs co -P gobo

# Set environment variable $GOBO.
GOBO=$rootdir/gobo
GOBO=`echo $GOBO | sed "s/^\/\/\([a-zA-Z]\)\//\1:\//g"`
export GOBO
echo ''; echo "#### \$GOBO = $GOBO"

# Get binaries to allow bootstraping.
cd $2
cp * $GOBO/bin
cd $rootdir

# Build Gobo files.
$GOBO/work/script/make_gobo.sh $1

# Remove develop files.
echo ''; echo "### Removing develop files..."
if [ -d $GOBO ]; then
	cd $GOBO
	rm -rf work
	rm -rf doc/structure/visio
	rm -rf doc/time/visio
	find . -name ".cvsignore" -print -exec rm -f {} \;
	find . -name "CVS" -exec rm -rf {} \; > /dev/null 2>&1
fi
cd $rootdir
