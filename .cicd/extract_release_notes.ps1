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
Gobo Eiffel is an open-source collection of compilers, tools and libraries for the Eiffel programming language.

### Overview

- 📋 [Release notes](https://github.com/gobo-eiffel/gobo/blob/master/History.md)
- 📚 [Documentation](http://gobo-eiffel.gobosoft.com)
- 🌐 [Official website](https://www.gobosoft.com)

### Integrations

- [VS Code extension](https://marketplace.visualstudio.com/items?itemName=gobosoft.gobo-eiffel)
- [VSCodium extension](https://open-vsx.org/extension/gobosoft/gobo-eiffel)
- [Cursor extension](https://open-vsx.org/extension/gobosoft/gobo-eiffel)

### Compatibility

- Gobo Eiffel works with EiffelStudio 26.09 and with Gobo Eiffel $Version itself.

Happy Eiffel coding!
"@

$output | Set-Content -Path $OutputFilePath -Encoding utf8
