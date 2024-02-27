<#
.SYNOPSIS
	To be executed before CI/CD scripts.

.DESCRIPTION
	Check execution environment.
	Make sure that the C compiler is accessible.
	Set environment variables.

.PARAMETER CiTool
	CI tool (azure, github, gitlab).

.PARAMETER CCompiler
	C Compiler (zig, gcc, clang, msc).

.EXAMPLE
	# To be executed before CI/CD scripts on GitHub Actions pipeline:
	before_script.ps1 github zig

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

if ("$GOBO_CI_C_COMPILER" -eq "") {

	function Invoke-Environment {
		# See https://stackoverflow.com/questions/4384814/how-to-call-batch-script-from-powershell
		# See https://newbedev.com/how-to-call-batch-script-from-powershell
		<#
		.SYNOPSIS
			Invokes a command and imports its environment variables.

		.DESCRIPTION
			It invokes any cmd shell command (normally a configuration batch file) and
			imports its environment variables to the calling process. Command output is
			discarded completely. It fails if the command exit code is not 0. To ignore
			the exit code use the 'call' command.

		.PARAMETER Command
			Any cmd shell command, normally a configuration batch file.

		.EXAMPLE
			# Invokes Config.bat in the current directory or the system path
			Invoke-Environment Config.bat

		.EXAMPLE
			# Visual Studio environment: works even if exit code is not 0
			Invoke-Environment 'call "%VS100COMNTOOLS%\vsvars32.bat"'

		.EXAMPLE
			# This command fails if vsvars32.bat exit code is not 0
			Invoke-Environment '"%VS100COMNTOOLS%\vsvars32.bat"'
		#>
		param
		(
			[Parameter(Mandatory=$true)]
			[string] $Command
		)
		cmd /c "$Command > nul 2>&1 && set" | .{process{
			if ($_ -match '^([^=]+)=(.*)') {
				[System.Environment]::SetEnvironmentVariable($matches[1], $matches[2])
			}
		}}
		if ($LastExitCode -ne 0) {
			Write-Error "Command 'cmd /c $Command > nul 2>&1 && set' exited with code $LastExitCode"
			exit $LastExitCode
		}
	}

	$GOBO_CI_C_COMPILER = $CCompiler

	switch ($CiTool) {
		"azure" {
			$env:GOBO = $env:BUILD_REPOSITORY_LOCALPATH
			switch ($env:AGENT_OS) {
				"Linux" {
					$GOBO_CI_OS = "linux"
				}
				"Darwin" {
					$GOBO_CI_OS = "macos"
				}
				"Windows_NT" {
					$GOBO_CI_OS = "windows"
					if ($GOBO_CI_C_COMPILER -eq "msc") {
						# Setting the environment variables for `cl`.
						Invoke-Environment('"C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsx86_amd64.bat"')
					}
				}
				default {
					Write-Error "Platform not supported: $env:AGENT_OS"
					exit 1
				}
			}
		}
		"github" {
			$env:GOBO = $env:GITHUB_WORKSPACE
			switch ($env:RUNNER_OS) {
				"Linux" {
					$GOBO_CI_OS = "linux"
				}
				"MacOS" {
					$GOBO_CI_OS = "macos"
				}
				"Windows" {
					$GOBO_CI_OS = "windows"
					if ($GOBO_CI_C_COMPILER -eq "msc") {
						# Setting the environment variables for `cl`.
						# See https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md
						Invoke-Environment('"C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsx86_amd64.bat"')
					}
				}
				default {
					Write-Error "Platform not supported: $env:RUNNER_OS"
					exit 1
				}
			}
		}
		"gitlab" {
			$env:GOBO = $env:CI_PROJECT_DIR
			if ($env:CI_RUNNER_EXECUTABLE_ARCH -match '^([^/]+)/.*') {
				switch ($matches[1]) {
					"linux" {
						$GOBO_CI_OS = "linux"
						# Installing `gcc`.
						apt update
						if ($LastExitCode -ne 0) {
							Write-Error "Command 'apt update' exited with code $LastExitCode"
							exit $LastExitCode
						}
						apt install -y build-essential
						if ($LastExitCode -ne 0) {
							Write-Error "Command 'apt install -y build-essential' exited with code $LastExitCode"
							exit $LastExitCode
						}
					}
					"macos" {
						$GOBO_CI_OS = "macos"
					}
					"windows" {
						$GOBO_CI_OS = "windows"
						if ($GOBO_CI_C_COMPILER -eq "msc") {
							# Setting the environment variables for `cl`.
							# See https://gitlab.com/gitlab-org/ci-cd/shared-runners/images/gcp/windows-containers/blob/main/cookbooks/preinstalled-software/README.md
							Invoke-Environment('"C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsx86_amd64.bat"')
						}
					}
					default {
						Write-Error "Platform not supported: $env:RUNNER_OS"
						exit 1
					}
				}
			}
		}
		default {
			Write-Error "CI tool not supported: $CiTool"
			exit 1
		}
	}

	switch ($GOBO_CI_OS) {
		"linux" {
			$GOBO_CI_BUILD_SCRIPT = "install.sh"
			Get-Content "/etc/*-release"
			arch
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'arch' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
		"macos" {
			$GOBO_CI_BUILD_SCRIPT = "install.sh"
			system_profiler SPSoftwareDataType 
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'system_profiler SPSoftwareDataType' exited with code $LastExitCode"
				exit $LastExitCode
			}
			# Use 'uname -a' instead of 'arch' because 'arch' is not acurate under MacOS.
			# (See https://discussions.apple.com/thread/6072102?sortBy=best)
			uname -a
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'uname -a' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
		"windows" {
			$GOBO_CI_BUILD_SCRIPT = "install.bat"
		}
	}
	switch ($GOBO_CI_C_COMPILER) {
		"gcc" {
			gcc --version
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'gcc --version' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
		"clang" {
			clang --version
			if ($LastExitCode -ne 0) {
				Write-Error "Command 'clang --version' exited with code $LastExitCode"
				exit $LastExitCode
			}
		}
	}

	Write-Host "`$GOBO_CI_C_COMPILER = $GOBO_CI_C_COMPILER"
	Write-Host "`$GOBO_CI_BUILD_SCRIPT = $GOBO_CI_BUILD_SCRIPT"

	$env:PATH = "$env:GOBO/bin$([IO.Path]::PathSeparator)$env:PATH"

	& "$PSScriptRoot/set_gobo_version.ps1"
	if ($LastExitCode -ne 0) {
		Write-Error "Command 'set_gobo_version.ps1' exited with code $LastExitCode"
		exit $LastExitCode
	}

}
