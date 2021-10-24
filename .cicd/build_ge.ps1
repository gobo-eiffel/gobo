<#
.SYNOPSIS
	Build Gobo Eiffel tools.

.DESCRIPTION
	Build Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (github, gitlab, travis).

.EXAMPLE
	# Build Gobo Eiffel tools from the GitHub Actions pipeline:
	build_ge github

.NOTES
	Copyright: "Copyright (c) 2021, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet('github', 'gitlab', 'travis')] 
	[string]
	$CiTool
)

#function Invoke-Environment {
#	param
#	(
#		[Parameter(Mandatory=$true)] [string]
#		$Command
#	)
#
#	cmd /c "$Command > nul 2>&1 && set" | .{process{
#		if ($_ -match '^([^=]+)=(.*)') {
#			[System.Environment]::SetEnvironmentVariable($matches[1], $matches[2])
#		}
#	}}
#}

#if ($CiTool == 'github') {
#	$env:GOBO = $env:GITHUB_WORKSPACE
#	Invoke-Environment("C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsx86_amd64.bat")
#} elseif ($CiTool == 'gitlab') {
#	$env:GOBO = $env:CI_PROJECT_DIR
#	Invoke-Environment("C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsx86_amd64.bat")
#}

#$env:PATH = "$env:GOBO/bin" + [IO.Path]::PathSeparator + $env:PATH
#. $env:GOBO/bin/install.bat -v msc
#gec --version
