#!/bin/sh

# description: "Install Gobo Eiffel tools"
# copyright: "Copyright (c) 2007-2021, Eric Bezault and others"
# license: "MIT License"
# date: "$Date$"
# revision: "$Revision$"


# usage: install.sh [-v|-t][--thread=N] <c_compiler>

gobo_usage() {
	echo "usage: install.sh [-v|-t][--thread=N] <c_compiler>"
	echo "   c_compiler:  msc | lcc-win32 | lcc-win64 | bcc | gcc | mingw | clang | cc | icc | tcc | no_c"
}

VERBOSE=
TEST_ONLY=
THREAD_OPTION=
while [ $# -gt 1 ]
do
	case $1 in
		-v)
			VERBOSE=-v
			shift
			;;
		-t)
			TEST_ONLY=-t
			shift
			;;
		--thread=*)
			THREAD_OPTION=$1
			shift
			;;
		*)
			shift
			;;
	esac
done
CC=$1
EIF=ge

if [ "$VERBOSE" != "-s" ]; then
	echo "Executing install.sh..."
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
if [ "$VERBOSE" != "-s" ]; then
	echo "Bootstraping gec..."
fi
$BOOTSTRAP_DIR/bootstrap.sh $VERBOSE $THREAD_OPTION $CC

if [ "$EIF" = "ge" ]; then
	cd $BIN_DIR
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling geant..."
	fi
	$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/geant/src/system.ecf
	$STRIP geant${EXE}
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gedoc..."
	fi
	$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/gedoc/src/system.ecf
	$STRIP gedoc${EXE}
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling getest..."
	fi
	$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/getest/src/system.ecf
	$STRIP getest${EXE}
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gelint..."
	fi
	$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/gelint/src/system.ecf
	$STRIP gelint${EXE}
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gecop..."
	fi
	$BIN_DIR/gec$EXE --finalize --no-benchmark --cc=no $THREAD_OPTION $GOBO/tool/gecop/src/system.ecf
	$BIN_DIR/gecc$EXE $THREAD_OPTION gecop.sh
	$STRIP gecop${EXE}
	if [ "$TEST_ONLY" = "" ]; then
		if [ "$VERBOSE" != "-s" ]; then
			echo "Compiling geimage..."
		fi
		$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/geimage/src/system.ecf
		$STRIP geimage${EXE}
		if [ "$VERBOSE" != "-s" ]; then
			echo "Compiling gelex..."
		fi
		$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/gelex/src/system.ecf
		$STRIP gelex${EXE}
		if [ "$VERBOSE" != "-s" ]; then
			echo "Compiling geyacc..."
		fi
		$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/geyacc/src/system.ecf
		$STRIP geyacc${EXE}
		if [ "$VERBOSE" != "-s" ]; then
			echo "Compiling gepp..."
		fi
		$BIN_DIR/gec$EXE --finalize --no-benchmark $THREAD_OPTION $GOBO/tool/gepp/src/system.ecf
		$STRIP gepp${EXE}
		if [ "$VERBOSE" != "-s" ]; then
			echo "Compiling gexslt..."
		fi
		$BIN_DIR/gec$EXE --finalize --no-benchmark --cc=no $THREAD_OPTION $GOBO/tool/gexslt/src/system.ecf
		$BIN_DIR/gecc$EXE $THREAD_OPTION gexslt.sh
		$STRIP gexslt${EXE}
	fi
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi

if [ "$VERBOSE" != "-s" ]; then
	echo "Cleaning up..."
fi
cd $BIN_DIR
if [ "$VERBOSE" = "-s" ]; then
	VERBOSE=
fi
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gec/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gecc/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geant/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gedoc/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/getest/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelint/src/build.eant clean
geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gecop/src/build.eant clean
if [ "$TEST_ONLY" = "" ]; then
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geimage/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gelex/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/geyacc/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gepp/src/build.eant clean
	geant$EXE $VERBOSE --buildfilename=$GOBO/tool/gexslt/src/build.eant clean
fi
