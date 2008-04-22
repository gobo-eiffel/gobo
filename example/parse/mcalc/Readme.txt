This directory contains the source code for the calculator with memory
used as an example in Geyacc documentation.
Please refer to $GOBO/doc/geyacc/examples.html for details.

To compile this example:

1. Use the script 'geant parser' to generate class MCALC if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.

3. Run the calcultor:

       mcalc

   and enter infix notation expressions to be evaluated (with possible
   memory storage operations), one per line.

--
Copyright (c) 1997-2008, Eric Bezault and others
