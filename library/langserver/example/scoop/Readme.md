# Gobo Eiffel Lnguage Server Protocol Example: langserver

This folder contains the source code for a simple LSP client/server
example where the client and the server are running in two different
SCOOP regions of the same process.

**To compile and run this example:**

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

2. Run the program using:

        langserver

## Authors

Copyright (c) 2025, Eric Bezault and others
