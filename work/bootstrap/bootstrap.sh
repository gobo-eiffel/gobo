#!/bin/sh

# usage: bootstrap.sh <c_compiler> <eiffel_compiler>


CC=$1
EIF=$2
CP=cp
RM=rm
BIN_DIR=$GOBO/bin
OBJ=.o
EXE=

gobo_usage() {
	echo "usage: bootstrap.bat <c_compiler> <eiffel_compiler>"
}

gobo_install() {
	exit 0
}

gobo_bootstrap() {
	exit 0
}

gobo_cl() {
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
}

gobo_bcc32() {
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
}

gobo_lcc() {
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
}

gobo_gcc() {
	CFLAGS='-O2'
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
}


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
	gobo_cl
	gobo_install
elif [ "$CC" = "bcc32" ]; then
	gobo_bcc32
	gobo_install
elif [ "$CC" = "lcc" ]; then
	gobo_lcc
	gobo_install
elif [ "$CC" = "gcc" ]; then
	gobo_gcc
	gobo_install
elif [ "$CC" = "no_c" ]; then
	gobo_install
else
	echo "Unknown C compiler: $CC"
	exit 1
fi
