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
		cp $dirname/ise.ace .
		sed "s/es4/es4 -finalize/g" $dirname/getest.ise | sed "s/W_code/F_code/g" > getest.ise
	else
		sed "s/--assertion (all)/assertion (all)/g" $dirname/ise.ace > ise.ace
		cp $dirname/getest.ise getest.ise
	fi
	getest --ise
else
	echo "Preparing Test Cases"
	mkdir $exename
	cd $exename
	if [ "$finalize" = "--finalize" ]; then
		cp $dirname/ise.ace Ace.ace
		echo "Compiling Test Cases"
		echo q | es4 -finalize > tmp_compile.txt 2>&1
		mv tmp_compile.txt EIFGEN/F_code
		cd EIFGEN/F_code
		finish_freezing -silent >> tmp_compile.txt 2>&1
	else
		sed "s/--assertion (all)/assertion (all)/g" $dirname/ise.ace > Ace.ace
		echo "Compiling Test Cases"
		echo q | es4  > tmp_compile.txt 2>&1
		mv tmp_compile.txt EIFGEN/W_code
		cd EIFGEN/W_code
		finish_freezing -silent >> tmp_compile.txt 2>&1
	fi
	$GOBO/test/all/common/test_exe.sh $version ise $exename
fi
