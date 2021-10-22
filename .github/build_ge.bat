@echo off

rem description: "Build Gobo Eiffel tools"
rem copyright: "Copyright (c) 2021, Eric Bezault and others"
rem license: "MIT License"

rem "usage: build_ge.bat <ci_tool>"

set GOBO_CI_TOOL=%1

if .%GOBO_CI_TOOL%. == .github. goto github
if .%GOBO_CI_TOOL%. == .gitlab. goto gitlab
if .%GOBO_CI_TOOL%. == .. goto usage
goto do_it

:github
	set GOBO=%GITHUB_WORKSPACE%
	goto do_it

:gitlab
	set GOBO=%CI_PROJECT_DIR%
	call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsx86_amd64.bat"
	goto do_it

:do_it
	set PATH=%GOBO%\bin;%PATH%
	%GOBO%\bin\install.bat -v msc
	gec --version
	goto exit

:usage
	echo usage: build_ge.bat ^<ci_tool^>
	echo    ci_tool:  github ^| gitlab
	goto exit

:exit
