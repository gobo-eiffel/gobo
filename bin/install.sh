#!/bin/sh

# description: "Install Gobo Eiffel tools"
# copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: install.sh [-v] <c_compiler>

echo "Executing install.sh..."

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
PATH=$BIN_DIR:$PATH
export PATH
cd $BIN_DIR
echo "Bootstraping gec..."
$BOOTSTRAP_DIR/bootstrap.sh $VERBOSE $CC

if [ "$EIF" = "ge" ]; then
	cd $BIN_DIR
	echo "Compiling geant..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/geant/src/ge.xace
	$STRIP geant${EXE}
	echo "Compiling gexace..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gexace/src/ge.xace
	$STRIP gexace${EXE}
	echo "Compiling gelex..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelex/src/ge.xace
	$STRIP gelex${EXE}
	echo "Compiling geyacc..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/geyacc/src/ge.xace
	$STRIP geyacc${EXE}
	echo "Compiling gepp..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gepp/src/ge.xace
	$STRIP gepp${EXE}
	echo "Compiling getest..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/getest/src/ge.xace
	$STRIP getest${EXE}
	echo "Compiling gelint..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelint/src/ge.xace
	$STRIP gelint${EXE}
	echo "Compiling gedoc..."
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gedoc/src/ge.xace
	$STRIP gedoc${EXE}
	echo "Compiling gexlt..."
	$BIN_DIR/geant$EXE --buildfilename=$GOBO/tool/gexslt/src/build.eant compile_ge
	$STRIP gexslt${EXE}
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

cd $BIN_DIR
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gec/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geant/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexace/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelex/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geyacc/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gepp/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/getest/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelint/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gedoc/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexslt/src/build.eant clean
