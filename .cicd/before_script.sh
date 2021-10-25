#!/bin/sh

# description: "To be executed before the script"
# copyright: "Copyright (c) 2021, Eric Bezault and others"
# license: "MIT License"

# usage: before_script.sh <ci_tool>

usage() {
	echo "usage: before_script.sh <ci_tool>"
	echo "   ci_tool:  github | gitlab | travis"
}

if [ $# -ne 1 ]; then
	usage()
	exit 1
fi

CI_TOOL=$1

if [ "$CI_TOOL" = "github" ]; then
	export GOBO=$GITHUB_WORKSPACE
	if [ "$RUNNER_OS" = "Linux" ]; then
		export GOBO_CI_OS="linux"
	elif [ "$RUNNER_OS" = "MacOS" ]; then
		export GOBO_CI_OS="macos"
	else
		echo "Platform not supported: $RUNNER_OS"
		exit 1
	fi
elif [ "$CI_TOOL" = "gitlab" ]; then
	export GOBO=$CI_PROJECT_DIR
	if [ "$RUNNER_OS" = "linux" ]; then
		export GOBO_CI_OS="linux"
	elif [ "$RUNNER_OS" = "macos" ]; then
		export GOBO_CI_OS="macos"
	else
		echo "Platform not supported: $RUNNER_OS"
		exit 1
	fi
elif [ "$CI_TOOL" = "travis" ]; then
	export GOBO=$TRAVIS_BUILD_DIR
	if [ "$TRAVIS_OS_NAME" = "linux" ]; then
		export GOBO_CI_OS="linux"
	elif [ "$TRAVIS_OS_NAME" = "osx" ]; then
		export GOBO_CI_OS="macos"
	else
		echo "Platform not supported: $TRAVIS_OS_NAME"
		exit 1
	fi
else
	echo "CI tool not supported: $CI_TOOL"
	exit 1
fi

if [ "$GOBO_CI_OS" = "linux" ]; then
	export GOBO_CI_C_COMPILER="gcc"
	export GOBO_CI_BUILD_SCRIPT="install.sh"
	cat "/etc/*-release"
	arch
	gcc --version
elif [ "$GOBO_CI_OS" = "macos" ]; then
	export GOBO_CI_C_COMPILER="clang"
	export GOBO_CI_BUILD_SCRIPT="install.sh"
	clang --version
fi

export PATH=$PATH:$GOBO/bin
