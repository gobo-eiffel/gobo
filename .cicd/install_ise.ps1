<#
.SYNOPSIS
	Install ISE Eiffel tools.

.DESCRIPTION
	Install ISE Eiffel tools.

.PARAMETER CiTool
	CI tool (github, gitlab, travis).

.EXAMPLE
	# Install Gobo Eiffel tools from the GitHub Actions pipeline:
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
