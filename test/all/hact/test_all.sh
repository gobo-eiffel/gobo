#!/bin/sh

# usage: test_all.sh [-debug]

GOBO=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO

cp $GOBO/test/all/hact/Makefile .
make all$1
make calculator$1
