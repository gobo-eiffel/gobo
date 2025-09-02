# Gobo Eiffel Parse Example: mcalc

This folder contains the source code for the calculator with memory
used as an example in `geyacc` documentation.
Please refer to
[`$GOBO/tool/geyacc/doc/examples.html`](https://www.gobosoft.com/eiffel/gobo/tool/geyacc/doc/examples.html)
for details.

**To compile and run this example:**

1. Use the script `geant parser` to generate class `MCALC` if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run the calcultor:

        mcalc

    and enter infix notation expressions to be evaluated (with possible
    memory storage operations), one per line.

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
