# Gobo Eiffel Cop

This folder contains the source code of *Gobo Eiffel Cop*
(`gecop`). `gecop` is a tool to validate the conformance of
Eiffel tools (typically compilers) to the ECMA Eiffel standard.
It also tests the interoperability with the ISE Eiffel compiler.
It comes with a [validation suite](./validation/Readme.md) to 
exercise the Eiffel tool under test.

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.
* `validation`: this folder contains the Eiffel language conformance
  validation suite.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gecop` using:

        gecop --tool=<tool>

    where `<tool>` is either `ise`, `gec` or `gelint`.

## Authors

Copyright (c) 2018-2019, Eric Bezault and others
