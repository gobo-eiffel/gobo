# Gobo Eiffel Language Server

This folder contains the source code of *Gobo Eiffel Language Server*
(`gelsp`). `gelsp` implements the
[language server protocol](https://microsoft.github.io/language-server-protocol/)
for the Eiffel language.
The code of `gelsp` is mainly based on the *Gobo Eiffel Tools
Library* (`$GOBO/library/tools`).

**Included in this folder:**

* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:

        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gelsp` using:

        gelsp

## Authors

Copyright (c) 2025, Eric Bezault and others
