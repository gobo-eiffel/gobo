@echo off

rem description: "Bootstrap Gobo Eiffel package"
rem author:      "Eric Bezault <ericb@gobosoft.com>"
rem copyright:   "Copyright (c) 2001, Eric Bezault and others"
rem license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
rem date:        "$Date$"
rem revision:    "$Revision$"


rem usage: bootstrap.bat <c_compiler> <eiffel_compiler>


set CC=%1
set EIF=%2

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

if .%CC%. == .cl. goto cl
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .lcc. goto lcc
if .%CC%. == .gcc. goto gcc
if .%CC%. == .no_c. goto install
echo Unknown C compiler: %CC%
goto exit

:cl
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
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%RM% gexace%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%RM% geant%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%RM% gelex%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%RM% geyacc%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	%RM% gepp%OBJ%
	goto install

:install
	if .%EIF%. == .ise. goto ise
	if .%EIF%. == .hact. goto hact
	if .%EIF%. == .se. goto se
	if .%EIF%. == .ve. goto ve
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ise
	set GOBO_EIFFEL=ise
	goto bootstrap

:hact
	set GOBO_EIFFEL=hact
	goto bootstrap

:se
	set GOBO_EIFFEL=se
	goto bootstrap

:ve
	set GOBO_EIFFEL=ve
	goto bootstrap

:bootstrap
	goto bootstrap1

:bootstrap1
	cd %GOBO%
	geant bootstrap1
	cd %BIN_DIR%
	%RM% geant%EXE%
	%MV% geant1%EXE% geant%EXE%
	if .%EIF%. == .ve. goto vetuner
	goto bootstrap2

:vetuner
	rem   Make sure that we don't run out of Eiffel heap memory
	rem   when compiled with Visual Eiffel.
	rem tune_huge geant%EXE%
	vetuner -c -zone_1_reserved=67108864 -zone_2_reserved=67108864 -zone_3_reserved=67108864 -zone_4_reserved=67108864 -zone_5_reserved=67108864 -zone_6_reserved=67108864 -zone_7_reserved=67108864 -zone_8_reserved=67108864 -zone_9_reserved=67108864 -zone_10_reserved=67108864 -zone_11_reserved=134217728 -zone_12_reserved=67108864 -zone_1_committed=8192 -zone_2_committed=8192 -zone_3_committed=8192 -zone_4_committed=8192 -zone_5_committed=8192 -zone_6_committed=8192 -zone_7_committed=8192 -zone_8_committed=8192 -zone_9_committed=8192 -zone_10_committed=8192 -zone_11_committed=65536 -zone_12_committed=8192 geant%EXE%
	goto bootstrap2

:bootstrap2
	cd %GOBO%
	geant bootstrap2
	goto exit

:usage
	echo "usage: bootstrap.bat <c_compiler> <eiffel_compiler>"
	echo "   c_compiler:  cl | bcc32 | lcc | gcc | no_c"
	echo "   elffel_compiler:  ise | hact | se | ve"
	goto exit
  
:exit
