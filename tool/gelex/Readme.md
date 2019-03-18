# Gobo Eiffel Lex

This folder contains the source code of *Gobo Eiffel Lex* (`gelex`).
The code of `gelex` is mainly based on the *Gobo Eiffel Lexical Library*
(`$GOBO/library/lexical`).

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

3. Run `gelex` using:

        gelex [--version][--help][-bcefhimsVwxz?][-a size]
            [--pragma=[no]line][-o filename][--] filename

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
