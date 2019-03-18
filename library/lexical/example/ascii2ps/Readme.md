# Gobo Eiffel Lexical Example: ascii2ps

This folder contains the source code for a simple ASCII to PostScript
filter. It uses `gelex` to generate class `ASCII2PS`.

This filter can be used as a pretty-printer. One has just to send the
PostScript output file to a printer as shown in the script `pp.bat`.
This script can easily be adapted to shells from other platforms.

**To compile and run this example:**

1. Use the script `geant scanner` to generate class `ASCII2PS` if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:

       	geant compile_<compiler> 
   
    where `<compiler>` is either `ise` or `ge`.

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

**Note**: The options `-d` and `-t` are typically used to provide
the current date and time. It would have been more user-friendly
for user of `ascii2ps` if the date and time were internally computed
by the program. However there was no portable Date and Time Eiffel
library available at the time of writing and the solution adopted
was deemed satisfactory for the purpose of this example. Now that
we have the *Gobo Eiffel Time Library* it would be a good exercise
to use it here.

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
