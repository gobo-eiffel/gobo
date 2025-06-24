<#
.SYNOPSIS
	Install Zig toolchain.

.DESCRIPTION
	Install Zig toolchain.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.EXAMPLE
	# Install Zig toolchain from the GitHub Actions pipeline:
	install_zig.ps1 github

.NOTES
	Copyright: "Copyright (c) 2024-2025, Eric Bezault and others"
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

$GOBO_CI_ZIG_VERSION = "0.14.0"
$GOBO_CI_ZIG_PATH = "https://ziglang.org/download/$GOBO_CI_ZIG_VERSION"
# $GOBO_CI_ZIG_PATH = "https://ziglang.org/builds"

switch ($GOBO_CI_OS) {
	"linux" {
		if ($GOBO_CI_ARCH -eq "arm64") {
			$GOBO_CI_ZIG_PLATFORM = "linux-aarch64"
		} else {
			$GOBO_CI_ZIG_PLATFORM = "linux-x86_64"
		}
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"macos" {
		if ($GOBO_CI_ARCH -eq "arm64") {
			$GOBO_CI_ZIG_PLATFORM = "macos-aarch64"
		} else {
			$GOBO_CI_ZIG_PLATFORM = "macos-x86_64"
		}
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"windows" {
		if ($GOBO_CI_ARCH -eq "arm64") {
			$GOBO_CI_ZIG_PLATFORM = "windows-aarch64"
		} else {
			$GOBO_CI_ZIG_PLATFORM = "windows-x86_64"
		}
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".zip"
	}
}

$GOBO_CI_ZIG_ARCHIVE_BASENAME = "zig-${GOBO_CI_ZIG_PLATFORM}-${GOBO_CI_ZIG_VERSION}"
$GOBO_CI_ZIG_ARCHIVE_FILENAME = "${GOBO_CI_ZIG_ARCHIVE_BASENAME}${GOBO_CI_ZIG_ARCHIVE_EXTENSION}"

Invoke-RestMethod -Method Get -Uri "$GOBO_CI_ZIG_PATH/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -OutFile "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
if ($GOBO_CI_OS -eq "windows") {
	Install-Module -Name 7Zip4PowerShell -Force
	Expand-7Zip -ArchiveFileName "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -TargetPath "$env:GOBO"
} else {
	tar -xJf "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'tar -xJf $env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME' exited with code $LastExitCode"
		exit $LastExitCode
	}
}
Remove-Item "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
Move-Item -Path "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_BASENAME" -Destination "$env:GOBO/tool/gec/backend/c/zig"

# Patch zig package to avoid having warnings when compiling 
# the standard C libraries for the first time.
& "$PSScriptRoot/patch_zig.ps1" "$env:GOBO/tool/gec/backend/c/zig"
if ($LastExitCode -ne 0) {
	Write-Error "Command 'patch_zig.ps1 $env:GOBO/tool/gec/backend/c/zig' exited with code $LastExitCode"
	exit $LastExitCode
}

Write-Host "Zig version: "
& "$env:GOBO/tool/gec/backend/c/zig/zig" version
if ($LastExitCode -ne 0) {
	Write-Error "Command '$env:GOBO/tool/gec/backend/c/zig/zig version' exited with code $LastExitCode"
	exit $LastExitCode
}
if (($GOBO_CI_OS -eq "linux" -or $GOBO_CI_OS -eq "macos") -and $CiTool -ne "gitlab") {
	file "$env:GOBO/tool/gec/backend/c/zig/zig"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'file $env:GOBO/tool/gec/backend/c/zig/zig' exited with code $LastExitCode"
		exit $LastExitCode
	}
}
& "$env:GOBO/tool/gec/backend/c/zig/zig" cc --version
if ($LastExitCode -ne 0) {
	Write-Error "Command '$env:GOBO/tool/gec/backend/c/zig/zig cc --version' exited with code $LastExitCode"
	exit $LastExitCode
}
