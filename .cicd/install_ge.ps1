<#
.SYNOPSIS
	Install Gobo Eiffel tools.

.DESCRIPTION
	Install Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.EXAMPLE
	# Install Gobo Eiffel tools from the GitHub Actions pipeline:
	install_ge.ps1 github zig

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
if ($LastExitCode -ne 0) {
	Write-Error "Command 'before_script.ps1 $CiTool $CCompiler' exited with code $LastExitCode"
	exit $LastExitCode
}

switch ($GOBO_CI_OS) {
	"linux" {
		# See limitations (Permission Loss) in https://github.com/actions/download-artifact
		Get-ChildItem "$env:GOBO/bin/ge*" | ForEach-Object {
			bash -c "chmod a+x '$_'"
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'bash -c 'chmod a+x $_'' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
	}
	"macos" {
		# See limitations (Permission Loss) in https://github.com/actions/download-artifact
		Get-ChildItem "$env:GOBO/bin/ge*" | ForEach-Object {
			bash -c "chmod a+x '$_'"
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'bash -c 'chmod a+x $_'' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
	}
}

if (($GOBO_CI_OS -eq "linux" -or $GOBO_CI_OS -eq "macos") -and $CiTool -ne "gitlab") {
	file "$env:GOBO/bin/gec"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'file $env:GOBO/bin/gec' exited with code $LastExitCode"
		exit $LastExitCode
	}
	which gec
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'which gec' exited with code $LastExitCode"
		exit $LastExitCode
	}
}

gec --version --verbose
if ($LastExitCode -ne 0) {
	Write-Error "Command 'gec --version --verbose' exited with code $LastExitCode"
	exit $LastExitCode
}
