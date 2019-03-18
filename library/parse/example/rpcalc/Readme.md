# Gobo Eiffel Parse Example: rpcalc

This folder contains the source code for the reverse polish notation
calculator used as an example in `geyacc` documentation.
Please refer to
[`$GOBO/tool/geyacc/doc/examples.html`](http://www.gobosoft.com/eiffel/gobo/geyacc/examples.html)
for details.

**To compile and run this example:**

1. Use the script `geant parser` to generate class `RPCALC` if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run the calcultor:

        rpcalc

   and enter reverse polish notation expressions to be evaluated, one
   per line.

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
