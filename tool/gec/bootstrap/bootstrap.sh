#!/bin/sh

# description: "Bootstrap Gobo Eiffel Compiler in $GOBO/bin"
# copyright: "Copyright (c) 2016, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: bootstrap.sh [-v] <c_compiler>


gobo_usage() {
	echo "usage: bootstrap.sh [-v] <c_compiler>"
	echo "   c_compiler:  msc | lcc-win32 | bcc | gcc | mingw | cc | icc | tcc | no_c"
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

MV=mv
RM=rm
STRIP=strip
OBJ=.o
EXE=
BIN_DIR=$GOBO/bin
BOOTSTRAP_DIR=$GOBO/tool/gec/bootstrap

cd $BIN_DIR

c_compilation() {
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec8.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec7.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec6.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec5.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec4.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec3.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec1.c
	$LD $LFLAGS ${LFLAG_OUT}gec$EXE gec*$OBJ $LLIBS
	$RM gec*$OBJ
}

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
	LD=link
	STRIP=echo
	OBJ=.obj
	EXE=.exe
	CFLAGS='-O2 -nologo -wd4049'
	LFLAGS='-nologo -subsystem:console'
	LFLAG_OUT='-out:'
	LLIBS=''
	echo msc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "bcc" -o "$CC" = "bcc32" ]; then
	CC=bcc32
	LD=bcc32
	EXE=.exe
	CFLAGS='-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2'
	LFLAGS='-5 -q'
	LFLAGS='-e'
	LLIBS=''
	echo bcc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
	$RM *.tds
elif [ "$CC" = "lcc-win32" -o "$CC" = "lcc" ]; then
	CC='lcc'
	EXE=.exe
#	CFLAGS='-O'   -- Problem when gec is compiled with the -O option.
	CFLAGS=''
	LD=lcclnk
	LFLAGS='-s -subsystem Console'
	LFLAG_OUT='-o '
	LLIBS=''
	echo lcc-win32 > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "gcc" ]; then
	CC=gcc
	LD=gcc
#	CFLAGS='-O2'
	CFLAGS=''
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS='-lm'
	echo gcc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "mingw" ]; then
	CC=gcc
	LD=gcc
	EXE=.exe
#	CFLAGS='-O2'
	CFLAGS=''
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS='-lm'
	echo mingw > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "cc" ]; then
	CC='cc'
	LD=cc
	CFLAGS='-fast'
	LDFLAGS='-lm'
	LFLAG_OUT='-o '
	LLIBS=''
	echo cc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "icc" ]; then
	CC=icc
	LD=icc
	CFLAGS='-O2'
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS=''
	echo icc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "tcc" ]; then
	CC=tcc
	LD=tcc
	CFLAGS='-O2'
	LDFLAGS='-lm'
	LFLAG_OUT='-o '
	LLIBS=''
	echo tcc > $GOBO/tool/gec/config/c/default.cfg
	c_compilation
elif [ "$CC" = "no_c" ]; then
	echo "No C compilation"
else
	echo "Unknown C compiler: $CC"
	exit 1
fi

if [ "$EIF" = "ge" ]; then
	cd $BIN_DIR
	# Compile gec twice to get a bootstrap effect.
	$MV gec$EXE gec1$EXE
	$BIN_DIR/gec1$EXE --finalize $GOBO/tool/gec/src/ge.xace
	$MV gec$EXE gec1$EXE
	$BIN_DIR/gec1$EXE --finalize $GOBO/tool/gec/src/ge.xace
	$STRIP gec$EXE
	$RM gec1$EXE
	$RM gec*.h
	$RM gec*.c
	$RM gec*$OBJ
	# Make sure 'gec.bat' exists to avoid getting some warning when removing it.
	echo "" > gec.bat
	$RM gec*.bat
	# Make sure 'gec.sh' exists to avoid getting some warning when removing it.
	echo "" > gec.sh
	$RM gec*.sh
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi
