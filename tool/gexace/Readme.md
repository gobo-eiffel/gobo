# Gobo Eiffel Xace

This folder contains the source code of *Gobo Eiffel Xace* (`gexace`).

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where <compiler> is either `ise` or `ge`.

2. Run `gexace` using:

        gexace [defines] [options] command [xace-file]

    where:

        defines:  --define="VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*"
        options:  --verbose|--shallow
        command:  --system=(ge|ise) [--format=(ace|ecf|xace)][--output=<filename>]
        command:  --library=(ge|ise) [--format=(ace|ecf|xace)][--output=<filename>]
        command:  --validate

## Authors

Copyright (c) 2001-2017, Eric Bezault and others
