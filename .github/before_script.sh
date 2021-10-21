#!/bin/sh

# To be executed before the script.

if [ "$RUNNER_OS" = "Linux" ]; then
	cat /etc/*-release
	arch
	gcc --version
fi
