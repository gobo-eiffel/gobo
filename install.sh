#!/bin/sh

# description: "Install Gobo Eiffel package"
# copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: install.sh [-v] <c_compiler>


gobo_usage() {
	echo "usage: install.sh [-v] <c_compiler>"
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

CP=cp
MV=mv
RM=rm
OBJ=.o
EXE=
BIN_DIR=$GOBO/bin
BOOTSTRAP_DIR=$GOBO/bin

cd $BIN_DIR

c_compilation() {
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec18.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec17.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec16.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec15.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec14.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec13.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec12.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec11.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec10.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec9.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec8.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec7.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec6.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec5.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec4.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec3.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gec1.c
	$LD $LFLAGS ${LFLAG_OUT}gec$EXE gec*$OBJ $LLIBS
	strip gec${EXE}
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
	GOBO_EIFFEL=ge
	export GOBO_EIFFEL
	cd $BIN_DIR
	$BIN_DIR/gec$EXE --finalize $GOBO/src/geant/ge.xace
	strip geant${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gexace/ge.xace
	strip gexace${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gelex/ge.xace
	strip gelex${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/geyacc/ge.xace
	strip geyacc${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gepp/ge.xace
	strip gepp${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/getest/ge.xace
	strip getest${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gelint/ge.xace
	strip gelint${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/src/gexslt/ge.xace
	strip gexslt${EXE}
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
