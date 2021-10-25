#!/bin/sh

# description: "Install Gobo Eiffel executables"
# copyright: "Copyright (c) 2021, Eric Bezault and others"
# license: "MIT License"

# usage: install_ge.sh <ci_tool>

gobo_usage() {
	echo "usage: install_ge.sh <ci_tool>"
	echo "   ci_tool:  github | gitlab | travis"
}

if [ $# -ne 1 ]; then
	gobo_usage()
	exit 1
fi

CI_TOOL=$1

source .cicd/before_script.sh $CI_TOOL
chmod a+x $GOBO/bin/ge*
gec --version
