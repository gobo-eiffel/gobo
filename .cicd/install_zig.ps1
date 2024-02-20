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
	Copyright: "Copyright (c) 2024, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet("azure", "github", "gitlab")] 
	[string] $CiTool
)

. "$PSScriptRoot/before_script.ps1" $CiTool zig

$GOBO_CI_ZIG_VERSION = "0.12.0-dev.2811+3cafb9655"

switch ($GOBO_CI_OS) {
	"linux" {
		$GOBO_CI_ZIG_PLATFORM = "linux-x86_64"
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"macos" {
		$GOBO_CI_ZIG_PLATFORM = "macos-x86_64"
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".tar.xz"
	}
	"windows" {
		$GOBO_CI_ZIG_PLATFORM = "windows-x86_64"
		$GOBO_CI_ZIG_ARCHIVE_EXTENSION = ".zip"
	}
}

$GOBO_CI_ZIG_ARCHIVE_BASENAME = "zig-${GOBO_CI_ZIG_PLATFORM}-${GOBO_CI_ZIG_VERSION}"
$GOBO_CI_ZIG_ARCHIVE_FILENAME = "${GOBO_CI_ZIG_ARCHIVE_BASENAME}${GOBO_CI_ZIG_ARCHIVE_EXTENSION}"

Invoke-RestMethod -Method Get -Uri "https://ziglang.org/builds/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -OutFile "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
if ($GOBO_CI_OS -eq "windows") {
	Install-Module -Name 7Zip4PowerShell -Force
	Expand-7Zip -ArchiveFileName "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME" -TargetPath "$env:GOBO"
} else {
	tar -xJf "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
}
Remove-Item "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_FILENAME"
Move-Item -Path "$env:GOBO/$GOBO_CI_ZIG_ARCHIVE_BASENAME" -Destination "$env:GOBO/tool/gec/backend/c/zig"

# Patch zig package to avoid having warnings when compiling 
# the standard C libraries for the first time.
. "$PSScriptRoot/patch_zig.ps1" "$env:GOBO/tool/gec/backend/c/zig"

Write-Host "Zig version: "
& "$env:GOBO/tool/gec/backend/c/zig/zig" version
& "$env:GOBO/tool/gec/backend/c/zig/zig" cc --version
