<#
.SYNOPSIS
	Install ISE Eiffel tools.

.DESCRIPTION
	Install ISE Eiffel tools.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.EXAMPLE
	# Install ISE Eiffel tools from the GitHub Actions pipeline:
	install_ise.ps1 github zig

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

$GOBO_CI_ISE_VERSION = "25.02"
$GOBO_CI_ISE_REVISION = "rev_98732"

switch ($GOBO_CI_OS) {
	"linux" {
		if ($GOBO_CI_ARCH -eq "arm64") {
			$env:ISE_PLATFORM = "linux-arm64"
		} else {
			$env:ISE_PLATFORM = "linux-x86-64"
		}
		$env:ISE_C_COMPILER = "gcc"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".tar.bz2"
		if ($CCompiler -ne "gcc") {
			gcc --version
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'gcc --version' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
	}
	"macos" {
		$env:ISE_PLATFORM = "macosx-x86-64"
		$env:ISE_C_COMPILER = "clang"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".tar.bz2"
		if ($CCompiler -ne "clang") {
			clang --version
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'clang --version' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
	}
	"windows" {
		$env:ISE_PLATFORM = "win64"
		$env:ISE_C_COMPILER = "msc_vc140"
		$GOBO_CI_ISE_ARCHIVE_EXTENSION = ".7z"
	}
}

$GOBO_CI_ISE_ARCHIVE_FILENAME = "Eiffel_${GOBO_CI_ISE_VERSION}_${GOBO_CI_ISE_REVISION}-$env:ISE_PLATFORM$GOBO_CI_ISE_ARCHIVE_EXTENSION"

Invoke-RestMethod -Method Get -Uri "https://ftp.eiffel.com/pub/beta/$GOBO_CI_ISE_VERSION/$GOBO_CI_ISE_ARCHIVE_FILENAME" -OutFile "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"
if ($GOBO_CI_OS -eq "windows") {
	7z x "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME" -o"$env:GOBO"
} else {
	tar -x -p --bzip2 -f "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'tar -x -p --bzip2 -f $env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME' exited with code $LastExitCode"
		exit $LastExitCode
	}
}
Remove-Item "$env:GOBO/$GOBO_CI_ISE_ARCHIVE_FILENAME"

$env:ISE_EIFFEL = "$env:GOBO/Eiffel_$GOBO_CI_ISE_VERSION"
$env:PATH = "$env:PATH$([IO.Path]::PathSeparator)$env:ISE_EIFFEL/studio/spec/$env:ISE_PLATFORM/bin"

# Use 'ecb' by default to run ISE Eiffel compiler.
# It runs faster and does not require GTK to be installed on Linux and MacOS.
# The generated EIFGEN is not compatible with 'ec', but this is not a problem
# here since we discard the EIFGEN at the end of the compilation.
$env:EC_EXECUTABLE="ecb"

# Make sure that we are using our version of the Gobo tools.
Remove-Item  "$env:ISE_EIFFEL/library/gobo/spec" -Recurse -Force

ecb -version
if ($LastExitCode -ne 0) {
	Write-Error "Command 'ecb -version' exited with code $LastExitCode"
	exit $LastExitCode
}
