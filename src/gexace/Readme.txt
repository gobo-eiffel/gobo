This directory contains the source code of Gobo Eiffel Xace (gexace).

To compile Gexace:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' itself to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise' or 'ge'.

2. Run Gexace using:

       gexace [defines] [options] command [xace-file]

   where:

       defines:  --define="VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*"
       options:  --verbose|--shallow
       command:  --system=(ge|se|ise) [--format=(ace|ecf|xace|loadpath)][--output=<filename>]
       command:  --library=(ge|se|ise) [--format=(ace|ecf|xace|loadpath)][--output=<filename>]
       command:  --validate

A more detailed documentation for 'gexace' will be provided in
future releases.

--
Copyright (c) 2001-2008, Eric Bezault and others
