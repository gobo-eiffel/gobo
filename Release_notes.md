# Release notes

In order to see what is new in this release, please read the [Release History](./History.md).

## Compiler specific notes

### ISE 25.02.9.8732 (ISE Eiffel)

* The ECF files for ISE Eiffel provided in this package are for
  Eiffel classic. In order to get ECF files configured for Eiffel
  for .NET, you will need to set the environment variable
  `$GOBO_DOTNET`, and then run the following commands:
  
  ```sh
    set GOBO_DOTNET=true
    cd %GOBO%
    geant clobber
    geant install
  ```

## Authors

Copyright (c) 1997-2025, Eric Bezault and others<br>
mailto:[ericb@gobosoft.com](mailto:ericb@gobosoft.com)<br>
https:[//www.gobosoft.com](https://www.gobosoft.com)
