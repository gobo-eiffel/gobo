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
	cp $dirname/Makefile .
	if [ "$finalize" = "--finalize" ]; then
		sed "s/hact-debug/hact/g" $dirname/getest.hact | sed "s/W_code/F_code/g" > getest.hact
	else
		cp $dirname/getest.hact .
	fi
	getest --hact
else
	echo "Preparing Test Cases"
	mkdir $exename
	cd $exename
	cp $dirname/Makefile .
	echo "Compiling Test Cases"
	if [ "$finalize" = "--finalize" ]; then
		make hact > tmp_compile.txt 2>&1
	else
		make hact-debug > tmp_compile.txt 2>&1
	fi
	$GOBO/test/all/common/test_exe.sh $version hact $exename
fi
