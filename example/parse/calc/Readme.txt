This directory contains the source code for the infix notation calculator 
used as an example in Geyacc documentation.
Please refer to $GOBO\doc\geyacc\examples.html for details.

To compile this example:

1. Use the script 'make_parser.bat' to generate class CALC if necessary.
2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace) or
   ESD file (Visual Eiffel: ve.esd). With SmallEiffel, you can just execute
   the script se.bat or se.sh (after possible modifications).
5. Run the calcultor:
       calc
   and enter infix notation expressions to be evaluated, one per line.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
