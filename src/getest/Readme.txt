This directory contains the source code of Gobo Eiffel Test (getest).
The code of getest is mainly based on the Gobo Eiffel Test Library.

To compile getest:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace),
   ESD file (Visual Eiffel: ve.esd) or loadpath file (SmallEiffel:
   loadpath.se). If you have GNU make, you can alternatively type:
   'make ise', 'make hact', 'make ve' or 'make se'.
2. Run getest using:

       getest [-hV?][--help][--version][--se|--ise|--hact|--ve|<filename>]

A "User's Manual" documentation for getest, in HTML format, is provided
in "$GOBO/doc/getest".

--
Copyright (c) 2000-2001, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
