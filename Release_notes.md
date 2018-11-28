# Release notes - Gobo Eiffel 4.3

In this release, all tools and examples, and nearly all tests, have been 
converted to void-safe mode.

The usage of Xace files has been replaced by ECF files throughout the
entire Gobo package. There was no need to keep both Xace and ECF notations
in parallel anymore since all supported Eiffel compliers accept ECF files.
Note that the support for `gexace` and Xace files will be terminated in
the next release of Gobo.

To see what else is new, please read [History.md](History.md).

## Compiler specific notes

### ISE 18.07.10.1981 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

## Authors

Copyright (c) 1997-2018, Eric Bezault and others
