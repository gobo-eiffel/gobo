This directory contains the source code for the infix notation calculator 
used as an example in Geyacc documentation.
Please refer to $GOBO/doc/geyacc/examples.html for details.

To compile this example:

1. Use the script 'make parser' to generate class CALC if necessary.
2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace),
   ESD file (Visual Eiffel: ve.esd) or loadpath file (SmallEiffel:
   loadpath.se). If you have GNU make, you can alternatively type:
   'make ise', 'make hact', 'make ve' or 'make se'.
5. Run the calcultor:
       calc
   and enter infix notation expressions to be evaluated, one per line.

--
Copyright (c) 1997-2000, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
