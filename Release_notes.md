# Release notes - Gobo Eiffel 4.0

During the past years, this package was available from the Git repository
only. But a lot of improvements and bug fixes have been made since the
last release, hence this new release. In particular:

* All libraries can now be compiled in void-safe mode. 
* The folders have been reorganized so that everything
  related to a library (source, examples, tests, documentation, ...)
  is self-contained in `$GOBO/library/<library-name>`, and
  likewise for utilities in `$GOBO/tool/<tool-name>`.
* No bootstrap is necessary anymore when getting the library classes
  from the Git repository. Just check out the classes and use them.
* Container classes can be used with the `across` construct.

For more details, see [History.md](History.md).

## Compiler specific notes

### ISE 16.11 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

### SE (SmartEiffel)

* The SmartEiffel compiler is not supported anymore.

### VE (Visual Eiffel)

* The Visual Eiffel compiler is not supported anymore.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
