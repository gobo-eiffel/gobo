# Release notes - Gobo Eiffel 19.06.21.1

In order to see what is new in this release, please read [History.md](./History.md).

## Compiler specific notes

### ISE 19.05.10.3187 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
