This directory contains the source code for the string
concatenator used as an example in getest documentation.
Please refer to $GOBO/doc/getest/examples.html for details.

To run this test example:

    getest getest.<compiler>

where <compiler> is either 'ge', 'ise' or 'se' depending
on the Eiffel compiler used to compile the test suite.
Alternatively you can use the following shorthand:

     getest --<compiler>

which is equivalent to the command-line above.

The expected output is as follows:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Preparing Test Cases
Compiling Test Cases
Running Test Cases

Test Summary for xconcat2

# PASSED:     1 test
# Failed:     0 test
# Aborted:    0 test
# Total:      1 test (2 assertions)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

'getest' can also be invoked from 'geant' using the
following command-line:

     geant test_<compiler>

or:

     geant test_debug_<compiler>

if you want to run the test with all assertions on.

Note: If your underlying shell does not support the following
file redirections: > and 2>&1, you will have to remove them
from the 'compile' field in the files 'getest.<compiler>' or
if you use 'geant' just add the following line in the target
'init_system' in the file 'build.eant':

   <set name="compilation_log" value=""/>

As far as I know the redirections > and 2>&1 should work at least
under Windows NT 4.0 and XP, and Unix/Linux Bourne shell and bash. 

--
Copyright (c) 2001-2008, Eric Bezault and others
