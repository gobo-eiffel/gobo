This directory contains the source code of Gobo Eiffel Yacc (geyacc).
The code of Geyacc is mainly based on the Gobo Eiffel Parse Library.

To compile Geyacc:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise' or 'ge'.

2. Run Geyacc using:

       geyacc [--version][--help][-hxV?][--(new|old)_typing]
           [--pragma=[no]line][--doc=(html|xml)][-t classname]
           [-k filename][-v filename][-o filename] filename

A "User's Manual" documentation for Geyacc, in HTML format, is provided
in "$GOBO/doc/geyacc".

--
Copyright (c) 1997-2008, Eric Bezault and others
