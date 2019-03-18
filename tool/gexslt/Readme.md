# Gobo Eiffel XSLT

This folder contains the source code of the
*Gobo Eiffel XSLT* 2.0 command-line processor (`gexslt`). 
The code of `gexslt` is mainly based on the *Gobo Eiffel
Xpath and XSLT libraries*, which in turn use the *Gobo
Eiffel XML Library*.

**Included in this folder:**

* `config`: config files used when running `gexslt`.
* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to
   launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `gexslt` using:

        gexslt

    This will give you the usage message.

## Authors

Copyright (c) 2004-2019, Colin Adams and others
