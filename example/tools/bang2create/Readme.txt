This directory contains the source code for a small tool to convert
!! creation instructions in Eiffel classes to the new syntax with
the keyword 'create'.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.


2. Run the program using:

       bang2create <input_file> <output_file>

   where <input_file> is a file containing an Eiffel class text.
   Note that <output_file> can be the same file as <input_file>,
   however it is recommended to make a backup of the file to be
   converted in this case.

   There is also a geant build file 'bang2create.eant' to convert
   all Eiffel files (i.e. *.e) of a given directory and recursively
   of its subdirectories. To proceed, you should first make a backup
   of your directory, make sure that the executable for 'bang2create'
   is in your PATH, set the pathname of your root directory in the
   target "init" at the end of the file 'bang2create.eant', and then
   run:

       geant -b bang2create.eant recursive

--
Copyright (c) 2002-2008, Eric Bezault and others
