@echo off

rem description: "Bootstrap Gobo Eiffel Compiler in $GOBO/bin"
rem copyright: "Copyright (c) 2016-2021, Eric Bezault and others"
rem license: "MIT License"
rem date: "$Date$"
rem revision: "$Revision$"


rem "usage: bootstrap.bat [-v|-s] <c_compiler>"


if .%1. == .-v. goto verbose
if .%1. == .-s. goto silent
goto no_verbose

:no_verbose
	set VERBOSE=
	set CC=%1
	set EIF=ge
	goto do_it

:verbose
	set VERBOSE=-v
	set CC=%2
	set EIF=ge
	goto do_it

:silent
	set VERBOSE=-s
	set CC=%2
	set EIF=ge
	goto do_it

:do_it
	if not .%VERBOSE%. == .-s. echo Executing bootstrap.bat...
	if .%GOBO%. == .. goto gobo
	goto windows

:gobo
	echo Environment variable GOBO must be set
	goto exit

:windows
	set MV=rename
	set RM=del
	set BIN_DIR=%GOBO%\bin
	set BOOTSTRAP_DIR=%GOBO%\tool\gec\bootstrap
	set OBJ=.obj
	set EXE=.exe
	goto c_compiler

:c_compiler

set BIN_DIR=%GOBO%\bin
set BOOTSTRAP_DIR=%GOBO%\tool\gec\bootstrap
cd %BIN_DIR%

if .%CC%. == .. goto usage
if .%CC%. == .-help. goto usage
if .%CC%. == .--help. goto usage
if .%CC%. == .-h. goto usage
if .%CC%. == .-?. goto usage
if .%CC%. == ./h. goto usage
if .%CC%. == ./?. goto usage
if .%CC%. == .-v. goto usage
if .%CC%. == .-s. goto usage
if .%EIF%. == .. goto usage

if .%CC%. == .msc. goto msc
if .%CC%. == .cl. goto msc
if .%CC%. == .lcc-win32. goto lcc-win32
if .%CC%. == .lcc-win64. goto lcc-win64
if .%CC%. == .lcc. goto lcc-win64
if .%CC%. == .bcc. goto bcc32
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .gcc. goto gcc
if .%CC%. == .mingw. goto mingw
if .%CC%. == .clang. goto clang
if .%CC%. == .cc. goto cc
if .%CC%. == .icc. goto icc
if .%CC%. == .tcc. goto tcc
if .%CC%. == .no_c. goto install
echo Unknown C compiler: %CC%
goto exit

:msc
	set CC=cl
	set LD=link
	set CFLAGS=-O2 -nologo -wd4049
	set LFLAGS=-nologo -subsystem:console
	set LFLAG_OUT=-out:
	set LLIBS=
	echo msc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:bcc32
	set CC=bcc32
	set LD=bcc32
	set CFLAGS=-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2
	set LFLAGS=-5 -q 
	set LFLAG_OUT=-e
	set LLIBS=
	echo bcc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:lcc-win32
	set CC=lcc
	rem set CFLAGS=-O   -- Problem when gec is compiled with the -O option.
	set CFLAGS=
	set LD=lcclnk
	set LFLAGS=-s -subsystem Console
	set LFLAG_OUT=-o 
	set LLIBS=
	echo lcc-win32 > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:lcc-win64
	set CC=lcc64
	rem set CFLAGS=-O   -- Problem when gec is compiled with the -O option.
	set CFLAGS=
	set LD=lcclnk64
	set LFLAGS=-s -subsystem Console
	set LFLAG_OUT=-o 
	set LLIBS=
	echo lcc-win64 > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:gcc
	set CC=gcc
	set LD=gcc
	set CFLAGS=-O2
	set LFLAGS=
	set LFLAG_OUT=-o 
	set LLIBS=-lm -lpthread
	set OBJ=.o
	echo gcc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:mingw
	set CC=gcc
	set LD=gcc
	set CFLAGS=-O2
	set LFLAGS=
	set LFLAG_OUT=-o 
	set LLIBS=-lm
	set OBJ=.o
	echo mingw > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:clang
	set CC=clang
	set LD=clang
	set CFLAGS=-Wno-unused-value -Wno-deprecated-declarations -O2
	set LFLAGS=
	set LFLAG_OUT=-o 
	set LLIBS=-lm -lpthread
	set OBJ=.o
	echo clang > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation
	
:cc
	set CC=cc
	set LD=cc
	set CFLAGS='-fast'
	set LFLAGS='-lm'
	set LFLAG_OUT=-o 
	set LLIBS=
	set OBJ=.o
	echo cc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:icc
	set CC=icc
	set LD=icc
	set CFLAGS=-O2
	set LFLAGS=
	set LFLAG_OUT=-o 
	set LLIBS=
	set OBJ=.o
	echo icc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:tcc
	set CC=tcc
	set LD=tcc
	set CFLAGS=-O2
	set LFLAGS=-lm
	set LFLAG_OUT=-o 
	set LLIBS=
	set OBJ=.o
	echo tcc > %GOBO%\tool\gec\config\c\default.cfg
	goto c_compilation

:c_compilation
	if not .%VERBOSE%. == .-s. echo Compiling gec (bootstrap 0)...
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec9.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec8.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec7.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec6.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec5.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec4.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec3.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec2.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec1.c
	%LD% %LFLAGS% %LFLAG_OUT%gec%EXE% gec*%OBJ% %LLIBS%
	%RM% gec*%OBJ%
	if .%CC%. == .bcc32. %RM% gec.tds
	goto install

:install
	if .%EIF%. == .ge. goto ge
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ge
	cd %BIN_DIR%
	if not .%VERBOSE%. == .-s. echo Compiling gecc (bootstrap 1)...
	%BIN_DIR%\gec%EXE% --finalize --cc=no --no-benchmark %GOBO%\tool\gecc\src\system.ecf
	call .\gecc.bat
	rem Compile gec twice to get a bootstrap effect.
	if not .%VERBOSE%. == .-s. echo Compiling gec (bootstrap 1)...
	%BIN_DIR%\gec%EXE% --finalize --cc=no --no-benchmark %GOBO%\tool\gec\src\system.ecf
	%BIN_DIR%\gecc%EXE% gec.bat
	if not .%VERBOSE%. == .-s. echo Compiling gec (bootstrap 2)...
	%BIN_DIR%\gec%EXE% --finalize --cc=no --no-benchmark %GOBO%\tool\gec\src\system.ecf
	%BIN_DIR%\gecc%EXE% gec.bat
	if not .%VERBOSE%. == .-s. echo Compiling gecc (bootstrap 2)...
	%BIN_DIR%\gec%EXE% --finalize --cc=no --no-benchmark %GOBO%\tool\gecc\src\system.ecf
	call .\gecc.bat
	%RM% gec*.h
	%RM% gec*.c
	%RM% gec*%OBJ%
	rem Make sure 'gec.bat' exists to avoid getting some warning when removing it.
	echo "" > gec.bat
	%RM% gec*.bat
	rem Make sure 'gec.sh' exists to avoid getting some warning when removing it.
	echo "" > gec.sh
	%RM% gec*.sh
	rem Make sure 'gec.make' exists to avoid getting some warning when removing it.
	echo "" > gec.make
	%RM% gec*.make
	if .%CC%. == .bcc32. %RM% gec.tds
	goto exit

:usage
	echo usage: bootstrap.bat [-v^|-s] ^<c_compiler^>
	echo    c_compiler:  msc ^| lcc-win32 ^| lcc-win64 ^| bcc ^| gcc ^| mingw ^| clang ^| cc ^| icc ^| tcc ^| no_c
	goto exit

:exit
