<#
.SYNOPSIS
	Test Gobo Eiffel tools and libraries.

.DESCRIPTION
	Test Gobo Eiffel tools and libraries.

.PARAMETER CiTool
	CI tool (github, gitlab, travis).

.PARAMETER EiffelCompiler
	Eiffel compiler (ge, debug_ge, ise, debug_ise).

.PARAMETER SystemUnderTest
	System under test (library, tool, etc.).

.EXAMPLE
	# Test Gobo Eiffel libraries using the Gobo Eiffel compiler from the GitHub Actions pipeline:
	test_ge.ps1 github ge library

.NOTES
	Copyright: "Copyright (c) 2021, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet('github', 'gitlab', 'travis')] 
	[string] $CiTool,
	[Parameter(Mandatory=$true)]
	[ValidateSet('ge', 'debug_ge', 'ise', 'debug_ise')] 
	[string] $EiffelCompiler,
	[Parameter(Mandatory=$true)]
	[ValidateSet('library', 'tool', 'tool/gec')] 
	[string] $SystemUnderTest
)

. "$PSScriptRoot/.cicd/install_ge.ps1" $CiTool
if ($EiffelCompiler.EndsWith("ise")) {
  . "$PSScriptRoot/.cicd/install_ise.ps1" $CiTool
}
Set-Location "$env:GOBO/$SystemUnderTest"
geant test_$EiffelCompiler
