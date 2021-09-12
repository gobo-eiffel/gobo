#!/bin/sh

# Install ISE Eiffel (see https://www.eiffel.org/setup/)

cd $GOBO
apt-get update
apt-get -y install libgtk2.0-0
export GITLAB_ISE_PLATFORM=linux-x86-64
export GITLAB_ISE_VERSION=20.05_rev_104521
curl -sSL https://www.eiffel.org/setup/install.sh | bash -s -- --url https://ftp.eiffel.com/pub/beta/nightly/Eiffel_$GITLAB_ISE_VERSION-$GITLAB_ISE_PLATFORM.tar.bz2 > eiffel.rc
source ./eiffel.rc
# Make sure that we are using our version of the Gobo tools.
rm -rf $ISE_EIFFEL/library/gobo/spec
echo `ec -version`
cd $GOBO
