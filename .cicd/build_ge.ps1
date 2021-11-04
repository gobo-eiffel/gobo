<#
.SYNOPSIS
	Build Gobo Eiffel tools.

.DESCRIPTION
	Build Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

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
	[ValidateSet("azure", "github", "gitlab")] 
	[string] $CiTool
)

. "$PSScriptRoot/before_script.ps1" $CiTool
Get-ChildItem "$env:GOBO"
& "$env:GOBO/bin/$GOBO_CI_BUILD_SCRIPT" -v $GOBO_CI_C_COMPILER
if ($LastExitCode -ne 0) { exit $LastExitCode }
gec --version
