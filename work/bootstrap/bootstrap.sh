#!/bin/sh

# description: "Bootstrap Gobo Eiffel package"
# copyright: "Copyright (c) 2001-2007, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: bootstrap.sh [-v][--delivery] <c_compiler> <eiffel_compiler>


gobo_usage() {
	echo "usage: bootstrap.sh [-v][--delivery] <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  msc | bcc | gcc | cc | icc | tcc | no_c"
	echo "   eiffel_compiler:  ge | ise | se"
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
	CFLAGS='-O2 -nologo -wd4049'
	LFLAGS='-link -subsystem:console'
	$CC $CFLAGS -o$BIN_DIR/gec$EXE gec.c $LFLAGS
	$RM gec$OBJ
	$CC $CFLAGS -o$BIN_DIR/gexace$EXE gexace.c $LFLAGS
	$RM gexace$OBJ
	$CC $CFLAGS -o$BIN_DIR/geant$EXE geant.c $LFLAGS
	$RM geant$OBJ
	$CC $CFLAGS% -o$BIN_DIR/gelex$EXE gelex.c $LFLAGS
	$RM gelex$OBJ
	$CC $CFLAGS -o$BIN_DIR/geyacc$EXE geyacc.c $LFLAGS
	$RM geyacc$OBJ
	$CC $CFLAGS -o$BIN_DIR/gepp$EXE gepp.c $LFLAGS
	$RM gepp$OBJ
	echo msc > $GOBO/tool/gec/config/c/default.cfg
elif [ "$CC" = "bcc" -o "$CC" = "bcc32" ]; then
	CC=bcc32
	CFLAGS='-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2'
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
	echo bcc > $GOBO/tool/gec/config/c/default.cfg
#elif [ "$CC" = "lcc" ]; then
#	CFLAGS='-O'
#	LNK='lcclnk'
#	LNKFLAGS='-s'
#	$CC $CFLAGS gec.c
#	$LNK $LNKFLAGS -o $BIN_DIR/gec$EXE gec$OBJ
#	$RM gec$OBJ
#	$CC $CFLAGS gexace.c
#	$LNK $LNKFLAGS -o $BIN_DIR/gexace$EXE gexace$OBJ
#	$RM gexace$OBJ
#	$CC $CFLAGS geant.c
#	$LNK $LNKFLAGS -o $BIN_DIR/geant$EXE geant$OBJ
#	$RM geant$OBJ
#	$CC $CFLAGS gelex.c
#	$LNK $LNKFLAGS -o $BIN_DIR/gelex$EXE gelex$OBJ
#	$RM gelex$OBJ
#	$CC $CFLAGS geyacc.c
#	$LNK $LNKFLAGS -o $BIN_DIR/geyacc$EXE geyacc$OBJ
#	$RM geyacc$OBJ
#	$CC $CFLAGS gepp.c
#	$LNK $LNKFLAGS -o $BIN_DIR/gepp$EXE gepp$OBJ
#	$RM gepp$OBJ
#	echo lcc > $GOBO/tool/gec/config/c/default.cfg
elif [ "$CC" = "gcc" ]; then
#	CFLAGS='-O2'
	CFLAGS=''
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
	echo gcc > $GOBO/tool/gec/config/c/default.cfg
elif [ "$CC" = "cc" ]; then
#	CFLAGS='-fast'
	CFLAGS=''
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
	echo cc > $GOBO/tool/gec/config/c/default.cfg
elif [ "$CC" = "icc" ]; then
	CFLAGS='-O2'
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
	echo icc > $GOBO/tool/gec/config/c/default.cfg
elif [ "$CC" = "tcc" ]; then
	CFLAGS='-O2'
	$CC $CFLAGS -o $BIN_DIR/gec$EXE gec.c
	$CC $CFLAGS -o $BIN_DIR/gexace$EXE gexace.c
	$CC $CFLAGS -o $BIN_DIR/geant$EXE geant.c
	$CC $CFLAGS -o $BIN_DIR/gelex$EXE gelex.c
	$CC $CFLAGS -o $BIN_DIR/geyacc$EXE geyacc.c
	$CC $CFLAGS -o $BIN_DIR/gepp$EXE gepp.c
	echo tcc > $GOBO/tool/gec/config/c/default.cfg
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
#elif [ "$EIF" = "ve" ]; then
#	GOBO_EIFFEL=ve
#	export GOBO_EIFFEL
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
