# Gobo Eiffel Preprocessor

This folder contains the source code of *Gobo Eiffel Preprocessor*
(`gepp`). `gepp` is a simple filter which works pretty much like the
well known C-preprocessor, but it only supports a small subset of
the preprocessing instructions. `gepp` has been developed using
`gelex` and `geyacc`, and as such can be used as an example on how
to use these two utilities.

A small "User's Manual" documentation in HTML format is available in
`$GOBO/library/common/doc/portability/gepp.html`.

`gepp` has been developed to solve some portability problems when trying
to make the classes from this package compilable with any Eiffel compiler.
See `$GOBO/library/common/doc/portability` for details on portability issues.

**Included in this folder:**

* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use the script `geant parser` to generate class `GEPP_PARSER` and
   `geant scanner` to generate class `GEPP_SCANNER` if necessary.

3. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gepp` using:

        gepp [--version][--help][-hV?lM][--lines][-Dname ...][filename | -][filename | -]

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
