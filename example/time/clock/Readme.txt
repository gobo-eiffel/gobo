This directory contains the source code for a simple 
command-line system clock which displays the current
time as a DT_TIME, DT_DATE and DT_DATE_TIME.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, SmallEiffel: se.ace) or
   ESD file (Visual Eiffel: ve.esd). Alternatively you can use 'geant'
   to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise', 've' or 'se'.


2. Run the program using:

       clock

   It should display something like that on your console window:

       Time Now: 14:36:54
       Date Now: 2001/04/10
       DateTime Now: 2001/04/10 14:36:54
       UTC Time Now: 12:36:54
       UTC Date Now: 2001/04/10
       UTC DateTime Now: 2001/04/10 12:36:54

--
Copyright (c) 2001, Eric Bezault and others
