This example shows how to use Gelex with iss-yacc from Halstenbach.
The directory contains the source code of the calculator example provided
with iss-yacc and the associated lexical analyzer generated with Gelex.

To compile this example:

1. Use the script 'make_parser.bat' to generate class CALC_PARSER and
   'make_scanner.bat' to generate class CALC_SCANNER if necessary.
2. Use your HACT Eiffel compiler to compile the Eiffel system using
   the provided Ace file (hact.ace).
3. Run the calcultor:
       calc
   and enter infix notation expressions to be evaluated, one per line.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
