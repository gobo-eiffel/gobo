This directory contains the source code for the 'telco' benchmark
as specified at http://www2.hursley.ibm.com/decimal/telcoSpec.html.
This small program which is intended to capture the essence of a
telephone company billing application is using classes MA_DECIMAL
and MA_DECIMAL_CONTEXT. More information on this benchmark can be
found at http://www2.hursley.ibm.com/decimal/telco.html. This
implementation uses input files with BCD encoded decimals.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace, Xace or ECF file (e.g. <compiler>.ecf). Alternatively
   you can use 'geant' to launch the compilation:
   
       geant compile_<compiler>
       
   where <compiler> is either 'ise' or 'ge'.


2. Run the program using:

       telco

   It should display something like that on your console window:

       -- telco application
       --
       -- Benchmark for Decimal Arithmetic
       --
       -- Eiffel implementation - Gobo Eiffel Decimal Arithmetic Library
       --
       10 Numbers processed, with 3 long distance calls

       Duration: 0:0:0.10  - hour:minute:second.millisecond

           sum_t = 8.91
           sum_b = 0.50
           sum_d = 0.22

   and it should create the file 'telco.outc' with the following
   content:

       0.42
       0.10
       0.09
       3.17
       0.11
       3.23
       0.02
       0.99
       0.72
       0.06

--
Copyright (c) 2005-2008, Paul G. Crismer and others
Specifications are Copyright (c) 2002, IBM Corporation
