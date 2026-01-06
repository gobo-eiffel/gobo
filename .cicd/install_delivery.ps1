<#
.SYNOPSIS
	Install Gobo Eiffel delivery.

.DESCRIPTION
	Install Gobo Eiffel delivery.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.EXAMPLE
	# Install Gobo Eiffel delivery from the GitHub Actions pipeline:
	install_delivery.ps1 github

.NOTES
	Copyright: "Copyright (c) 2024, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet("azure", "github", "gitlab")] 
	[string] $CiTool
)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot/before_script.ps1" $CiTool zig
if ($LastExitCode -ne 0) {
	Write-Error "Command 'before_script.ps1 $CiTool zig' exited with code $LastExitCode"
	exit $LastExitCode
}

$GOBO_CI_GE_ARCHIVE_FILENAME = Get-ChildItem "gobo-*" -Name 

if ($GOBO_CI_OS -eq "windows") {
	7z x "$env:GOBO/$GOBO_CI_GE_ARCHIVE_FILENAME" -o"$env:GOBO"
} else {
	tar -xJf "$env:GOBO/$GOBO_CI_GE_ARCHIVE_FILENAME"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'tar -xJf $env:GOBO/$GOBO_CI_GE_ARCHIVE_FILENAME' exited with code $LastExitCode"
		exit $LastExitCode
	}
}
Remove-Item "$env:GOBO/$GOBO_CI_GE_ARCHIVE_FILENAME"

Remove-Item "$env:GOBO/bin" -Recurse -Force
Move-Item -Path "$env:GOBO/gobo/bin" -Destination "$env:GOBO"
Remove-Item "$env:GOBO/library" -Recurse -Force
Move-Item -Path "$env:GOBO/gobo/library" -Destination "$env:GOBO"
Remove-Item "$env:GOBO/tool" -Recurse -Force
Move-Item -Path "$env:GOBO/gobo/tool" -Destination "$env:GOBO"
Remove-Item "$env:GOBO/gobo" -Recurse -Force

gec --version --verbose
if ($LastExitCode -ne 0) {
	Write-Error "Command 'gec --version --verbose' exited with code $LastExitCode"
	exit $LastExitCode
}
