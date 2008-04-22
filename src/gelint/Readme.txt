WARNING: THIS TOOL IS STILL UNDER DEVELOPMENT!

This directory contains the source code of Gobo Eiffel Lint
(gelint). Gelint is a tool which is able to analyze Eiffel
source code and report validity errors and useful warnings
to help the Eiffel programmers write better code and be aware
of interoperability problems between various Eiffel compilers.
The code of gelint is mainly based on the Gobo Eiffel Tools
Library.

To compile this program:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.

2. Run gelint using:

       gelint <acefile>

A more detailed documentation for gelint will be provided in
future releases.

--
Copyright (c) 2000-2008, Eric Bezault and others
