This directory contains the source code for a simple Eiffel parser.
It uses Gelex to generate class EIFFEL_SCANNER and Geyacc to generate
classes EIFFEL_PARSER and EIFFEL_TOKENS.

Class EIFFEL_PARSER has three creation procedures. `make' just creates
a parser. `execute' creates a parser and parses the files given in the 
command line, one by one. `benchmark' expects the command line to be made
up of a number 'nb' followed by a filename. It creates a parser and parses
'nb' times the file given as second argument.

Note: This Eiffel parser is just a simple example. It is not intended
to be perfect or to follow any Eiffel syntax standard. Moreover, it does
not generate any abstract syntax tree and there is no output.

To compile this example:

1. Use the script 'make_scanner.bat' to generate class EIFFEL_SCANNER
   if necessary.
2. Use the script 'make_parser.bat' to generate classes EIFFEL_PARSER
   and EIFFEL_TOKENS if necessary.
3. Choose either `execute' or `benchmark' as the creation prodecure of
   the root class EIFFEL_PARSER in your Ace file (ISE Eiffel: ise.ace,
   Halstenbach: hact.ace), your ESD file (Visual Eiffel: ve.esd) or
   your command line (SmallEiffel: se.bat or se.sh).
4. Use your favorite Eiffel compiler to compile the Eiffel system.
   With SmallEiffel, you can just execute the script se.bat (after
   possible modifications).
5. Execute the Eiffel parser using
       eiffel_parser filename1 ...
   if you selected `execute' as creation procedure, or
       eiffel_parser nb filename
   if you selected `benchmark', where `filename', `filename1', etc. are
   filenames containing Eiffel classes and `nb' is an integer.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
