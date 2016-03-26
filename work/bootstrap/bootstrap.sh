#!/bin/sh

# description: "Bootstrap Gobo Eiffel package"
# copyright: "Copyright (c) 2001-2013, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: bootstrap.sh [-v][--delivery] <c_compiler> <eiffel_compiler>


gobo_usage() {
	echo "usage: bootstrap.sh [-v][--delivery] <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  msc | lcc-win32 | bcc | gcc | mingw | cc | icc | tcc | no_c"
	echo "   eiffel_compiler:  ge | ise"
}

if [ "$1" = "-v" ]; then
	if [ "$2" = "--delivery" ]; then
		VERBOSE=-v
		DELIVERY=--delivery
		CC=$3
		EIF=$4
	else
		VERBOSE=-v
		DELIVERY=
		CC=$2
		EIF=$3
	fi
else
	if [ "$1" = "--delivery" ]; then
		VERBOSE=
		DELIVERY=--delivery
		CC=$2
		EIF=$3
	else
		VERBOSE=
		DELIVERY=
		CC=$1
		EIF=$2
	fi
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
BOOTSTRAP_DIR=$GOBO/work/bootstrap

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
	$RM gec*$OBJ

	$CC $CFLAGS -c $BOOTSTRAP_DIR/gexace4.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gexace3.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gexace2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gexace1.c
	$LD $LFLAGS ${LFLAG_OUT}gexace$EXE gexace*$OBJ $LLIBS
	$RM gexace*$OBJ

	$CC $CFLAGS -c $BOOTSTRAP_DIR/geant5.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/geant4.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/geant3.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/geant2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/geant1.c
	$LD $LFLAGS ${LFLAG_OUT}geant$EXE geant*$OBJ $LLIBS
	$RM geant*$OBJ

	$CC $CFLAGS -c $BOOTSTRAP_DIR/gelex2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/gelex1.c
	$LD $LFLAGS ${LFLAG_OUT}gelex$EXE gelex*$OBJ $LLIBS
	$RM gelex*$OBJ

	$CC $CFLAGS -c $BOOTSTRAP_DIR/geyacc2.c
	$CC $CFLAGS -c $BOOTSTRAP_DIR/geyacc1.c
	$LD $LFLAGS ${LFLAG_OUT}geyacc$EXE geyacc*$OBJ $LLIBS
	$RM geyacc*$OBJ

	$CC $CFLAGS -c $BOOTSTRAP_DIR/gepp1.c
	$LD $LFLAGS ${LFLAG_OUT}gepp$EXE gepp*$OBJ $LLIBS
	$RM gepp*$OBJ
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
	GOBO_EIFFEL=ge
	export GOBO_EIFFEL
elif [ "$EIF" = "ise" ]; then
	GOBO_EIFFEL=ise
	export GOBO_EIFFEL
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

PATH=$BIN_DIR:$PATH
export PATH
cd $BIN_DIR
$CP geant$EXE geant1$EXE
cd $GOBO
geant1 $VERBOSE bootstrap1
if [ $? -gt 0 ]; then exit 1; fi
cd $BIN_DIR
$RM geant1$EXE
cd $GOBO
geant $VERBOSE bootstrap2
if [ $? -gt 0 ]; then exit 1; fi
if [ "$DELIVERY" = "--delivery" ]; then
	cd $GOBO
	geant $VERBOSE delivery
	cd $BIN_DIR
	$RM geant$EXE
	cd $GOBO
fi
