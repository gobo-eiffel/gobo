This directory contains the source code for the reverse polish notation
calculator used as an example in Geyacc documentation.
Please refer to $GOBO/doc/geyacc/examples.html for details.

To compile this example:

1. Use the script 'geant parser' to generate class RPCALC if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace,
   SmallEiffel: se.ace) or ESD file (Visual Eiffel: ve.esd). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'hact', 've' or 'se'.

3. Run the calcultor:

       rpcalc

   and enter reverse polish notation expressions to be evaluated, one
   per line.

--
Copyright (c) 1997-2001, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
