This directory contains the source code of Gobo Eiffel Lex (gelex).
The code of Gelex is mainly based on the Gobo Eiffel Lexical Library.

To compile Gelex:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace),
   ESD file (Visual Eiffel: ve.esd) or loadpath file (SmallEiffel:
   loadpath.se). If you have GNU make, you can alternatively type:
   'make ise', 'make hact', 'make ve' or 'make se'.
2. Run Gelex using:

       gelex [--version][--help][-bcefhimsVwxz?][-a size][-o filename] filename

A "User's Manual" documentation for Gelex, in HTML format, is provided
in "$GOBO/doc/gelex".

--
Copyright (c) 1997-2000, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
