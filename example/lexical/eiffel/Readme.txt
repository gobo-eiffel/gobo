This directory contains the source code for a simple Eiffel scanner.
It uses Gelex to generate class EIFFEL_SCANNER.

Class EIFFEL_SCANNER has three creation procedures. `make' just creates
a scanner. `execute' creates a scanner and scans the files given in the 
command line, one by one. `benchmark' expects the command line to be made
up of a number 'nb' followed by a filename. It creates a scanner and scans
'nb' times the file given as second argument.

Note: This Eiffel scanner is just a simple example. It is not intended
to be perfect or to follow any Eiffel syntax standard. Moreover, it does
not generate any output.

To compile this example:

1. Use the script 'make_scanner.bat' to generate class EIFFEL_SCANNER
   if necessary.
2. Choose either `execute' or `benchmark' as the creation prodecure of
   the root class EIFFEL_SCANNER in your Ace file (ISE Eiffel: ise.ace,
   Halstenbach: hact.ace), your ESD file (Visual Eiffel: ve.esd) or
   your command line (SmallEiffel: se.bat or se.sh).
3. Use your favorite Eiffel compiler to compile the Eiffel system.
   With SmallEiffel, you can just execute the script se.bat (after
   possible modifications).
4. Execute the Eiffel scanner using
       eiffel_scanner filename1 ...
   if you selected `execute' as creation procedure, or
       eiffel_scanner nb filename
   if you selected `benchmark', where `filename', `filename1', etc. are
   filenames containing Eiffel classes and `nb' is an integer.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
