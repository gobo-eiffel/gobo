This directory contains the source code of Gobo Eiffel Lex (gelex).
The code of Gelex is mainly based on the Gobo Eiffel Lexical Library.

To compile Gelex:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise*.ace, Halstenbach: hact*.ace) or
   ESD file (Visual Eiffel: ve*.esd). With SmallEiffel, you can just execute
   the script se*.bat (after possible modifications).
2. Run Gelex using:

       gelex [--version][--help][-bcefhimsVw?][-a size][-o filename] filename

A "User's Manual" documentation for Gelex, in HTML format, is provided
in "$GOBO\doc\gelex".

--
Eric Bezault <ericb@gobo.demon.co.uk>
