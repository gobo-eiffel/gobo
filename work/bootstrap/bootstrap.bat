@echo off

rem description: "Bootstrap Gobo Eiffel package"
rem copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
rem license: "Eiffel Forum License v2 (see forum.txt)"
rem date: "$Date$"
rem revision: "$Revision$"


rem "usage: bootstrap.bat [-v] <c_compiler> <eiffel_compiler>"


if .%1. == .-v. goto verbose
goto no_verbose

:no_verbose
	set VERBOSE=
	set CC=%1
	set EIF=%2
	goto do_it

:verbose
	set VERBOSE=-v
	set CC=%2
	set EIF=%3
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
cd %GOBO%\work\bootstrap

if .%CC%. == .. goto usage
if .%CC%. == .-help. goto usage
if .%CC%. == .-h. goto usage
if .%CC%. == .-?. goto usage
if .%CC%. == ./h. goto usage
if .%CC%. == ./?. goto usage
if .%EIF%. == .. goto usage

if .%CC%. == .msc. goto cl
if .%CC%. == .cl. goto cl
if .%CC%. == .bcc. goto bcc32
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .lcc. goto lcc
if .%CC%. == .gcc. goto gcc
if .%CC%. == .no_c. goto install
echo Unknown C compiler: %CC%
goto exit

:cl
	set CC=cl
	set CFLAGS=-O2 -nologo -D"WIN32" -w
	%CC% %CFLAGS% -o%BIN_DIR%\gexace%EXE% gexace.c
	%RM% gexace%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\geant%EXE% geant.c
	%RM% geant%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\gelex%EXE% gelex.c
	%RM% gelex%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\geyacc%EXE% geyacc.c
	%RM% geyacc%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\gepp%EXE% gepp.c
	%RM% gepp%OBJ%
	goto install

:bcc32
	set CC=bcc32
	set CFLAGS=-5 -w-aus -w-par -w-rvl -O2 -O-v
	%CC% %CFLAGS% -ogexace%EXE% gexace.c
	%CP% gexace%EXE% %BIN_DIR%
	%RM% gexace%EXE% gexace.tds
	%CC% %CFLAGS% -ogeant%EXE% geant.c
	%CP% geant%EXE% %BIN_DIR%
	%RM% geant%EXE% geant.tds
	%CC% %CFLAGS% -ogelex%EXE% gelex.c
	%CP% gelex%EXE% %BIN_DIR%
	%RM% gelex%EXE% gelex.tds
	%CC% %CFLAGS% -ogeyacc%EXE% geyacc.c
	%CP% geyacc%EXE% %BIN_DIR%
	%RM% geyacc%EXE% geyacc.tds
	%CC% %CFLAGS% -ogepp%EXE% gepp.c
	%CP% gepp%EXE% %BIN_DIR%
	%RM% gepp%EXE% gepp.tds
	goto install

:lcc
	set CFLAGS=-O
	set LNK=lcclnk
	set LNKFLAGS=-s
	%CC% %CFLAGS% gexace.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\gexace%EXE% gexace%OBJ%
	%RM% gexace%OBJ%
	%CC% %CFLAGS% geant.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\geant%EXE% geant%OBJ%
	%RM% geant%OBJ%
	%CC% %CFLAGS% gelex.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\gelex%EXE% gelex%OBJ%
	%RM% gelex%OBJ%
	%CC% %CFLAGS% geyacc.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc%OBJ%
	%RM% geyacc%OBJ%
	%CC% %CFLAGS% gepp.c
	%LNK% %LNKFLAGS% -o %BIN_DIR%\gepp%EXE% gepp%OBJ%
	%RM% gepp%OBJ%
	goto install

:gcc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	goto install

:install
	if .%EIF%. == .ge. goto ge
	if .%EIF%. == .ise. goto ise
	if .%EIF%. == .se. goto se
	if .%EIF%. == .ve. goto ve
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ge
	set GOBO_EIFFEL=ge
	goto bootstrap

:ise
	set GOBO_EIFFEL=ise
	goto bootstrap

:se
	set GOBO_EIFFEL=se
	goto bootstrap

:ve
	set GOBO_EIFFEL=ve
	goto bootstrap

:bootstrap
	set PATH=%BIN_DIR%;%PATH%
	cd %BIN_DIR%
	%MV% geant%EXE% geant1%EXE%
	cd %GOBO%
	geant1 %VERBOSE% bootstrap1
	if .%ERRORLEVEL%. == .. goto bootstrap2
	if %ERRORLEVEL% == 0 goto bootstrap2
	goto exit

:bootstrap2
	cd %BIN_DIR%
	%RM% geant1%EXE%
	cd %GOBO%
	geant %VERBOSE% bootstrap2
	goto exit

:usage
	echo "usage: bootstrap.bat [-v] <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  msc | bcc | lcc | gcc | no_c"
	echo "   eiffel_compiler:  ge | ise | se | ve"
	goto exit

:exit
