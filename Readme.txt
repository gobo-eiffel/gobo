Gobo Eiffel, version 1.4

One of the main concerns of Gobo Eiffel is to provide you with Eiffel
libraries and tools that are portable across various Eiffel compilers
available on the market. That way, you can still use your favorite
Eiffel compiler while taking advantage of the goodies included in
this package.

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the Eiffel Forum Freeware License as 
specified in file License.txt.

This package consists of five Eiffel libraries:

    . Gobo Eiffel Kernel Library
    . Gobo Eiffel Structure Library
    . Gobo Eiffel Lexical Library
    . Gobo Eiffel Parse Library
    . Gobo Eiffel Utility Library

and three utilities:

    . Gobo Eiffel Lex, version 1.4 (gelex)
    . Gobo Eiffel Yacc, version 1.4 (geyacc)
    . Gobo Eiffel Preprocessor, version 1.4 (gepp)

The originality of this software compared to other already existing lex
and yacc programs for Eiffel, apart from its portability on many Eiffel
compilers, is that gelex and geyacc are entirely written in Eiffel using
the lexical and parse libraries, making it possible to include gelex and
geyacc functionalities in your own programs. On the other hand, care has
been taken to make sure that the skeleton classes of gelex and geyacc
were not dependent on classes other than those from the Eiffel kernel.
In particular the output of gelex and geyacc can be included into your
application without the overhead of the library classes provided in the
Gobo Eiffel package (see "$GOBO\doc\gelex\stages.html" and
"$GOBO\doc\geyacc\stages.html" for details).

The software provided in this distribution should work on any platform
where supported Eiffel compilers are available. However this software
has only been tested under Windows NT. As a consequence, the directory
separator used through out this distribution is \, following Windows
convention. However, since most Eiffel compilers use the notation
$NAME for environment variables in their Ace files (or equivalent),
this convention has been used instead of the Windowish %NAME%.

To install this package, copy the files to a directory of your choice
on your disk and set the environment variable GOBO to that directory,
known as the distribution directory. Also put the directory $GOBO\bin
in your PATH.

The supported Eiffel compilers, in alphabetical order, are:
Halstenbach 3.0Beta 3, ISE Eiffel 4.3-020, SmallEiffel -0.78beta#2,
Visual Eiffel 2.5. For more details about the supported Eiffel compilers,
please see the file "Release_notes.txt". This software might work with
other Eiffel compilers and/or other compiler versions, however no test
has been made. To have a better understanding of the way this software
has been designed and implemented, you can also have a look at
"$GOBO\doc\portability".

In this distribution:

    bin                         Windows 95/NT executables (gelex, geyacc, etc.)
    doc                         Gobo Eiffel documentation in HTML format
    doc\gelex                   gelex documentation in HTML format
    doc\geyacc                  geyacc documentation in HTML format
    doc\portability             discussion about portability issues, in HTML
    doc\structure               GE Structure Library documentation, in HTML
    example\lexical\ascii2ps    pretty-printer
    example\lexical\calculator  simple calculator (interface with iss-yacc)
    example\lexical\eiffel      scanner for the Eiffel language
    example\lexical\gegrep      grep-like program
    example\parse\calc          infix notation calculator (see geyacc doc)
    example\parse\eiffel        simple parser for Eiffel
    example\parse\mcalc         calculator with memory (see geyacc doc)
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

Each of the above directories comes with a Readme file providing
some basic information. Documentation is also available on the Web
at "http://www.gobo.demon.co.uk". Check it out regularly for updates,
bug fixes, workarounds and new releases.

Although the license allows you to do pretty much whatever you want with
this software, I would be grateful to get your feedbacks, bug reports
and/or bug fixes, improvements, etc. so that others could benefit from
your work and ideas as well. I would also be interested in hearing about
your projects and how easy (or difficult) it was to adapt this software
for your specific needs. Thank you in advance.

--
Copyright (c) 1999, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
14 April 1999
