#!/bin/sh

# Install ISE Eiffel (see https://www.eiffel.org/setup/)

cd $GOBO/..
if [ "$TRAVIS_OS_NAME" = "linux" ]; then export TRAVIS_ISE_PLATFORM=linux-x86-64; fi
if [ "$TRAVIS_OS_NAME" = "osx" ]; then export TRAVIS_ISE_PLATFORM=macosx-x86-64; fi
curl -sSL https://www.eiffel.org/setup/install.sh | bash -s -- --url https://ftp.eiffel.com/pub/beta/nightly/Eiffel_20.05_rev_104521-$TRAVIS_ISE_PLATFORM.tar.bz2 > eiffel.rc
source ./eiffel.rc
# Make sure that we are using our version of the Gobo tools.
rm -rf $ISE_EIFFEL/library/gobo/spec
echo `ec -version`
cd $GOBO
