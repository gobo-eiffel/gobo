@echo off

rem usage: bootstrap.bat <c_compiler> <eiffel_compiler>


set CC=%1
set EIF=%2
set CP=copy
set DEL=del
set BIN_DIR=%GOBO%\bin
set OBJ=.obj
set EXE=.exe

cd %GOBO%\work\bootstrap

if .%CC%. == .cl. goto cl
if .%CC%. == .bcc32. goto bcc32
if .%CC%. == .lcc-win32. goto lcc-win32
if .%CC%. == .gcc. goto gcc
if .%CC%. == .no_c. goto install
echo Unknown C compiler: %CC%
exit

:cl
	set CFLAGS=-O2 -nologo -D"WIN32" -w
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%DEL% gexace%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%DEL% geant%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%DEL% gelex%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%DEL% geyacc%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	%DEL% gepp%OBJ%
	goto install

:bcc32
	set CFLAGS=-5 -w-aus -w-par -w-rvl -O2 -O-v
	%CC% %CFLAGS% -ogexace%EXE% gexace.c
	%CP% gexace%EXE% %BIN_DIR%
	%DEL% gexace%EXE% gexace.tds
	%CC% %CFLAGS% -ogeant%EXE% geant.c
	%CP% geant%EXE% %BIN_DIR%
	%DEL% geant%EXE% geant.tds
	%CC% %CFLAGS% -ogelex%EXE% gelex.c
	%CP% gelex%EXE% %BIN_DIR%
	%DEL% gelex%EXE% gelex.tds
	%CC% %CFLAGS% -ogeyacc%EXE% geyacc.c
	%CP% geyacc%EXE% %BIN_DIR%
	%DEL% geyacc%EXE% geyacc.tds
	%CC% %CFLAGS% -ogepp%EXE% gepp.c
	%CP% gepp%EXE% %BIN_DIR%
	%DEL% gepp%EXE% gepp.tds
	goto install

:lcc-win32
	set CFLAGS=-O
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%DEL% gexace%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%DEL% geant%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%DEL% gelex%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%DEL% geyacc%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	%DEL% gepp%OBJ%
	goto install

:gcc
	set CFLAGS=-O2
	%CC% %CFLAGS% -o %BIN_DIR%\gexace%EXE% gexace.c
	%DEL% gexace%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geant%EXE% geant.c
	%DEL% geant%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gelex%EXE% gelex.c
	%DEL% gelex%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\geyacc%EXE% geyacc.c
	%DEL% geyacc%OBJ%
	%CC% %CFLAGS% -o %BIN_DIR%\gepp%EXE% gepp.c
	%DEL% gepp%OBJ%
	goto install

:install

:bootstrap
