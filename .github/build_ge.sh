#!/bin/sh

# Build Gobo Eiffel executables.

if [ "$RUNNER_OS" = "Linux" ]; then export GITHUB_GE_C_COMPILER=gcc; fi
if [ "$RUNNER_OS" = "macOS" ]; then export GITHUB_GE_C_COMPILER=clang; fi

export GOBO=$GITHUB_WORKSPACE
$GOBO/bin/install.sh -v $GITHUB_GE_C_COMPILER
export PATH=$PATH:$GOBO/bin
gec --version
