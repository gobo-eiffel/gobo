This directory contains the source code of Gobo Eiffel Ant (geant).
Geant is a build tool for Eiffel, modeled after the Jakarta Ant build
tool for Java.

To compile Geant:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, SmartEiffel: se.ace) or
   ESD file (Visual Eiffel: ve.esd). Alternatively you can use 'geant'
   itself to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 've' or 'se'.

2. Run Geant using:

       geant [-hV?][-b buildfilename] [target]

A more detailed documentation for 'geant' will be provided in
future releases.

--
Copyright (c) 2001, Eric Bezault and others
