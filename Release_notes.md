# Release notes - Gobo Eiffel 4.1

The focus of this release has been put on Continuous Integration
and Continuous Delivery. Indeed the technology behind the tools
of the Gobo package makes them very suitable for this kind of
tasks, complementary to your favorite Eiffel development tools
such as ISE EiffelStudio. Therefore:

* The documentation of `gelint`, a useful tool to check the validity
  rules in your Eiffel system, has been added.
* A new tool, `gedoc`, for pretty-printing and generation of
  HTML documentation out of Eiffel classes, has been implemented.

For more details, see [History.md](History.md).

## Compiler specific notes

### ISE 16.05.9.8969 and 17.01.9.9700 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:

		set GOBO_DOTNET=true
		cd %GOBO%
		geant clobber
		geant install

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
