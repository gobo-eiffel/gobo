#!/bin/sh

./clock > tmp1.txt 2> tmp2.txt
if [ -s tmp2.txt ]; then
	echo "./clock"
	cat tmp2.txt
fi
