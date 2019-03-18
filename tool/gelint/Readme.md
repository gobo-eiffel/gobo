# Gobo Eiffel Lint

This folder contains the source code of *Gobo Eiffel Lint*
(`gelint`). `gelint` is a tool which is able to analyze Eiffel
source code and report validity errors and useful warnings
to help the Eiffel programmers write better code and be aware
of interoperability problems between various Eiffel compilers.
The code of `gelint` is mainly based on the *Gobo Eiffel Tools
Library* (`$GOBO/library/tools`).

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gelint` using:

        gelint <ecf_file>

    where `<ecf_file>` is an ECF file describing the Eiffel system.

## Authors

Copyright (c) 2000-2019, Eric Bezault and others
