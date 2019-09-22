# Gobo Eiffel Parse Example: scalc

This folder contains the source code for the scientific calculator
using Unicode characters.

**To compile and run this example:**

1. Use the script `geant parser` to generate class `SCALC` if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run the calcultor:

        scalc

    and enter infix notation expressions to be evaluated (with possible
    Unicode operators like √), one per line.

## Authors

Copyright (c) 2019, Eric Bezault and others
