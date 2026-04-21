<#
.SYNOPSIS
	Extract release notes from History file.

.DESCRIPTION
	Extract release notes from History file.

.PARAMETER Version
	Release Version number.

.PARAMETER InputFilePath
	File containing the Changelogs.

.PARAMETER OutputFilePath
	File where to write the release notes.

.EXAMPLE
	# Extract release notes from file History.md for version 1.2.3:
	extract_release_notes.ps1 1.2.3 History.md release_notes.md

.NOTES
	Copyright: "Copyright (c) 2026 Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[string] $Version,
	[Parameter(Mandatory=$true)]
	[string] $InputFilePath,
	[Parameter(Mandatory=$true)]
	[string] $OutputFilePath
)

$ErrorActionPreference = "Stop"

$output = @"
The Gobo Eiffel Project provides the Eiffel community with free and portable Eiffel tools and libraries.
Please see the [release notes](https://github.com/gobo-eiffel/gobo/blob/master/History.md). Gobo Eiffel works fine with EiffelStudio 25.12 and Gobo Eiffel $Version itself.
The Gobo Eiffel documentation can be browsed on-line at: https://www.gobosoft.com.
Gobo Eiffel is also available from [VS Code](https://marketplace.visualstudio.com/items?itemName=gobosoft.gobo-eiffel) and [VSCodium](https://open-vsx.org/extension/gobosoft/gobo-eiffel).

Happy Eiffeling.
"@

$output | Set-Content -Path $OutputFilePath -Encoding utf8
