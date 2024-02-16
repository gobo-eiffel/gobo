<#
.SYNOPSIS
	Set the version of Gobo corresponding to the current commit in class UT_GOBO_VERSION.

.DESCRIPTION
	Set the version of Gobo corresponding to the current commit in class UT_GOBO_VERSION.

.EXAMPLE
	# Set the version of Gobo corresponding to the current commit in class UT_GOBO_VERSION:
	set_gobo_version.ps1

.NOTES
	Copyright: "Copyright (c) 2024 Eric Bezault and others"
	License: "MIT License"
#>

param
(
)

$GOBO_DATE = git show -s --date=iso --format=%cd
$GOBO_DATE = [datetime]$GOBO_DATE
$GOBO_DATE = $GOBO_DATE.ToUniversalTime().ToString("yy.MM.dd")
$GOBO_SHA1 = git rev-parse --short HEAD
$GOBO_VERSION = "$GOBO_DATE+$GOBO_SHA1"
$GOBO_PATTERN = "[0-9a-zA-Z]{2}\.[0-9a-zA-Z]{2}\.[0-9a-zA-Z]{2}\+[0-9a-zA-Z]{9}"
$GOBO_FILE = "$env:GOBO/library/utility/src/support/ut_gobo_version.e"

(Get-Content "$GOBO_FILE") -replace "$GOBO_PATTERN", "$GOBO_VERSION" | Out-File -Encoding "UTF8" "$GOBO_FILE"
