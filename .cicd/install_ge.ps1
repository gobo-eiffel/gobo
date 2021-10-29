<#
.SYNOPSIS
	Install Gobo Eiffel tools.

.DESCRIPTION
	Install Gobo Eiffel tools.

.PARAMETER CiTool
	CI tool (github, gitlab).

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
	[ValidateSet("github", "gitlab")] 
	[string] $CiTool
)

. "$PSScriptRoot/before_script.ps1" $CiTool

switch ($GOBO_CI_OS) {
	"linux" {
		# See limitations (Permission Loss) in https://github.com/actions/download-artifact
		bash -c 'chmod a+x "$GOBO/bin/ge*"'
	}
	"macos" {
		# See limitations (Permission Loss) in https://github.com/actions/download-artifact
		bash -c 'chmod a+x "$GOBO/bin/ge*"'
	}
}

gec --version
