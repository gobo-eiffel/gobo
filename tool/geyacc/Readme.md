# Gobo Eiffel Yacc

This folder contains the source code of *Gobo Eiffel Yacc* (`geyacc`).
The code of `geyacc` is mainly based on the *Gobo Eiffel Parse Library*
(`$GOBO/library/parse`).

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `geyacc` using:

        geyacc [--version][--help][-hxV?][--(new|old)_typing]
            [--pragma=[no]line][--doc=(html|xml)][-t classname]
            [-k filename][-v filename][-o filename] filename

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
