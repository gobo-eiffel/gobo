<#
.SYNOPSIS
	Test Gobo Eiffel tools and libraries.

.DESCRIPTION
	Test Gobo Eiffel tools and libraries.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.PARAMETER EiffelCompiler
	Eiffel compiler (ge, debug_ge, ise, debug_ise).

.PARAMETER SystemUnderTest
	System under test (library, tool, etc.).

.EXAMPLE
	# Test Gobo Eiffel libraries using the Gobo Eiffel compiler from the GitHub Actions pipeline:
	test_ge.ps1 github zig ge library

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
	[string] $CCompiler,
	[Parameter(Mandatory=$true)]
	[ValidateSet("ge", "debug_ge", "ise", "debug_ise")] 
	[string] $EiffelCompiler,
	[Parameter(Mandatory=$true)]
	[ValidateSet("library", "tool", "library/xslt", "tool/gec")] 
	[string] $SystemUnderTest
)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot/install_ge.ps1" $CiTool $CCompiler
if ($LastExitCode -ne 0) {
	Write-Host "Gobo 108"
	exit $LastExitCode
}
Write-Host "Gobo 109"

if ($EiffelCompiler.EndsWith("ise")) {
	& "$PSScriptRoot/install_ise.ps1" $CiTool $CCompiler
	if ($LastExitCode -ne 0) { exit $LastExitCode }
} elseif ($GOBO_CI_C_COMPILER -eq "zig") {
	& "$PSScriptRoot/install_zig.ps1" $CiTool
	if ($LastExitCode -ne 0) { exit $LastExitCode }
}

Set-Location "$env:GOBO/$SystemUnderTest"
geant test_$EiffelCompiler
if ($LastExitCode -ne 0) { exit $LastExitCode }
