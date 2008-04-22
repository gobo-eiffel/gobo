This directory contains the source code of Gobo Eiffel Preprocessor
(gepp). Gepp is a simple filter which works pretty much like the
well known C-preprocessor, but it only supports a small subset of
the preprocessing instructions. Gepp has been developed using Gelex
and Geyacc, and as such can be used as an example on how to use
these two utilities.

To compile this program:

1. Use the script 'geant parser' to generate class GEPP_PARSER and
   'geant scanner' to generate class GEPP_SCANNER if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.

3. Run Gepp using:

       gepp [--version][--help][-hV?lM][--lines][-Dname ...][filename | -][filename | -]

A small "User's Manual" documentation in HTML format is available in
"$GOBO/doc/portability/gepp.html".

Gepp has been developed to solve some portability problems when trying
to make the classes from this package compilable with any Eiffel compiler.
See "$GOBO/doc/portability" for details on portability issues.

--
Copyright (c) 1997-2008, Eric Bezault and others
