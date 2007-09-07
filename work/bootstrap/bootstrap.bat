@echo off

rem description: "Bootstrap Gobo Eiffel package"
rem copyright: "Copyright (c) 2001-2007, Eric Bezault and others"
rem license: "MIT License"
rem date: "$Date$"
rem revision: "$Revision$"


rem "usage: bootstrap.bat [-v][--delivery] <c_compiler> <eiffel_compiler>"


if .%1. == .-v. goto verbose
goto no_verbose

:no_verbose
	if .%1. == .--delivery. goto no_verbose_delivery
	goto no_verbose_no_delivery

:verbose
	if .%2. == .--delivery. goto verbose_delivery
	goto verbose_no_delivery

:no_verbose_no_delivery
	set VERBOSE=
	set DELIVERY=
	set CC=%1
	set EIF=%2
	goto do_it

:no_verbose_delivery
	set VERBOSE=
	set DELIVERY=--delivery
	set CC=%2
	set EIF=%3
	goto do_it

:verbose_no_delivery
	set VERBOSE=-v
	set DELIVERY=
	set CC=%2
	set EIF=%3
	goto do_it

:verbose_delivery
	set VERBOSE=-v
	set DELIVERY=--delivery
	set CC=%3
	set EIF=%4
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
	set LFLAGS=-link -subsystem:console
	%CC% %CFLAGS% -o%BIN_DIR%\gec%EXE% gec.c %LFLAGS%
	%RM% gec%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\gexace%EXE% gexace.c %LFLAGS%
	%RM% gexace%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\geant%EXE% geant.c %LFLAGS%
	%RM% geant%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\gelex%EXE% gelex.c %LFLAGS%
	%RM% gelex%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\geyacc%EXE% geyacc.c %LFLAGS%
	%RM% geyacc%OBJ%
	%CC% %CFLAGS% -o%BIN_DIR%\gepp%EXE% gepp.c %LFLAGS%
	%RM% gepp%OBJ%
	echo msc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:bcc32
	set CC=bcc32
	set CFLAGS=-5 -q -w-8004 -w-8008 -w-8057 -w-8065 -w-8066 -w-8070 -O2
	%CC% %CFLAGS% -ogec%EXE% gec.c
	%CP% gec%EXE% %BIN_DIR%
	%RM% gec%EXE% gec.tds
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
	echo lcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:gcc
	set CC=gcc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	echo gcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:cc
	set CC=cc
#	set CFLAGS=-fast
	set CFLAGS=
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	echo cc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:icc
	set CC=icc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	echo icc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:tcc
	set CC=tcc
	set CFLAGS=-O2
	set OBJ=.o
	%CC% %CFLAGS% -o %BIN_DIR%\gec%EXE% gec.c
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	echo tcc > %GOBO%\tool\gec\config\c\default.cfg
	goto install

:install
	if .%EIF%. == .ge. goto ge
	if .%EIF%. == .ise. goto ise
	if .%EIF%. == .se. goto se
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
	%CP% geant%EXE% geant1%EXE%
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
	if .%ERRORLEVEL%. == .. goto delivery
	if %ERRORLEVEL% == 0 goto delivery
	goto exit

:delivery
	if .%DELIVERY%. == .. goto exit
	cd %GOBO%
	geant %VERBOSE% delivery
	cd %BIN_DIR%
	%RM% geant%EXE%
	cd %GOBO%
	goto exit

:usage
	echo "usage: bootstrap.bat [-v][--delivery] <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  msc | bcc | gcc | cc | icc | tcc | no_c"
	echo "   eiffel_compiler:  ge | ise | se"
	goto exit

:exit
