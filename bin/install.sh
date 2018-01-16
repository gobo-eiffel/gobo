#!/bin/sh

# description: "Install Gobo Eiffel tools"
# copyright: "Copyright (c) 2007-2018, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: install.sh [-v] <c_compiler>

echo "Executing install.sh..."

gobo_usage() {
	echo "usage: install.sh [-v][-t] <c_compiler>"
	echo "   c_compiler:  msc | lcc-win32 | lcc-win64 | bcc | gcc | mingw | cc | icc | tcc | no_c"
}

VERBOSE=
TEST_ONLY=
EIF=ge
if [ "$1" = "-v" ]; then
	VERBOSE=-v
	if [ "$2" = "-t" ]; then
		TEST_ONLY=-t
		CC=$3
	else
		CC=$2
	fi
elif [ "$1" = "-t" ]; then
	TEST_ONLY=-t
	if [ "$2" = "-v" ]; then
		VERBOSE=-t
		CC=$3
	else
		CC=$2
	fi
		
else
	CC=$1
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
if [ "$VERBOSE" = "-v" ]; then
	echo "Bootstraping gec..."
fi
$BOOTSTRAP_DIR/bootstrap.sh $VERBOSE $CC

if [ "$EIF" = "ge" ]; then
	cd $BIN_DIR
	if [ "$VERBOSE" = "-v" ]; then
		echo "Compiling geant..."
	fi
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/geant/src/ge.xace
	$STRIP geant${EXE}
	if [ "$VERBOSE" = "-v" ]; then
		echo "Compiling gexace..."
	fi
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gexace/src/ge.xace
	$STRIP gexace${EXE}
	if [ "$VERBOSE" = "-v" ]; then
		echo "Compiling getest..."
	fi
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/getest/src/ge.xace
	$STRIP getest${EXE}
	if [ "$VERBOSE" = "-v" ]; then
		echo "Compiling gelint..."
	fi
	$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelint/src/ge.xace
	$STRIP gelint${EXE}
	if [ "$TEST_ONLY" = "" ]; then
		if [ "$VERBOSE" = "-v" ]; then
			echo "Compiling gelex..."
		fi
		$BIN_DIR/gec$EXE --finalize $GOBO/tool/gelex/src/ge.xace
		$STRIP gelex${EXE}
		if [ "$VERBOSE" = "-v" ]; then
			echo "Compiling geyacc..."
		fi
		$BIN_DIR/gec$EXE --finalize $GOBO/tool/geyacc/src/ge.xace
		$STRIP geyacc${EXE}
		if [ "$VERBOSE" = "-v" ]; then
			echo "Compiling gepp..."
		fi
		$BIN_DIR/gec$EXE --finalize $GOBO/tool/gepp/src/ge.xace
		$STRIP gepp${EXE}
		if [ "$VERBOSE" = "-v" ]; then
			echo "Compiling gedoc..."
		fi
		$BIN_DIR/gec$EXE --finalize $GOBO/tool/gedoc/src/ge.xace
		$STRIP gedoc${EXE}
		if [ "$VERBOSE" = "-v" ]; then
			echo "Compiling gexlt..."
		fi
		$BIN_DIR/gec$EXE --finalize $GOBO/tool/gexslt/src/ge.xace
		$STRIP gexslt${EXE}
	fi
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

cd $BIN_DIR
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gec/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geant/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexace/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/getest/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelint/src/build.eant clean
if [ "$TEST_ONLY" = "" ]; then
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelex/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geyacc/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gepp/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gedoc/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexslt/src/build.eant clean
fi
