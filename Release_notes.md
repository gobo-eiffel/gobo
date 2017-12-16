# Release notes - Gobo Eiffel 4.2

The focus of this release was to support multi-threading. 
In particular:

* `gec`, the Gobo Eiffel Compiler, can now compile Eiffel applications
  in multi-threaded mode, using the same EiffelThread library as ISE Eiffel.
* Made `gelint` multi-threaded. It now runs almost 3 times faster on
  a 4-CPU machine.
* Made `gedoc` multi-threaded. It now runs almost 3 times faster on 
  a 4-CPU machine.

Note that this release does not support SCOOP yet.

For more details, see [History.md](History.md).

## Compiler specific notes

### ISE 17.05.10.0416 (ISE Eiffel)

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
