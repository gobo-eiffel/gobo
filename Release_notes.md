# Gobo Eiffel version 4.0, Release notes

Note that this release is not a full-fledged version. In particular some 
of its documentation is out of date or missing. It was decided to build 
this package anyway because it contains a lot of improvements and 
bug fixes since the last release. In particular:

+ All libraries can now be compiled in void-safe mode. 
+ The folders have been reorganized so that everything
  related to a library (source, examples, tests, documentation, ...)
  is self-contained in `$GOBO/library/<library-name>`, and
  likewise for utilities in `$GOBO/tool/<tool-name>`.
+ No bootstrap is necessary anymore when getting the library classes
  from the Git repository. Just check out the classes and use them.

## Compiler specific notes

### ISE 16.11 (ISE Eiffel)

+ The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

### SE (SmartEiffel)

+ The SmartEiffel compiler is not supported anymore.

### VE (Visual Eiffel)

+ The Visual Eiffel compiler is not supported anymore.
