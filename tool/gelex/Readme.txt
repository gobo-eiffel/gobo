This directory contains the source code of Gobo Eiffel Lex (gelex).
The code of Gelex is mainly based on the Gobo Eiffel Lexical Library.

To compile Gelex:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise' or 'ge'.

2. Run Gelex using:

       gelex [--version][--help][-bcefhimsVwxz?][-a size]
           [--pragma=[no]line][-o filename][--] filename

A "User's Manual" documentation for Gelex, in HTML format, is provided
in "./doc".

--
Copyright (c) 1997-2016, Eric Bezault and others
