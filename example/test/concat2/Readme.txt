This directory contains the source code for the string
concatenator used as an example in getest documentation.
Please refer to $GOBO/doc/getest/examples.html for details.

To run this test example:

    getest getest.<compiler>

where <compiler> is either 'ise', 'hact', 've' or 'se' depending
on the Eiffel compiler used to compile the test suite. Alternatively
you can use the following shorthand:

     getest --<compiler>

which is equivalent to the command-line above.

Note that the files 'getest.<compiler>' use Makefiles to compile
the generated test suite. If you are under Windows and don't have
GNU make nor bash installed on your PC, you can try to use the
following command-line instead:

    getest getest-win.<compiler>

It has been tested under Windows NT and I hope that it will work
with other flavors of Windows as well.

--
Copyright (c) 2001, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
