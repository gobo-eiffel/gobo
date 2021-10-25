<#
.SYNOPSIS
	Build Gobo Eiffel tools.

.DESCRIPTION
	Build Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (github, gitlab, travis).

.EXAMPLE
	# Build Gobo Eiffel tools from the GitHub Actions pipeline:
	build_ge.ps1 github

.NOTES
	Copyright: "Copyright (c) 2021, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet('github', 'gitlab', 'travis')] 
	[string] $CiTool
)

. "$PSScriptRoot/before_script.ps1" $CiTool
& "$env:GOBO/bin/install.bat" -v msc
if ($LastExitCode -ne 0) { exit $LastExitCode }
gec --version
