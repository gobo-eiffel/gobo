<#
.SYNOPSIS
	Build Gobo Eiffel delivery.

.DESCRIPTION
	Build Gobo Eiffel delivery.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.EXAMPLE
	# Build Gobo Eiffel delivery from the GitHub Actions pipeline:
	build_delivery.ps1 github zig

.NOTES
	Copyright: "Copyright (c) 2024, Eric Bezault and others"
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

. "$PSScriptRoot/build_ge.ps1" $CiTool  $CCompiler
if ($LastExitCode -ne 0) {
	Write-Error "Command 'build_ge.ps1 $CiTool  $CCompiler' exited with code $LastExitCode"
	exit $LastExitCode
}

Set-Location "$env:GOBO"

geant delivery
if ($LastExitCode -ne 0) {
	Write-Error "Command 'geant delivery' exited with code $LastExitCode"
	exit $LastExitCode
}

Set-Location "$env:GOBO/.."

$GOBO_CI_GE_VERSION = gec --version
if ($LastExitCode -ne 0) {
	Write-Error "Command 'gec --version' exited with code $LastExitCode"
	exit $LastExitCode
}

switch ($GOBO_CI_OS) {
	"linux" {
		$GOBO_CI_GE_PLATFORM = "linux-x86_64"
		$GOBO_CI_GE_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"macos" {
		$GOBO_CI_GE_PLATFORM = "macos-x86_64"
		$GOBO_CI_GE_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"windows" {
		$GOBO_CI_GE_PLATFORM = "windows-x86_64"
		$GOBO_CI_GE_ARCHIVE_EXTENSION = ".7z"
	}
}

$GOBO_CI_GE_ARCHIVE_FILENAME = "gobo-${GOBO_CI_GE_PLATFORM}-${GOBO_CI_GE_VERSION}${GOBO_CI_GE_ARCHIVE_EXTENSION}"

if ($GOBO_CI_OS -eq "windows") {
	Install-Module -Name 7Zip4PowerShell -Force
	Compress-7Zip -ArchiveFileName "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -Path "$env:GOBO" -Format SevenZip
} else {
	tar -cJf "$env:GOBO/../$GOBO_CI_GE_ARCHIVE_FILENAME" "$env:GOBO"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'tar -cJf $env:GOBO/../$GOBO_CI_GE_ARCHIVE_FILENAME $env:GOBO' exited with code $LastExitCode"
		exit $LastExitCode
	}
}

Move-Item -Path "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -Destination "$env:GOBO"
