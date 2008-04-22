This directory contains the source code of Gobo Eiffel Ant (geant).
Geant is a build tool for Eiffel, modeled after the Jakarta Ant build
tool for Java.

To compile Geant:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' itself to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.

2. Run Geant using:

       geant [-hV?][-b buildfilename] [target]

A more detailed documentation for 'geant' will be provided in
future releases.

--
Copyright (c) 2001-2008, Eric Bezault and others
