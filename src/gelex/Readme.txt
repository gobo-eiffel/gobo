This directory contains the source code of Gobo Eiffel Lex (gelex).
The code of Gelex is mainly based on the Gobo Eiffel Lexical Library.

To compile Gelex:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace,
   SmallEiffel: se.ace) or ESD file (Visual Eiffel: ve.esd). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'hact', 've' or 'se'.

2. Run Gelex using:

       gelex [--version][--help][-bcefhimsVwxz?][-a size][-o filename] filename

A "User's Manual" documentation for Gelex, in HTML format, is provided
in "$GOBO/doc/gelex".

--
Copyright (c) 1997-2001, Eric Bezault and others
