This directory contains the source code of Gobo Eiffel Preprocessor
(gepp). Gepp is a simple filter which works pretty much like the
well known C-preprocessor, but it only supports a small subset of
the preprocessing instructions. Gepp has been developed using Gelex
and Geyacc, and as such can be used as an example on how to use
these two utilities.

To compile this program:

1. Use the script 'make_parser.bat' to generate class GEPP_PARSER and
   'make_scanner.bat' to generate class GEPP_SCANNER if necessary.
1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace) or
   ESD file (Visual Eiffel: ve.esd). With SmallEiffel, you can just execute
   the script se.bat or se.sh (after possible modifications).
2. Run Gepp using:

       gepp [-Dname ...] [filename | -] [filename | -]

A small "User's Manual" documentation in HTML format is available in
"$GOBO\doc\portability\gepp.html".

Gepp has been developed to solve some portability problems when trying
to make the classes from this package compilable with any Eiffel compiler.
See "$GOBO\doc\portability" for details on portability issues.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
