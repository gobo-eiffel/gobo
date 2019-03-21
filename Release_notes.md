# Release notes - Gobo Eiffel 19.03.21.1

This release is the first one with the new version number format.
This format is similar to the one adopted by other programs with 
the major and minor numbers corresponding to the year and month,
followed by an identification of the code used to build the release
(here the day on which the code has been committed to Git, followed
 by the rank of this commit on that day).

All Gobo ECF files are now SCOOP capable. It does not mean that the
code in Gobo takes advantage of the SCOOP model, but rather that its
classes can be used in a SCOOP application.

As announced before, this release does not include Xace files
anymore, and `gexace` has been removed.

A new tool has been added: `gecop`. It's a tool to validate the
conformance of Eiffel tools (typically compilers) to the ECMA 
Eiffel standard. It also tests the interoperability with the 
ISE Eiffel compiler. It comes with a validation suite, although
not complete yet.

To see what else is new, please read [History.md](./History.md).

## Compiler specific notes

### ISE 18.11.10.2592 (ISE Eiffel)

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
