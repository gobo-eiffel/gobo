#!/bin/sh

# description: "Bootstrap Gobo Eiffel package"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2001, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


# usage: bootstrap.sh <c_compiler> <eiffel_compiler>


CC=$1
EIF=$2

gobo_usage() {
	echo "usage: bootstrap.sh <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  cl | bcc32 | lcc | gcc | no_c"
	echo "   elffel_compiler:  ise | hact | se | ve"
}

if [ "$GOBO" = "" ]; then
	echo "Environment variable GOBO must be set"
	exit 1
fi

if [ "$GOBO_OS" = "" ]; then
	echo "Environment variable GOBO_OS must be set"
	exit 1
elif [ "$GOBO_OS" = "windows" ]; then
	CP=copy
	MV=rename
	RM=del
	OBJ=.obj
	EXE=.exe
else
	CP=cp
	MV=mv
	RM=rm
	OBJ=.o
	EXE=
fi

BIN_DIR=$GOBO/bin
cd $GOBO/work/bootstrap

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
elif [ "$CC" = "cl" ]; then
	CFLAGS='-O2 -nologo -D"WIN32" -w'
	$CC $CFLAGS -o$BIN_DIR/gexace$EXE gexace.c
	$RM gexace$OBJ
	$CC $CFLAGS -o$BIN_DIR/geant$EXE geant.c
	$RM geant$OBJ
	$CC $CFLAGS% -o$BIN_DIR/gelex$EXE gelex.c
	$RM gelex$OBJ
	$CC $CFLAGS -o$BIN_DIR/geyacc$EXE geyacc.c
	$RM geyacc$OBJ
	$CC $CFLAGS -o$BIN_DIR/gepp$EXE gepp.c
	$RM gepp$OBJ
elif [ "$CC" = "bcc32" ]; then
	CFLAGS='-5 -w-aus -w-par -w-rvl -O2 -O-v'
	$CC $CFLAGS -ogexace$EXE gexace.c
	$CP gexace$EXE $BIN_DIR
	$RM gexace$EXE gexace.tds
	$CC $CFLAGS -ogeant$EXE geant.c
	$CP geant$EXE $BIN_DIR
	$RM geant$EXE geant.tds
	$CC $CFLAGS -ogelex$EXE gelex.c
	$CP gelex$EXE $BIN_DIR
	$RM gelex$EXE gelex.tds
	$CC $CFLAGS -ogeyacc$EXE geyacc.c
	$CP geyacc$EXE $BIN_DIR
	$RM geyacc$EXE geyacc.tds
	$CC $CFLAGS -ogepp$EXE gepp.c
	$CP gepp$EXE $BIN_DIR
	$RM gepp$EXE gepp.tds
elif [ "$CC" = "lcc" ]; then
	CFLAGS='-O'
	LNK='lcclnk'
	LNKFLAGS='-s'
	$CC $CFLAGS gexace.c
	$LNK $LNKFLAGS -o $BIN_DIR/gexace$EXE gexace$OBJ
	$RM gexace$OBJ
	$CC $CFLAGS geant.c
	$LNK $LNKFLAGS -o $BIN_DIR/geant$EXE geant$OBJ
	$RM geant$OBJ
	$CC $CFLAGS gelex.c
	$LNK $LNKFLAGS -o $BIN_DIR/gelex$EXE gelex$OBJ
	$RM gelex$OBJ
	$CC $CFLAGS geyacc.c
	$LNK $LNKFLAGS -o $BIN_DIR/geyacc$EXE geyacc$OBJ
	$RM geyacc$OBJ
	$CC $CFLAGS gepp.c
	$LNK $LNKFLAGS -o $BIN_DIR/gepp$EXE gepp$OBJ
	$RM gepp$OBJ
elif [ "$CC" = "gcc" ]; then
	CFLAGS='-O2'
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
elif [ "$CC" = "no_c" ]; then
	echo "No C compilation"
else
	echo "Unknown C compiler: $CC"
	exit 1
fi

if [ "$EIF" = "ise" ]; then
	GOBO_EIFFEL=ise
	export GOBO_EIFFEL
elif [ "$EIF" = "hact" ]; then
	GOBO_EIFFEL=hact
	export GOBO_EIFFEL
elif [ "$EIF" = "se" ]; then
	GOBO_EIFFEL=se
	export GOBO_EIFFEL
elif [ "$EIF" = "ve" ]; then
	GOBO_EIFFEL=ve
	export GOBO_EIFFEL
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

cd $GOBO
geant bootstrap1
cd $BIN_DIR
$RM geant$EXE
$MV geant1$EXE geant$EXE
cd $GOBO
geant bootstrap2
cd $BIN_DIR
