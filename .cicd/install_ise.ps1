<#
.SYNOPSIS
	Install ISE Eiffel tools.

.DESCRIPTION
	Install ISE Eiffel tools.

.PARAMETER CiTool
	CI tool (github, gitlab, travis).

.EXAMPLE
	# Install ISE Eiffel tools from the GitHub Actions pipeline:
	install_ge.ps1 github

.NOTES
	Copyright: "Copyright (c) 2021, Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[ValidateSet('github', 'gitlab', 'travis')] 
	[string] $CiTool
)

. "$PSScriptRoot/before_script.ps1" $CiTool

switch ($GOBO_CI_OS) {
	"linux" {
		$env:ISE_PLATFORM = "linux-x86-64"
		$env:ISE_C_COMPILER = "gcc"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".tar.bz2"
		sudo apt-get update
		sudo apt-get -y install libgtk2.0-0
	}
	"macos" {
		$env:ISE_PLATFORM = "macosx-x86-64"
		$env:ISE_C_COMPILER = "clang"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".tar.bz2"
	}
	"windows" {
		$env:ISE_PLATFORM = "win64"
		$env:ISE_C_COMPILER = "msc_vc140"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".7z"
	}
}

$GOBO_CI_ISE_VERSION = "20.05"
$GOBO_CI_ISE_REVISION = "rev_104521"
$GOBO_CI_ISE_ARCHIVE_FILENAME = "Eiffel_${GOBO_CI_ISE_VERSION}_${GOBO_CI_ISE_REVISION}-$env:ISE_PLATFORM$GOBO_CI_ISE_ARCHIVE_EXTENSION"

Invoke-RestMethod -Method Get -Uri "https://ftp.eiffel.com/pub/beta/nightly/$GOBO_CI_ISE_ARCHIVE_FILENAME" -OutFile "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"
if ($GOBO_CI_OS -eq "windows") {
	Install-Module -Name 7Zip4PowerShell -Force
	Expand-7Zip -ArchiveFileName "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME" -TargetPath "$env:GOBO"
} else {
	tar -x -p --bzip2 -f "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"
}
Remove-Item "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"

$env:ISE_EIFFEL = "$env:GOBO/Eiffel_$GOBO_CI_ISE_VERSION"
$env:PATH = "$env:PATH$([IO.Path]::PathSeparator)$env:ISE_EIFFEL/studio/spec/$env:ISE_PLATFORM/bin"

# Make sure that we are using our version of the Gobo tools.
Remove-Item  "$env:ISE_EIFFEL/library/gobo/spec" -Recurse -Force
ecb -version
