@echo off

rem description: "Install Gobo Eiffel tools"
rem copyright: "Copyright (c) 2007-2021, Eric Bezault and others"
rem license: "MIT License"
rem date: "$Date$"
rem revision: "$Revision$"


rem "usage: install.bat [-v|-s][-t] <c_compiler>"


if .%1. == .-v. goto verbose1
if .%1. == .-s. goto silent1
if .%1. == .-t. goto testonly1
goto no_verbose_no_testonly

:verbose1
	if .%2. == .-t. goto verbose_and_testonly
	if .%2. == .-s. goto usage
	set VERBOSE=-v
	set TEST_ONLY=
	set CC=%2
	set EIF=ge
	goto do_it

:silent1
	if .%2. == .-t. goto silent_and_testonly
	if .%2. == .-v. goto usage
	set VERBOSE=-s
	set TEST_ONLY=
	set CC=%2
	set EIF=ge
	goto do_it

:testonly1
	if .%2. == .-v. goto verbose_and_testonly
	if .%2. == .-s. goto silent_and_testonly
	set VERBOSE=
	set TEST_ONLY=-t
	set CC=%2
	set EIF=ge
	goto do_it

:verbose_and_testonly
	set VERBOSE=-v
	set TEST_ONLY=-t
	set CC=%3
	set EIF=ge
	goto do_it

:silent_and_testonly
	set VERBOSE=-s
	set TEST_ONLY=-t
	set CC=%3
	set EIF=ge
	goto do_it

:no_verbose_no_testonly
	set VERBOSE=
	set TEST_ONLY=
	set CC=%1
	set EIF=ge
	goto do_it

:do_it
	if not .%VERBOSE%. == .-s. echo Executing install.bat...
	if .%GOBO%. == .. goto gobo
	goto windows

:gobo
	echo Environment variable GOBO must be set
	goto exit

:windows
	set EXE=.exe
	goto c_compilation

:c_compilation
	if .%CC%. == .. goto usage
	if .%CC%. == .-help. goto usage
	if .%CC%. == .--help. goto usage
	if .%CC%. == .-h. goto usage
	if .%CC%. == .-?. goto usage
	if .%CC%. == ./h. goto usage
	if .%CC%. == ./?. goto usage
	if .%CC%. == .-v. goto usage
	if .%CC%. == .-s. goto usage
	if .%CC%. == .-t. goto usage
	if .%EIF%. == .. goto usage

	set BIN_DIR=%GOBO%\bin
	set BOOTSTRAP_DIR=%GOBO%\tool\gec\bootstrap
	cd %BIN_DIR%
	if not .%VERBOSE%. == .-s. echo Bootstraping gec...
	call %BOOTSTRAP_DIR%\bootstrap.bat %VERBOSE% %CC%
	goto install

:install
	if .%EIF%. == .ge. goto ge
	echo Unknown Eiffel compiler: %EIF%
	goto exit

:ge
	cd %BIN_DIR%
	if not .%VERBOSE%. == .-s. echo Compiling geant...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\geant\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling getest...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\getest\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gelint...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gelint\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gedoc...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gedoc\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gecop...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gecop\src\system.ecf
	if .%TEST_ONLY%. == .-t. goto clean
	if not .%VERBOSE%. == .-s. echo Compiling geimage...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\geimage\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gelex...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gelex\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling geyacc...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\geyacc\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gepp...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gepp\src\system.ecf
	if not .%VERBOSE%. == .-s. echo Compiling gexslt...
	%BIN_DIR%\gec%EXE% --finalize --no-benchmark %GOBO%\tool\gexslt\src\system.ecf
	goto clean

:clean
	if not .%VERBOSE%. == .-s. echo Cleaning up...
	set PATH=%BIN_DIR%;%PATH%
	cd %BIN_DIR%
	if .%VERBOSE%. == .-s. set VERBOSE=
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gec\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gecc\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\geant\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\getest\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gelint\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gedoc\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gecop\src\build.eant clean
	if .%TEST_ONLY%. == .-t. goto exit
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\geimage\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gelex\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\geyacc\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gepp\src\build.eant clean
	geant%EXE% %VERBOSE% --buildfilename=%GOBO%\tool\gexslt\src\build.eant clean
	goto exit

:usage
	echo usage: install.bat [-v^|-s][-t] ^<c_compiler^>
	echo    c_compiler:  msc ^| lcc-win32 ^| lcc-win64 ^| bcc ^| gcc ^| mingw ^| clang ^| cc ^| icc ^| tcc ^| no_c
	goto exit

:exit
	cd %GOBO%
