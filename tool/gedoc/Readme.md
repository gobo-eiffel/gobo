# Gobo Eiffel Doc

This folder contains the source code of *Gobo Eiffel Doc*
(`gedoc`). `gedoc` is a tool which is able to generate
documentation from Eiffel classes or Eiffel libraries.
It can also be used as an Eiffel pretty-printer.
The code of `gedoc` is mainly based on the *Gobo Eiffel Tools
Library* (`$GOBO/library/tools`).

**Included in this folder:**

* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gedoc` using:

        gedoc <xace_or_ecf_file>

    where `<xace_or_ecf_file>` is either an Xace or ECF file.

## Authors

Copyright (c) 2017, Eric Bezault and others
