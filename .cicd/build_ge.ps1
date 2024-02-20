<#
.SYNOPSIS
	Build Gobo Eiffel tools.

.DESCRIPTION
	Build Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.EXAMPLE
	# Build Gobo Eiffel tools from the GitHub Actions pipeline:
	build_ge.ps1 github zig

.NOTES
	Copyright: "Copyright (c) 2021-2024, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet("azure", "github", "gitlab")] 
	[string] $CiTool,
	[Parameter(Mandatory=$true)]
	[ValidateSet("zig", "gcc", "clang", "msc")] 
	[string] $CCompiler
)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot/before_script.ps1" $CiTool $CCompiler
if ($LastExitCode -ne 0) { exit $LastExitCode }

if ($GOBO_CI_C_COMPILER -eq "zig") {
	& "$PSScriptRoot/install_zig.ps1" $CiTool
	if ($LastExitCode -ne 0) { exit $LastExitCode }
}

& "$env:GOBO/bin/$GOBO_CI_BUILD_SCRIPT" $GOBO_CI_C_COMPILER
if ($LastExitCode -ne 0) { exit $LastExitCode }
gec --version --verbose
if ($LastExitCode -ne 0) { exit $LastExitCode }
