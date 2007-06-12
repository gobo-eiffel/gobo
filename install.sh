#!/bin/sh

# description: "Install Gobo Eiffel package"
# copyright: "Copyright (c) 2007, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: install.sh [-v] <c_compiler>


gobo_usage() {
	echo "usage: install.sh [-v] <c_compiler>"
	echo "   c_compiler:  msc | bcc | gcc | tcc | no_c"
}

if [ "$1" = "-v" ]; then
	VERBOSE=-v
	CC=$2
	EIF=ge
else
	VERBOSE=
	CC=$1
	EIF=ge
fi

if [ "$GOBO" = "" ]; then
	echo "Environment variable GOBO must be set"
	exit 1
fi

CP=cp
MV=mv
RM=rm
OBJ=.o
EXE=
BIN_DIR=$GOBO/bin

cd $BIN_DIR

if [ "$CC" = "" ]; then
	gobo_usage
	exit 1
elif [ "$CC" = "-help" ]; then
	gobo_usage
	exit 0
elif [ "$CC" = "-h" ]; then
	gobo_usage
	exit 0
elif [ "$CC" = "-?" ]; then
	gobo_usage
	exit 0
elif [ "$CC" = "/h" ]; then
	gobo_usage
	exit 0
elif [ "$CC" = "/?" ]; then
	gobo_usage
	exit 0
elif [ "$EIF" = "" ]; then
	gobo_usage
	exit 1
elif [ "$CC" = "msc" -o "$CC" = "cl" ]; then
	CC=cl
	CFLAGS='-O2 -nologo -wd4049'
	$CC $CFLAGS -o$BIN_DIR/gec$EXE gec.c
	$RM gec$OBJ
elif [ "$CC" = "bcc" -o "$CC" = "bcc32" ]; then
	CC=bcc32
	CFLAGS='-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2'
	$CC $CFLAGS -ogec$EXE gec.c
	$CP gec$EXE $BIN_DIR
	$RM gec$EXE gec.tds
	GOBO_CC=bcc
	export GOBO_CC
#elif [ "$CC" = "lcc" ]; then
#	CFLAGS='-O'
#	LNK='lcclnk'
#	LNKFLAGS='-s'
#	$CC $CFLAGS gec.c
#	$LNK $LNKFLAGS -o $BIN_DIR/gec$EXE gec$OBJ
#	$RM gec$OBJ
#	GOBO_CC=lcc
#	export GOBO_CC
elif [ "$CC" = "gcc" ]; then
#	CFLAGS='-O2'
	CFLAGS=''
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
elif [ "$CC" = "tcc" ]; then
	CFLAGS='-O2'
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
	GOBO_CC=tcc
	export GOBO_CC
elif [ "$CC" = "no_c" ]; then
	echo "No C compilation"
else
	echo "Unknown C compiler: $CC"
	exit 1
fi

if [ "$EIF" = "ge" ]; then
	GOBO_EIFFEL=ge
	export GOBO_EIFFEL
	cd $BIN_DIR
	$BIN_DIR/gec$EXE --finalize $GOBO/src/geant/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gexace/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gelex/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/geyacc/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gepp/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/getest/ge.ace
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gelint/ge.ace
	$BIN_DIR/gec$EXE $GOBO/src/gexslt/ge.ace
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

PATH=$BIN_DIR:$PATH
export PATH
cd $BIN_DIR
geant $VERBOSE --buildfilename=$GOBO/src/gec/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/geant/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/gexace/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/gelex/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/geyacc/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/gepp/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/getest/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/gelint/build.eant clean
geant $VERBOSE --buildfilename=$GOBO/src/gexslt/build.eant clean
