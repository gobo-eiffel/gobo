#!/bin/sh

# Install ISE Eiffel (see https://www.eiffel.org/setup/)

export TRAVIS_ISE_VERSION=20.05_rev_104521
if [ "$TRAVIS_OS_NAME" = "linux" ]; then export TRAVIS_ISE_PLATFORM=linux-x86-64; fi
if [ "$TRAVIS_OS_NAME" = "osx" ]; then export TRAVIS_ISE_PLATFORM=macosx-x86-64; fi

cd $GOBO/..
curl -sSL https://www.eiffel.org/setup/install.sh | bash -s -- --url https://ftp.eiffel.com/pub/beta/nightly/Eiffel_$TRAVIS_ISE_VERSION-$TRAVIS_ISE_PLATFORM.tar.bz2 > eiffel.rc
source ./eiffel.rc
# Make sure that we are using our version of the Gobo tools.
rm -rf $ISE_EIFFEL/library/gobo/spec
echo `ec -version`
cd $GOBO
