This directory contains the source code of Gobo Eiffel Test (getest).
The code of getest is mainly based on the Gobo Eiffel Test Library.

To compile getest:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, SmartEiffel: se.ace) or
   Xace file (Visual Eiffel: ve.xace). Alternatively you can use 'geant'
   to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 've' or 'se'.

2. Run getest using:

       getest [-aceghvV?][--help][--version][--verbose]
            [-D <name>=<value>|--define=<name>=<value>]*
            [--class=<regexp>][--feature=<regexp>]
            [--compile=<command>][--se|--ise|--ve|<filename>]

A "User's Manual" documentation for getest, in HTML format, is provided
in "$GOBO/doc/getest".

--
Copyright (c) 2000-2005, Eric Bezault and others
