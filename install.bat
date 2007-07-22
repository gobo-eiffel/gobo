@echo off

rem description: "Install Gobo Eiffel package"
rem copyright: "Copyright (c) 2007, Eric Bezault and others"
rem license: "MIT License"
rem date: "$Date$"
rem revision: "$Revision$"


rem "usage: install.bat [-v] <c_compiler>"


if .%1. == .-v. goto verbose
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

:do_it
	if .%GOBO%. == .. goto gobo
	goto windows

:gobo
	echo Environment variable GOBO must be set
	goto exit

:windows
	set CP=copy
	set MV=rename
	set RM=del
	set BIN_DIR=%GOBO%\bin
	set OBJ=.obj
	set EXE=.exe
	goto c_compilation

:c_compilation

set BIN_DIR=%GOBO%\bin
cd %BIN_DIR%

if .%CC%. == .. goto usage
if .%CC%. == .-help. goto usage
if .%CC%. == .-h. goto usage
if .%CC%. == .-?. goto usage
if .%CC%. == ./h. goto usage
if .%CC%. == ./?. goto usage
if .%EIF%. == .. goto usage

if .%CC%. == .msc. goto msc
if .%CC%. == .cl. goto msc
if .%CC%. == .bcc. goto bcc32
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .gcc. goto gcc
if .%CC%. == .cc. goto cc
if .%CC%. == .icc. goto icc
if .%CC%. == .tcc. goto tcc
if .%CC%. == .no_c. goto install
echo Unknown C compiler: %CC%
goto exit

:msc
	set CC=cl
	set CFLAGS=-O2 -nologo -wd4049
	%CC% %CFLAGS% -o%BIN_DIR%\gec%EXE% gec.c
	%RM% gec%OBJ%
	echo msc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:bcc32
	set CC=bcc32
	set CFLAGS=-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2
	%CC% %CFLAGS% -ogec%EXE% gec.c
	%CP% gec%EXE% %BIN_DIR%
	%RM% gec%EXE% gec.tds
	echo bcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:lcc
	set CC=lcc
	set CFLAGS=-O
	set LNK=lcclnk
	set LNKFLAGS=-s
	%CC% %CFLAGS% gec.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\gec%EXE% gec%OBJ%
	%RM% gec%OBJ%
	echo lcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:gcc
	set CC=gcc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	echo gcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:cc
	set CC=cc
	set CFLAGS=-fast
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	echo cc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:icc
	set CC=icc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	echo icc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:tcc
	set CC=tcc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	echo tcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:install
	if .%EIF%. == .ge. goto ge
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ge
	set GOBO_EIFFEL=ge
	cd %BIN_DIR%
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\geant\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\gexace\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\gelex\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\geyacc\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\gepp\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\getest\ge.ace
	%BIN_DIR%\gec%EXE% --finalize %GOBO%\src\gelint\ge.ace
	%BIN_DIR%\gec%EXE% %GOBO%\src\gexslt\ge.ace
	goto clean

:clean
	set PATH=%BIN_DIR%;%PATH%
	cd %BIN_DIR%
	geant %VERBOSE% --buildfilename=%GOBO%\src\gec\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\geant\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\gexace\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\gelex\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\geyacc\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\gepp\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\getest\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\gelint\build.eant clean
	geant %VERBOSE% --buildfilename=%GOBO%\src\gexslt\build.eant clean
	goto exit

:usage
	echo "usage: install.bat [-v] <c_compiler>"
	echo "   c_compiler:  msc | bcc | gcc | cc | icc | tcc | no_c"
	goto exit

:exit
