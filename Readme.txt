Gobo Eiffel, version 3.0

One of the main concerns of Gobo Eiffel is to provide you with Eiffel
libraries and tools that are portable across various Eiffel compilers
available on the market. That way, you can still use your favorite
Eiffel compiler while taking advantage of the goodies included in
this package.

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the Eiffel Forum License as specified
in file License.txt. Starting with this release, Gobo Eiffel is now a multi-
developer open source project whose development is hosted at SourceForge
(https://sourceforge.net/projects/gobo-eiffel/) while the official stite
(for stable releases) is still located at http://www.gobosoft.com/.

Note that this release is not a full-fledged version. In particular its
documentation is out of date or missing. It was decided to build this
package anyway because it contains a lot of new library classes and a
couple of new tools which have already been in used for several months
by other Eiffel projects. So now that the code of these tools and Eiffel
libraries is stable, it was deemed useful to make it available in an
official package rather that still requiring those third party Eiffel
projects to tell their users to download the development version of Gobo
under CVS. The next release will be devoted to making the documentation
more uptodate and providing more tests and examples.

This package consists of ten Eiffel libraries:

    . Gobo Eiffel Kernel Library
    . Gobo Eiffel Structure Library
    . Gobo Eiffel Lexical Library
    . Gobo Eiffel Parse Library
    . Gobo Eiffel Pattern Library
    . Gobo Eiffel Regexp Library
    . Gobo Eiffel Test Library
    . Gobo Eiffel Time Library
    . Gobo Eiffel Utility Library
    . Gobo Eiffel XML Library

and seven utilities:

    . Gobo Eiffel Ant, version 3.0 (geant)
    . Gobo Eiffel Xace, version 3.0 (gexace)
    . Gobo Eiffel Lex, version 3.0 (gelex)
    . Gobo Eiffel Yacc, version 3.0 (geyacc)
    . Gobo Eiffel Test, version 3.0 (getest)
    . Gobo Eiffel Preprocessor, version 3.0 (gepp)
    . Gobo Eiffel XML Splitter, version 3.0 (gexmlsplit)

The software provided in this distribution should work on any platform
where supported Eiffel compilers are available. However this software
has only been tested under Windows NT, Linux RedHat 7.1 and Solaris 2.8.
Since most Eiffel compilers use the notation $NAME for environment variables
in their Ace files (or equivalent), this convention has been used instead
of the Windowish %NAME%. Likewise, the directory separator used through
out this distribution is /, following Unix/Linux convention instead of
the Windows \ separator.

To install this package, please follow the instructions below:

Under Windows:

    . download the package gobo30.zip
    . copy the files to a directory of your choice on your disk and
      set the environment variable %GOBO% to that directory, known as
      the distribution directory. Also put the directory %GOBO%\bin
      in your PATH.

Under Linux:

    . download the package gobo30.tar.gz
    . copy the files to a directory of your choice on your disk and
      set the environment variable $GOBO to that directory, known as
      the distribution directory. Also put the directory $GOBO/bin
      in your PATH.

For other platforms:

    . download the package gobo30.tar.gz
    . copy the files to a directory of your choice on your disk and
      set the environment variable $GOBO to that directory, known as
      the distribution directory. Also put the directory $GOBO/bin
      in your PATH.
    . go to each directories under $GOBO/src and use your favorite
      Eiffel compiler and the Ace or ESD files provided to compile
      the corresponding tools, and copy the generated executables
      to $GOBO/bin.

Note that if you downloaded this package from CVS on SourceForge, you
will need to bootstrap it. Please read $GOBO/work/bootstrap/Readme.txt.

The supported Eiffel compilers, in alphabetical order, are: Halstenbach
4.0.1, ISE Eiffel 5.2 and 5.1.014, SmallEiffel -0.74,
Visual Eiffel 4.0 (Build 4001). For more details about the supported Eiffel
compilers, please see the file "Release_notes.txt". This software might
work with other Eiffel compilers and/or other compiler versions, however
no test has been done. To have a better understanding of the way this
software has been designed and implemented, you can also have a look at
"$GOBO/doc/portability".

In this distribution:

    bin                         WinNT or Linux executables (gelex, geyacc, etc.)
    doc                         Gobo Eiffel documentation in HTML format
    doc/geant                   geant documentation
    doc/gelex                   gelex documentation in HTML format
    doc/getest                  getest documentation in HTML format
    doc/gexace                  gexace documentation
    doc/geyacc                  geyacc documentation in HTML format
    doc/guidelines              Gobo developer guidelines
    doc/portability             discussion about portability issues, in HTML
    doc/structure               Gobo Eiffel Structure Library documentation, in HTML
    doc/time                    Gobo Eiffel Time Library documentation, in HTML
    doc/xml                     Gobo Eiffel XML Library documentation
    example/geant               geant examples
    example/gexmlsplit          gexmlsplit examples
    example/lexical/ascii2ps    pretty-printer
    example/lexical/calculator  simple calculator (interface with iss-yacc)
    example/lexical/eiffel      scanner for the Eiffel language
    example/lexical/gegrep      grep-like program
    example/parse/calc          infix notation calculator (see geyacc doc)
    example/parse/eiffel        simple parser for Eiffel
    example/parse/mcalc         calculator with memory (see geyacc doc)
    example/parse/rpcalc        reverse polish notation calc (see geyacc doc)
    example/regexp/pcre         simple example using PCRE regular expressions
    example/test/concat1        string concatenator getest example (see getest doc)
    example/test/concat2        string concatenator getest example (see getest doc)
    example/time/clock          system clock
    example/xml                 XML examples
    library/kernel              compiler-dependent kernel class adapters
    library/lexical             Gobo Eiffel Lexical Library classes
    library/other               emulation of third-party Eiffel libraries
    library/parse               Gobo Eiffel Parse Library classes
    library/pattern             Gobo Eiffel Pattern Library classes
    library/regexp              Gobo Eiffel Regexp Library classes
    library/structure           Gobo Eiffel Structure Library classes
    library/test                Gobo Eiffel Test Library classes
    library/time                Gobo Eiffel Time Library classes
    library/tools               Gobo Eiffel Tools Library classes
    library/utility             Gobo Eiffel Utility Library classes
    library/xml                 Gobo Eiffel XML Library classes
    misc                        miscellaneous files
    src/geant                   geant source code
    src/gelex                   gelex source code
    src/gelint                  gelint source code (still under development)
    src/gepp                    gepp source code
    src/getest                  getest source code
    src/gexace                  gexace source code
    src/gexmlsplit              gexmlsplit source code
    src/geyacc                  geyacc source code
    test/common                 classes used by other tests
    test/example                test suite for the examples in $GOBO/example
    test/kernel                 test suite for Gobo Eiffel Kernel Library
    test/lexical                test suite for Gobo Eiffel Lexical Library
    test/precomp                precompilation test
    test/regexp                 test suite for Gobo Eiffel Regexp Library
    test/src                    test suite for the tools in $GOBO/src
    test/structure              test suite for Gobo Eiffel Structure Library
    test/time                   test suite for Gobo Eiffel Time Library
    test/xml                    test suite for Gobo Eiffel XML Library

Each of the above directories comes with a Readme file providing
some basic information. Documentation is also available on the Web
at http://www.gobosoft.com/. Check it out regularly for updates, bug
fixes, workarounds and new releases. You can also subscribe to the
Gobo Eiffel mailing list (http://groups.yahoo.com/group/gobo-eiffel/)
and take part to the discussions or ask your questions there. Another
mailing list (http://lists.sourceforge.net/lists/listinfo/gobo-eiffel-develop)
for discussions about the features under development in the CVS version
is hosted at SourceForge.

Although the license allows you to do pretty much whatever you want with
this software, I would be grateful to get your feedbacks, bug reports
and/or bug fixes, improvements, etc. so that others could benefit from
your work and ideas as well. I would also be interested in hearing about
your projects and how easy (or difficult) it was to adapt this software
for your specific needs. Thank you in advance.

--
Copyright (c) 1997-2002, Eric Bezault and others
18 August 2002
