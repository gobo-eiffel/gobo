This directory contains the source code of Gobo Eiffel Xace (gexace).

To compile Gexace:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, SmallEiffel: se.ace) or
   ESD file (Visual Eiffel: ve.esd). Alternatively you can use 'geant'
   itself to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 've' or 'se'.

2. Run Gexace using:

       gexace [variable-definitions] [options] command [xace-file]

   where:

       variable-definitions:  --define="VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*"
       options:  --verbose
       command:  --build (--se|--ise|--ve|--xml)
       command:  --validate

A more detailed documentation for 'gexace' will be provided in
future releases.

--
Copyright (c) 2001, Eric Bezault and others
