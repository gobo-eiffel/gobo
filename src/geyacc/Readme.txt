This directory contains the source code of Gobo Eiffel Yacc (geyacc).
The code of Geyacc is mainly based on the Gobo Eiffel Parse Library.

To compile Geyacc:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace) or
   ESD file (Visual Eiffel: ve.esd). With SmallEiffel, you can just execute
   the script se.bat or se.sh (after possible modifications).
2. Run Geyacc using:

       geyacc [--version][--help][-hxV?][-t classname]
           [-v filename][-o filename] filename

A "User's Manual" documentation for Geyacc, in HTML format, is provided
in "$GOBO\doc\geyacc".

--
Copyright (c) 1997-2000, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
