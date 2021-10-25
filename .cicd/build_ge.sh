#!/bin/sh

# description: "Build Gobo Eiffel executables"
# copyright: "Copyright (c) 2021, Eric Bezault and others"
# license: "MIT License"

# usage: build_ge.sh <ci_tool>

gobo_usage() {
	echo "usage: build_ge.sh <ci_tool>"
	echo "   ci_tool:  github | gitlab | travis"
}

if [ $# -ne 1 ]; then
	gobo_usage
	exit 1
fi

CI_TOOL=$1

source .cicd/before_script.sh $CI_TOOL
if [ "$CI_TOOL" = "travis" ]; then
	travis_wait 60 "$GOBO/bin/$GOBO_CI_BUILD_SCRIPT" -v -t $GOBO_CI_C_COMPILER
else
	"$GOBO/bin/$GOBO_CI_BUILD_SCRIPT" -v $GOBO_CI_C_COMPILER
fi
gec --version
