#!/bin/sh

# Install Gobo Eiffel.

export GOBO=$GITHUB_WORKSPACE
export PATH=$PATH:$GOBO/bin
chmod a+x $GOBO/bin/ge*
gec --version
