#!/bin/sh

# usage: test_all.sh [-debug]


cp $GOBO/test/all/hact/Makefile .
make all$1
make calculator$1
