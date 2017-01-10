# Gobo Eiffel Ant

This folder contains the source code of *Gobo Eiffel Ant* (`geant`).
`geant` is a build tool for Eiffel, modeled after the Jakarta Ant build
tool for Java.

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `overview.html`.
* `example`: this folder contains examples for this tool.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` itself to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `geant` using:

        geant [-hV?][-b buildfilename] [target]

## Authors

Copyright (c) 2001-2017, Eric Bezault and others
