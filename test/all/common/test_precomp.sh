#!/bin/sh

# usage: test_precomp.sh compiler

compiler=$1

if [ "$compiler" = "ise" ]; then
	if [ ! -x driver -o ! -x driver-base ]; then
		cat tmp_compile.txt
	fi
	if [ ! -x driver ]; then
		echo "Precomp FAILED"
	fi
	if [ ! -x driver-base ]; then
		echo "Precomp with base FAILED"
	fi
fi
if [ "$compiler" = "hact" ]; then
	if [ ! -x driver ]; then
		cat tmp_compile.txt
		echo "Precomp FAILED"
	fi
fi
if [ "$compiler" = "se" ]; then
	if [ -s tmp_precompile.txt ]; then
		cat tmp_precompile.txt
		echo "Precomp FAILED"
	fi
fi
if [ "$compiler" = "ve" ]; then
	if [ -s Result.out ]; then
		cat Result.out
		echo "Precomp FAILED"
	fi
fi
