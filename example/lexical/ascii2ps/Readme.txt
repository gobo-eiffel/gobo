This directory contains the source code for a simple ASCII to PostScript
filter. It uses Gelex to generate class ASCII2PS.

This filter can be used as a pretty-printer. One has just to send the
PostScript output file to a printer as shown in the script 'pp.bat'.
This script can easily be adapted to shells from other platforms.

To compile this example:

1. Use the script 'make_scanner.bat' to generate class ASCII2PS if necessary.
2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace) or
   ESD file (Visual Eiffel: ve.esd). With SmallEiffel, you can just execute
   the script se.bat or se.sh (after possible modifications).
3. Run the filter using:

       ascii2ps [-h][-n][-d date][-t time][-l][-2][filename|-][filename|-]

   where the options are defined as follows:

     -h    Display the above usage message on the standard output
           and exit with code 0.
     -n    Do not print the input filename in the title bar of the
           PostScript output. Default: print filename.
     -d date
           Print 'date' in the upper left corner of the PostScript
           output. Default: 00/00/00.
     -t time
           Print 'time' in the upper left corner of the PostScript
           output. Default: 00:00:00.
     -l    Use US-letter page format. Default: A4.
     -2    Prepare PostScript output to be printed on double-sided
           paper. Deault: single-sided.
     --    Mark the end of the option list. Useful when dealing with 
           filenames starting with an underscore.
     filename
           Input filename. Use standard input if not specified or 
           when '-' is given instead.
     filename
           Output filename. Use standard output if not specified or 
           when '-' is given instead.

Note: The options '-d' and '-t' are typically used to provide
the current date and time. It would have been more user-friendly
for user of 'ascii2ps' if the date and time were internally computed
by the program. However there is no portable Date and Time Eiffel
library available at the time of writing and the solution adopted
was deemed satisfactory for the purpose of this example. 

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
