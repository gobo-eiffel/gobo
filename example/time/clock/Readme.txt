This directory contains the source code for a simple 
command-line system clock which displays the current
time as a DT_TIME, DT_DATE and DT_DATE_TIME.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace),
   ESD file (Visual Eiffel: ve.esd) or loadpath file (SmallEiffel:
   loadpath.se). If you have GNU make, you can alternatively type:
   'make ise', 'make hact', 'make ve' or 'make se'.
2. Run the program using:

       clock

   It should display something like that on your console window:

       Time Now: 14:36:54
       Date Now: 2001/04/10
       DateTime Now: 2001/04/10 14:36:54

--
Copyright (c) 2001, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
