#!/bin/sh

# Install ISE Eiffel (see https://www.eiffel.org/setup/)

export GITHUB_ISE_VERSION=20.05_rev_104521
if [ "$RUNNER_OS" = "Linux" ]; then export GITHUB_ISE_PLATFORM=linux-x86-64; fi
if [ "$RUNNER_OS" = "macOS" ]; then export GITHUB_ISE_PLATFORM=macosx-x86-64; fi

if [ "$RUNNER_OS" = "Linux" ]; then
    sudo apt-get update
    sudo apt-get -y install libgtk2.0-0
fi

cd $GOBO
curl -sSL https://www.eiffel.org/setup/install.sh | bash -s -- --url https://ftp.eiffel.com/pub/beta/nightly/Eiffel_$GITHUB_ISE_VERSION-$GITHUB_ISE_PLATFORM.tar.bz2 > eiffel.rc
source ./eiffel.rc
# Make sure that we are using our version of the Gobo tools.
rm -rf $ISE_EIFFEL/library/gobo/spec
echo `ec -version`
cd $GOBO
