#!/bin/sh

# description: "Bootstrap Gobo Eiffel Compiler in $GOBO/bin"
# copyright: "Copyright (c) 2016-2024, Eric Bezault and others"
# license: "MIT License"


# usage: bootstrap.sh [-v|-s][--thread=N] <c_compiler>

gobo_usage() {
	echo "usage: bootstrap.sh [-v|-s][--thread=N] [<c_compiler>]"
	echo "   c_compiler:  zig | gcc | clang | msc | lcc-win32 | lcc-win64 | bcc | mingw | cc | icc | tcc | no_c"
	echo "   default c_compiler: zig"
}

VERBOSE=
THREAD_OPTION=
while [ $# -gt 1 ]
do
	case $1 in
		-v)
			VERBOSE=-v
			shift
			;;
		-s)
			VERBOSE=-s
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
	echo "Executing bootstrap.sh..."
fi

if [ "$GOBO" = "" ]; then
	echo "Environment variable GOBO must be set"
	export GOBO="$(dirname "$(readlink -f "$0")")"/../../..
	echo "Set \$GOBO to \"$GOBO\""
fi

MV=mv
RM=rm
RMDIR='rm -rf'
STRIP=strip
OBJ=.o
EXE=
BIN_DIR="$GOBO/bin"
BOOTSTRAP_DIR="$GOBO/tool/gec/bootstrap"

cd $BIN_DIR

c_compilation() {
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gec (bootstrap 0)..."
	fi
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec8.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec7.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec6.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec5.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec4.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec3.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec2.c"
	$CC $CFLAGS -c "$BOOTSTRAP_DIR/gec1.c"
	$LD $LFLAGS ${LFLAG_OUT}gec$EXE gec*$OBJ $LLIBS
	$RM gec*$OBJ
}

if [ "$CC" = "" ]; then
	CC=zig
fi
if [ "$CC" = "-help" ]; then
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
	echo msc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "bcc" -o "$CC" = "bcc32" ]; then
	CC=bcc32
	LD=bcc32
	EXE=.exe
	CFLAGS='-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2'
	LFLAGS='-5 -q'
	LFLAGS='-e'
	LLIBS=''
	echo bcc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
	$RM *.tds
elif [ "$CC" = "lcc-win32" ]; then
	CC='lcc'
	EXE=.exe
#	CFLAGS='-O'   -- Problem when gec is compiled with the -O option.
	CFLAGS=''
	LD=lcclnk
	LFLAGS='-s -subsystem Console'
	LFLAG_OUT='-o '
	LLIBS=''
	echo lcc-win32 > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "lcc-win64" -o "$CC" = "lcc" ]; then
	CC='lcc64'
	EXE=.exe
#	CFLAGS='-O'   -- Problem when gec is compiled with the -O option.
	CFLAGS=''
	LD=lcclnk64
	LFLAGS='-s -subsystem Console'
	LFLAG_OUT='-o '
	LLIBS=''
	echo lcc-win64 > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "gcc" ]; then
	CC=gcc
	LD=gcc
#	CFLAGS='-O2'
	CFLAGS=''
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS='-lm -pthread'
	echo gcc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "mingw" ]; then
	CC=gcc
	LD=gcc
	EXE=.exe
#	CFLAGS='-O2'
	CFLAGS=''
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS='-lm -pthread'
	echo mingw > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "clang" ]; then
	CC=clang
	LD=clang
	CFLAGS='-pthread -Wno-unused-value -Wno-deprecated-declarations -fno-strict-aliasing -O2 -DNDEBUG'
	LFLAGS='-lm -pthread -fno-strict-aliasing -O2 -DNDEBUG'
	LFLAG_OUT='-o '
	LLIBS=''
	echo clang > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "zig" ]; then
	if [ "$ZIG" = "" ]; then
		ZIG="$GOBO/tool/gec/backend/c/zig"
		if [ -d "$ZIG" ]; then
			ZIG="$ZIG/zig"
		else
			ZIG=zig
		fi
	fi
	CC="$ZIG cc"
	LD="$ZIG cc"
	CFLAGS='-pthread -Wno-unused-value -Wno-deprecated-declarations -fno-strict-aliasing -fno-sanitize=undefined -O2 -DNDEBUG'
	LFLAGS='-lm -pthread -fno-strict-aliasing -fno-sanitize=undefined -O2 -DNDEBUG'
	LFLAG_OUT='-o '
	LLIBS=''
	echo zig > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "cc" ]; then
	CC='cc'
	LD=cc
	CFLAGS='-fast'
	LDFLAGS='-lm -pthread'
	LFLAG_OUT='-o '
	LLIBS=''
	echo cc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "icc" ]; then
	CC=icc
	LD=icc
	CFLAGS='-O2'
	LFLAGS=''
	LFLAG_OUT='-o '
	LLIBS=''
	echo icc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "tcc" ]; then
	CC=tcc
	LD=tcc
	CFLAGS='-O2'
	LDFLAGS='-lm'
	LFLAG_OUT='-o '
	LLIBS=''
	echo tcc > "$GOBO/tool/gec/backend/c/config/default.cfg"
	c_compilation
elif [ "$CC" = "no_c" ]; then
	echo "No C compilation"
else
	echo "Unknown C compiler: $CC"
	exit 1
fi

if [ "$EIF" = "ge" ]; then
	cd "$BIN_DIR"
	# Compile gec twice to get a bootstrap effect.
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gec (bootstrap 1)..."
	fi
	$MV "$BIN_DIR/gec$EXE" "$BIN_DIR/gec1$EXE"
	"$BIN_DIR/gec1$EXE" --finalize $THREAD_OPTION "$GOBO/tool/gec/src/system.ecf"
	$RM "$BIN_DIR/gec1$EXE"
	if [ "$VERBOSE" != "-s" ]; then
		echo "Compiling gec (bootstrap 2)..."
	fi
	$MV "$BIN_DIR/gec$EXE" "$BIN_DIR/gec1$EXE"
	"$BIN_DIR/gec1$EXE" --finalize $THREAD_OPTION "$GOBO/tool/gec/src/system.ecf"
	$RM "$BIN_DIR/gec1$EXE"
	$STRIP gec$EXE
	$RMDIR .gobo
else
	echo "Unknown Eiffel compiler: $EIF"
	exit 1
fi
