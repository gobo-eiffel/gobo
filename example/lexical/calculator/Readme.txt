This example shows how to use Gelex with iss-yacc from Halstenbach.
The directory contains the source code of the calculator example provided
with iss-yacc and the associated lexical analyzer generated with Gelex.

To compile this example:

1. Use the script 'geant parser' to generate class CALC_PARSER and
   'geant scanner' to generate class CALC_SCANNER if necessary.

2. Use your HACT Eiffel compiler to compile the Eiffel system using
   the provided Ace file (hact.ace). Alternatively you can use 'geant'
   to launch the compilation:
   
       geant compile_hact
       
3. Run the calcultor:

       calculator

   and enter infix notation expressions to be evaluated, one per line.

--
Copyright (c) 1997-2001, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
