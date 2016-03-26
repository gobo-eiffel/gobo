@echo off

rem description: "Bootstrap Gobo Eiffel package"
rem copyright: "Copyright (c) 2001-2013, Eric Bezault and others"
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
	set BOOTSTRAP_DIR=%GOBO%\work\bootstrap
	set OBJ=.obj
	set EXE=.exe
	goto c_compiler

:c_compiler

set BIN_DIR=%GOBO%\bin
set BOOTSTRAP_DIR=%GOBO%\work\bootstrap
cd %BIN_DIR%

if .%CC%. == .. goto usage
if .%CC%. == .-help. goto usage
if .%CC%. == .--help. goto usage
if .%CC%. == .-h. goto usage
if .%CC%. == .-?. goto usage
if .%CC%. == ./h. goto usage
if .%CC%. == ./?. goto usage
if .%EIF%. == .. goto usage

if .%CC%. == .msc. goto msc
if .%CC%. == .cl. goto msc
if .%CC%. == .lcc-win32. goto lcc-win32
if .%CC%. == .lcc. goto lcc-win32
if .%CC%. == .bcc. goto bcc32
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .gcc. goto gcc
if .%CC%. == .mingw. goto mingw
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

:gcc
	set CC=gcc
	set LD=gcc
	set CFLAGS=-O2
	set LFLAGS=
	set LFLAG_OUT=-o 
	set LLIBS=-lm
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
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec18.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec17.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec16.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec15.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec14.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec13.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec12.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec11.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gec10.c
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

	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gexace4.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gexace3.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gexace2.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gexace1.c
	%LD% %LFLAGS% %LFLAG_OUT%gexace%EXE% gexace*%OBJ% %LLIBS%
	%RM% gexace*%OBJ%

	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geant5.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geant4.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geant3.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geant2.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geant1.c
	%LD% %LFLAGS% %LFLAG_OUT%geant%EXE% geant*%OBJ% %LLIBS%
	%RM% geant*%OBJ%

	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gelex2.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gelex1.c
	%LD% %LFLAGS% %LFLAG_OUT%gelex%EXE% gelex*%OBJ% %LLIBS%
	%RM% gelex*%OBJ%

	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geyacc2.c
	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\geyacc1.c
	%LD% %LFLAGS% %LFLAG_OUT%%BIN_DIR%\geyacc%EXE% geyacc*%OBJ% %LLIBS%
	%RM% geyacc*%OBJ%

	%CC% %CFLAGS% -c %BOOTSTRAP_DIR%\gepp1.c
	%LD% %LFLAGS% %LFLAG_OUT%gepp%EXE% gepp*%OBJ% %LLIBS%
	%RM% gepp*%OBJ%

	if .%CC%. == .bcc32. %RM% *.tds

	goto install

:install
	if .%EIF%. == .ge. goto ge
	if .%EIF%. == .ise. goto ise
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ge
	set GOBO_EIFFEL=ge
	goto bootstrap

:ise
	set GOBO_EIFFEL=ise
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
	echo usage: bootstrap.bat [-v][--delivery] ^<c_compiler^> ^<eiffel_compiler^>
	echo    c_compiler:  msc ^| lcc-win32 ^| bcc ^| gcc ^| mingw ^| cc ^| icc ^| tcc ^| no_c
	echo    eiffel_compiler:  ge ^| ise
	goto exit

:exit
