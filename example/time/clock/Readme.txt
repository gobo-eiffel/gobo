This directory contains the source code for a simple 
command-line system clock which displays the current
time as a DT_TIME, DT_DATE and DT_DATE_TIME.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 'ge' or 'se'.


2. Run the program using:

       clock

   It should display something like that on your console window:

       Time Now: 11:55:48.343
       Date Now: 2004/10/16
       DateTime Now: 2004/10/16 11:55:48.343
       UTC Time Now: 09:55:48.343
       UTC Date Now: 2004/10/16
       UTC DateTime Now: 2004/10/16 09:55:48.343

--
Copyright (c) 2001-2008, Eric Bezault and others
