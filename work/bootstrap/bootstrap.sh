#!/bin/sh

# description: "Bootstrap Gobo Eiffel package"
# copyright: "Copyright (c) 2001-2006, Eric Bezault and others"
# license: "Eiffel Forum License v2 (see forum.txt)"
# date: "$Date$"
# revision: "$Revision$"


# usage: bootstrap.sh [-v] <c_compiler> <eiffel_compiler>


gobo_usage() {
	echo "usage: bootstrap.sh [-v] <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  msc | bcc | lcc | gcc | no_c"
	echo "   eiffel_compiler:  ge | ise | se | ve"
}

if [ "$1" = "-v" ]; then
	VERBOSE=-v
	CC=$2
	EIF=$3
else
	VERBOSE=
	CC=$1
	EIF=$2
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
elif [ "$CC" = "msc" -o "$CC" = "cl" ]; then
	CC=cl
	CFLAGS='-O2 -nologo -D"WIN32" -w'
	$CC $CFLAGS -o$BIN_DIR/gec$EXE gec.c
	$RM gec$OBJ
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
elif [ "$CC" = "bcc" -o "$CC" = "bcc32" ]; then
	CC=bcc32
	CFLAGS='-5 -w-aus -w-par -w-rvl -O2 -O-v'
	$CC $CFLAGS -ogec$EXE gec.c
	$CP gec$EXE $BIN_DIR
	$RM gec$EXE gec.tds
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
	$CC $CFLAGS gec.c
	$LNK $LNKFLAGS -o $BIN_DIR/gec$EXE gec$OBJ
	$RM gec$OBJ
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
#	CFLAGS='-O2'
	CFLAGS=''
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
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

if [ "$EIF" = "ge" ]; then
	GOBO_EIFFEL=ge
	export GOBO_EIFFEL
elif [ "$EIF" = "ise" ]; then
	GOBO_EIFFEL=ise
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

PATH=$BIN_DIR:$PATH
export PATH
cd $BIN_DIR
$MV geant$EXE geant1$EXE
cd $GOBO
geant1 $VERBOSE bootstrap1
if [ $? -gt 0 ]; then exit 1; fi
cd $BIN_DIR
$RM geant1$EXE
cd $GOBO
geant $VERBOSE bootstrap2
if [ $? -gt 0 ]; then exit 1; fi
