# Gobo Eiffel Test

This folder contains the source code of *Gobo Eiffel Test* (`getest`).
The code of `getest` is mainly based on th*e Gobo Eiffel Test Library*
(`$GOBO/library/test`).

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

3. Run `getest` using:

        getest [-aceghvV?][--help][--version][--verbose]
             [-D <name>=<value>|--define=<name>=<value>]*
             [--class=<regexp>][--feature=<regexp>]
             [--compile=<command>][--ise|--ge|<filename>]

## Authors

Copyright (c) 2000-2019, Eric Bezault and others
