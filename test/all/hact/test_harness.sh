#!/bin/sh

# usage: test_harness.sh [--getest] [--version] [--finalize] exename dirname

if [ "$1" = "--getest" ]; then
	getest=$1
	if [ "$2" = "--version" ]; then
		version=$2
		if [ "$3" = "--finalize" ]; then
			finalize=$3
			exename=$4
			dirname=$5
		else
			finalize=""
			exename=$3
			dirname=$4
		fi
	else
		version=""
		if [ "$2" = "--finalize" ]; then
			finalize=$2
			exename=$3
			dirname=$4
		else
			finalize=""
			exename=$2
			dirname=$3
		fi
	fi
else
	getest=""
	if [ "$1" = "--version" ]; then
		version=$1
		if [ "$2" = "--finalize" ]; then
			finalize=$2
			exename=$3
			dirname=$4
		else
			finalize=""
			exename=$2
			dirname=$3
		fi
	else
		version=""
		if [ "$1" = "--finalize" ]; then
			finalize=$1
			exename=$2
			dirname=$3
		else
			finalize=""
			exename=$1
			dirname=$2
		fi
	fi
fi

if [ "$getest" = "--getest" ]; then
	mkdir $exename
	cd $exename
	mkdir TESTGEN
	if [ "$finalize" = "--finalize" ]; then
		cp $dirname/hact.ace .
		sed "s/-executable/-executable -finalize/g" $dirname/getest.hact | sed "s/W_code/F_code/g" > getest.hact
	else
		sed "s/--assertion (all)/assertion (all)/g" $dirname/hact.ace > hact.ace
		cp $dirname/getest.hact getest.hact
	fi
	getest --hact
else
	echo "Preparing Test Cases"
	mkdir $exename
	cd $exename
	if [ "$finalize" = "--finalize" ]; then
		cp $dirname/hact.ace Ace.ace
		echo "Compiling Test Cases"
		echo q | ibcomp -executable -finalize -new -project $exename.eif > tmp_compile.txt 2>&1
		mv tmp_compile.txt ${exename}_gen/F_code
		cd ${exename}_gen/F_code
		fish >> tmp_compile.txt 2>&1
	else
		sed "s/--assertion (all)/assertion (all)/g" $dirname/hact.ace > Ace.ace
		echo "Compiling Test Cases"
		echo q | ibcomp -executable -new -project $exename.eif > tmp_compile.txt 2>&1
		mv tmp_compile.txt ${exename}_gen/W_code
		cd ${exename}_gen/W_code
		fish >> tmp_compile.txt 2>&1
	fi
	$GOBO/test/all/common/test_exe.sh $version hact $exename
fi
