#!/bin/sh

# usage: test_harness.sh [--getest] [--version] [--finalize] compiler exename dirname

if [ "$1" = "--getest" ]; then
	getest=$1
	if [ "$2" = "--version" ]; then
		version=$2
		if [ "$3" = "--finalize" ]; then
			finalize=$3
			compiler=$4
			exename=$5
			dirname=$6
		else
			finalize=""
			compiler=$3
			exename=$4
			dirname=$5
		fi
	else
		version=""
		if [ "$2" = "--finalize" ]; then
			finalize=$2
			compiler=$3
			exename=$4
			dirname=$5
		else
			finalize=""
			compiler=$2
			exename=$3
			dirname=$4
		fi
	fi
else
	getest=""
	if [ "$1" = "--version" ]; then
		version=$1
		if [ "$2" = "--finalize" ]; then
			finalize=$2
			compiler=$3
			exename=$4
			dirname=$5
		else
			finalize=""
			compiler=$2
			exename=$3
			dirname=$4
		fi
	else
		version=""
		if [ "$1" = "--finalize" ]; then
			finalize=$1
			compiler=$2
			exename=$3
			dirname=$4
		else
			finalize=""
			compiler=$1
			exename=$2
			dirname=$3
		fi
	fi
fi

#$GOBO/test/all/$compiler/test_harness.sh $getest $version $finalize $exename $dirname
if [ "$getest" = "--getest" ]; then
	mkdir $exename
	cd $exename
	mkdir TESTGEN
	cp $dirname/Makefile .
	if [ "$finalize" = "--finalize" ]; then
		sed "s/$compiler-debug/$compiler/g" $dirname/getest.$compiler > getest.$compiler
	else
		cp $dirname/getest.$compiler .
	fi
	getest --$compiler
else
	echo "Preparing Test Cases"
	mkdir $exename
	cd $exename
	cp $dirname/Makefile .
	echo "Compiling Test Cases"
	if [ "$finalize" = "--finalize" ]; then
		make $compiler > tmp_compile.txt 2>&1
	else
		make $compiler-debug > tmp_compile.txt 2>&1
	fi
	$GOBO/test/all/common/test_exe.sh $version $compiler $exename
fi
