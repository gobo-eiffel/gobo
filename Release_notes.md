# Release notes - Gobo Eiffel 20.01.21.1

In order to see what is new in this release, please read [History.md](./History.md).

## Compiler specific notes

### ISE 19.05.10.3187 and 19.10.12.3842 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

## Authors

Copyright (c) 1997-2020, Eric Bezault and others
