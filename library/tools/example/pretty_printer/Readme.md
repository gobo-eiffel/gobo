# Gobo Eiffel Tools Example: pretty_printer

This folder contains the source code for a simple Eiffel pretty-printer.

**To compile and run this example:**

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

2. Run the program using:

        pretty_printer <input_file> <output_file>

    where `<input_file>` is a file containing an Eiffel class text.
    Note that `<output_file`> can be the same file as `<input_file>`,
    however it is recommended to make a backup of the file to be
    converted in this case.

## Authors

Copyright (c) 2008-2019, Eric Bezault and others
