Gobo Eiffel, version 1.2

One of the main concerns of Gobo Eiffel is to provide you with Eiffel
libraries and tools that are portable across various Eiffel compilers
available on the market. That way, you can still use your favorite
Eiffel compiler while taking advantage of the goodies included in
this package.

The software included in this package is distributed under the terms
and conditions listed in file "License.txt". This basically says 
"do whatever you please with this software except removing the
copyright notice from the source code". Note that this license is
more flexible than GNU licenses since this software may be used
in non-free programs. (Geyacc, based on GNU Bison, is distributed
under GNU GPL though.)

This package consists of five Eiffel libraries:

    . Gobo Eiffel Kernel Library
    . Gobo Eiffel Structure Library
    . Gobo Eiffel Lexical Library
    . Gobo Eiffel Parse Library
    . Gobo Eiffel Utility Library

and three utilities:

    . Gobo Eiffel Lex, version 1.2 (gelex)
    . Gobo Eiffel Yacc, version 1.0a (geyacc)
    . Gobo Eiffel Preprocessor (gepp)

The originality of this software compared to other already existing lex and
yacc programs for Eiffel, apart from its portability on many Eiffel compilers,
is that gelex is entirely written in Eiffel using the lexical library, making
it possible to include gelex functionalities in your programs.

The software provided in this distribution should work on any platform
where supported Eiffel compilers are available. However this software
has only been tested under Windows 95. As a consequence, the directory
separator used through out this distribution is \, following Windows
convention. However, since most Eiffel compilers use the notation
$NAME for environment variables in their Ace files (or equivalent),
this convention has been used instead of the Windowish %NAME%.

To install this package, copy the files to a directory of your choice
on your disk and set the environment variable GOBO to that directory,
known as the distribution directory. Also put the directory $GOBO\bin
in your PATH.

The supported Eiffel compilers, in alphabetical order, are:
Halstenbach 1.6, ISE Eiffel 4.1, SmallEiffel -0.83, Visual Eiffel 2.1.
An effort has been made to port this package to TowerEiffel 2.0, however
this compiler is not fully supported yet because of problems with manifest
arrays (which are extensively used in gelex and geyacc). For more details
about the supported Eiffel compilers, please see the file
"Release_notes.txt". This software might work with other Eiffel compilers
and/or other compiler versions, however no test has been made.
To have a better understanding of the way this software has been designed
and implemented, you can also have a look at "$GOBO\doc\portability".

In this distribution:

    bin                         Windows 95/NT executables (gelex, geyacc, etc.)
    doc\gelex                   gelex documentation in HTML format
    doc\geyacc                  geyacc documentation in HTML format
    doc\portability             discussion about portability issues, in HTML
    example\lexical\ascii2ps    pretty-printer
    example\lexical\calculator  simple calculator (interface with iss-yacc)
    example\lexical\eiffel      scanner for the Eiffel language
    example\lexical\gegrep      grep-like program
    example\parse\calc          infix notation calculator (see geyacc doc)
    example\parse\eiffel        simple parser for Eiffel
    example\parse\rpcalc        reverse polish notation calc (see geyacc doc)
    library\kernel              compiler-dependent kernel class adapters
    library\lexical             Gobo Eiffel Lexical Library classes
    library\parse               Gobo Eiffel Parse Library classes
    library\structure           Gobo Eiffel Structure Library classes
    library\utility             Gobo Eiffel Utility Library classes
    misc                        miscellaneous files
    src\gelex                   gelex source code
    src\gepp                    gepp source code
    src\geyacc                  geyacc source code

Each of the above directories is equipped with a Readme file providing
some basic information. Documentation is also available on the Web
at "http://www.gobo.demon.co.uk". Check it out regularly for updates,
bug fixes, workarounds and new releases.

Although the license allows you to do pretty much whatever you want with
this software, I would be grateful to get your feedbacks, bug reports
and/or bug fixes, improvements, etc. so that others could benefit from
your work and ideas as well. I would also be interested to hear about
your projects and how easy (or difficult) it was to adapt this software
for your specific needs. Thank you in advance.

+------------------------------------------------------------------------------+
|  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED        |
|  WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF        |
|  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.                       |
+------------------------------------------------------------------------------+

--
Copyright (c) 1997, Eric Bezault
email: ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
29 October 1997
