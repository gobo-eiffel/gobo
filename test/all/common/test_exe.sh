#!/bin/sh

# usage: test_exe.sh [--version] compiler exename

if [ "$1" = "--version" ]; then
	version=$1
	compiler=$2
	exename=$3
else
	version=""
	compiler=$1
	exename=$2
fi

echo "Running Test Cases"
if [ -x $exename ]; then
	if [ "$version" = "--version" ]; then
		./$exename --version
	fi
	$GOBO/test/all/common/test_${exename}.sh $compiler > tmp_exe.txt 2>&1
	if [ -s tmp_exe.txt ]; then
		if [ "$verbose" = "--verbose" ]; then
			cat tmp_exe.txt
		fi
		echo ""
		echo "Test Summary for $exename"
		echo ""
		echo "# Passed:     0 test"
		echo "# FAILED:     1 test"
		echo "# Aborted:    0 test"
		echo "# Total:      1 test (0 assertion)"
	else
		echo ""
		echo "Test Summary for $exename"
		echo ""
		echo "# PASSED:     1 test"
		echo "# Failed:     0 test"
		echo "# Aborted:    0 test"
		echo "# Total:      1 test (0 assertion)"
	fi
else
	if [ "$verbose" = "--verbose" ]; then
		if [ -s tmp_compile.txt ]; then
			cat tmp_compile.txt
		fi
	fi
	echo ""
	echo "Test Summary for $exename"
	echo ""
	echo "# Passed:     0 test"
	echo "# Failed:     0 test"
	echo "# ABORTED:    1 test"
	echo "# Total:      1 test (0 assertion)"
fi
