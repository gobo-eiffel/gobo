<#
.SYNOPSIS
	Patch C files in Zig package to avoid warnings when compiling 
	the standard C libraries for the first time.

.DESCRIPTION
	Patch C files in Zig package to avoid warnings when compiling 
	the standard C libraries for the first time.

.EXAMPLE
	# Patch C files in Zig package:
	patch_zig.ps1 <path_to_zig>

.NOTES
	Copyright: "Copyright (c) 2024 Eric Bezault and others"
	License: "MIT License"
#>

param
(
	[Parameter(Mandatory=$true)]
	[string] $ZigPath
)

$ErrorActionPreference = "Stop"

Remove-Item  "$ZigPath/doc" -Recurse -Force

# Patch, to avoid having -Wincompatible-pointer-types warnings.
$ZIG_FILE = "$ZigPath/lib/libc/mingw/stdio/mingw_pformat.c"
if (Test-Path -Path "$ZIG_FILE") {
	$old_pattern = "  return __gdtoa\( &fpi, e, &x\.__pformat_fpreg_bits, &k, mode, nd, dp, &ep \);"
	$new_pattern = "  return __gdtoa( &fpi, e, (ULong *)&x.__pformat_fpreg_bits, &k, mode, nd, dp, &ep );"
	(Get-Content "$ZIG_FILE") -replace "$old_pattern", "$new_pattern" | Out-File "$ZIG_FILE"
}
