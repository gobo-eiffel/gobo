@echo off

rem description: "To be executed before the CI/CD script"
rem copyright: "Copyright (c) 2021, Eric Bezault and others"
rem license: "MIT License"

rem "usage: before_script.bat <ci_tool>"

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
	goto do_it

:do_it
	goto exit

:usage
	echo usage: before_script.bat ^<ci_tool^>
	echo    ci_tool:  github ^| gitlab
	goto exit

:exit
