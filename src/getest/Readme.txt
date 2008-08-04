This directory contains the source code of Gobo Eiffel Test (getest).
The code of getest is mainly based on the Gobo Eiffel Test Library.

To compile getest:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise' or 'ge'.

2. Run getest using:

       getest [-aceghvV?][--help][--version][--verbose]
            [-D <name>=<value>|--define=<name>=<value>]*
            [--class=<regexp>][--feature=<regexp>]
            [--compile=<command>][--ise|--ge|<filename>]

A "User's Manual" documentation for getest, in HTML format, is provided
in "$GOBO/doc/getest".

--
Copyright (c) 2000-2008, Eric Bezault and others
