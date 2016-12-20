#!/bin/sh

# description: "Install Gobo Eiffel tools"
# copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
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

STRIP=strip
EXE=

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
	STRIP=echo
	EXE=.exe
fi

BIN_DIR=$GOBO/bin
BOOTSTRAP_DIR=$GOBO/tool/gec/bootstrap
cd $BIN_DIR
$BOOTSTRAP_DIR/bootstrap.sh $VERBOSE $CC

if [ "$EIF" = "ge" ]; then
	cd $BIN_DIR
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/geant/src/ge.xace
	$STRIP geant${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gexace/src/ge.xace
	$STRIP gexace${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelex/src/ge.xace
	$STRIP gelex${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/geyacc/src/ge.xace
	$STRIP geyacc${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gepp/src/ge.xace
	$STRIP gepp${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/getest/src/ge.xace
	$STRIP getest${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelint/src/ge.xace
	$STRIP gelint${EXE}
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gexslt/src/ge.xace
	$STRIP gexslt${EXE}
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

PATH=$BIN_DIR:$PATH
export PATH
cd $BIN_DIR
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gec/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geant/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexace/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelex/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geyacc/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gepp/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/getest/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelint/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexslt/src/build.eant clean
