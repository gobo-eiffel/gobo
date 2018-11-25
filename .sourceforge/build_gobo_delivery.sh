#!/bin/sh

# description: "Build Gobo packages under Linux"
# copyright: "Copyright (c) 2018, Eric Bezault and others"
# license: "MIT License"


# usage: build_gobo_delivery.sh <gobo_version>

git_clone_gobo.sh gobo						# get code from repository
cd gobo; export GOBO=`pwd`					# set environment variable
bin/install.sh -v --thread=1 gcc				# compile bin
PATH=$PATH:$GOBO/bin						# set path
ARCH=`arch`							# get architecture
VERSION=$1							# get Gobo version
cd bin; tar -cvf gobo${VERSION}-bin-linux-${ARCH}.tar ge*	# tar bin
gzip gobo${VERSION}-bin-linux-${ARCH}.tar			# gzip bin
mv gobo${VERSION}-bin-linux-${ARCH}.tar.gz ../..		# move package
cd $GOBO; geant delivery; rm -rf .git; rm -f bin/ge*		# create delivery
cd ..; tar -cvf gobo${VERSION}-src.tar gobo/			# tar src
gzip gobo${VERSION}-src.tar					# gzip src
rm -rf gobo							# clean up


