# Gobo Eiffel Lexical Example: eiffel_scanner

This folder contains the source code for a simple Eiffel scanner.
It uses `gelex` to generate class `EIFFEL_SCANNER`.

Class `EIFFEL_SCANNER` has three creation procedures. `make` just creates
a scanner. `execute` creates a scanner and scans the files given in the 
command line, one by one. `benchmark` expects the command line to be made
up of a number `nb` followed by a filename. It creates a scanner and scans
`nb` times the file given as second argument.

**Note**: This Eiffel scanner is just a simple example. It is not intended
to be perfect or to follow any Eiffel syntax standard. Moreover, it does
not generate any output. A full-fledged Eiffel scanner is provided in
the *Gobo Eiffel Tools Library* in `$Gobo/library/tools/src/eiffel/parser`.

**To compile and run this example:**

1. Use the script `geant scanner` to generate class `EIFFEL_SCANNER`
   if necessary.

2. Choose either `execute` or `benchmark` as the creation procedure of
   the root class `EIFFEL_SCANNER` in yourXace or ECF file.

3. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e,g, `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

4. Execute the Eiffel scanner using

        eiffel_scanner filename1 ...

    if you selected `execute` as creation procedure, or

        eiffel_scanner nb filename

   if you selected `benchmark`, where `filename`, `filename1`, etc. are
   filenames containing Eiffel classes and `nb` is an integer.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
