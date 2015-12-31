### Gobo Eiffel, version 3.9

One of the main concerns of Gobo Eiffel is to provide you with Eiffel libraries and tools that are portable across various Eiffel compilers available on the market. That way, you can still use your favorite Eiffel compiler while taking advantage of the goodies included in this package.

The software included in this package is copyrighted freeware distributed under the terms and conditions of the MIT License as specified in file License.txt. Gobo Eiffel is a multi-developer open-source project whose development is hosted at [Github] (http://github.com/gobo-eiffel/gobo) while the [official site
(for stable releases)] (http://www.gobosoft.com).

Note that this release is not a full-fledged version. In particular some of its documentation is out of date or missing. It was decided to build this package anyway because it contains a lot of new library classes and a couple of new tools which have already been in use for several months by other Eiffel projects. So now that the code of these tools and Eiffel libraries is stable, it was deemed useful to make it available in an official package rather that still requiring those third party Eiffel projects to tell their users to download the development version of Gobo
under Git. The next releases will be devoted to making the documentation more uptodate and providing more tests and examples.

## This package consists of fourteen Eiffel libraries:

+ Gobo Eiffel Argument Library
+ Gobo Eiffel Kernel Library
+ Gobo Eiffel Structure Library
+ Gobo Eiffel Lexical Library
+ Gobo Eiffel Parse Library
+ Gobo Eiffel Pattern Library
+ Gobo Eiffel Regexp Library
+ Gobo Eiffel Math Library
+ Gobo Eiffel String Library
+ Gobo Eiffel Test Library
+ Gobo Eiffel Time Library
+ Gobo Eiffel Tools Library
+ Gobo Eiffel Utility Library
+ Gobo Eiffel XML Library

## And nine utilities:

+ Gobo Eiffel Compiler (gec)
+ Gobo Eiffel Ant (geant)
+ Gobo Eiffel Xace (gexace)
+ Gobo Eiffel Lex (gelex)
+ Gobo Eiffel Yacc (geyacc)
+ Gobo Eiffel Test (getest)
+ Gobo Eiffel XSLT Processor (gexslt)
+ Gobo Eiffel Lint (gelint)
+ Gobo Eiffel Preprocessor (gepp)

Note that these utilities are not needed if you just want to use the library classes provided in this package (unless you got the classes from Git).

The software provided in this distribution should work on any platform where supported Eiffel compilers are available. However this software has only been tested under Windows XP and Linux. Since most Eiffel compilers use the notation $NAME for environment variables in their Ace files (or equivalent), this convention has been used instead of the Windowish %NAME%. Likewise, the directory separator used through out this distribution is /, following Unix/Linux convention instead of the Windows \ separator.

To install this package, please follow the instructions below:

## Under Windows:

+ download the package gobo39-src.7z or gobo39-src.zip
+ copy the files to a directory of your choice on your disk and set the environment variable %GOBO% to that directory, known as the distribution directory. Also put the directory %GOBO%\bin in your PATH.
+ execute the script: %GOBO%\install.bat <c_compiler>, where <c_compiler> is a C compiler installed on your computer (for example use "msc" for Microsoft C compiler).

## Under Unix/Linux:

+ download the package gobo39-src.tar.gz
+ copy the files to a directory of your choice on your disk and set the environment variable $GOBO to that directory, known as the distribution directory. Also put the directory $GOBO/bin in your PATH.
+ execute the script: $GOBO/install.sh <c_compiler>, where <c_compiler> is a C compiler installed on your computer (for example use "gcc" for GNU C compiler).

Note that if you downloaded this package from Git on on [GitHub] (http://github.com/gobo-eiffel/gobo).

you will need to bootstrap it. Please read [$GOBO/work/bootstrap/Readme.txt](/work/bootstrap/Readme.txt).

The supported Eiffel compilers, in alphabetical order, are: Gobo Eiffel Compiler (gec) 3.9, ISE Eiffel 6.3.7.5660 (Classic and .NET). For more details about the supported Eiffel compilers, please see the file "Release_notes.txt". This software might work with other Eiffel compilers and/or other compiler versions, however no test has been done. To have a better understanding of the way this software has been designed and implemented, you can also have a look at [$GOBO/doc/portability](/doc/portability).

## In this distribution:

    bin                         Executables (gelex, geyacc, etc.)
    doc                         Gobo Eiffel documentation
    doc/argument                Gobo Eiffel Argument Library documentation
    doc/geant                   geant documentation
    doc/gec                     gec documentation
    doc/gelex                   gelex documentation
    doc/gelint                  gelint documentation
    doc/getest                  getest documentation
    doc/gexace                  gexace documentation
    doc/gexslt                  gexslt documentation
    doc/geyacc                  geyacc documentation
    doc/guidelines              Gobo developer guidelines
    doc/math                    Gobo Eiffel Math Library documentation
    doc/portability             discussion about portability issues
    doc/string                  Gobo Eiffel String Library documentation
    doc/structure               Gobo Eiffel Structure Library documentation
    doc/time                    Gobo Eiffel Time Library documentation
    doc/tools                   Gobo Eiffel Tools Library documentation
    doc/xml                     Gobo Eiffel XML Library documentation
    example/argument            examples for Gobo Eiffel Argument Library
    example/geant               geant examples
    example/lexical             examples for Gobo Eiffel Lexical Library
    example/math                examples for Gobo Eiffel Math Library
    example/parse               examples for Gobo Eiffel Parse Library
    example/pattern             examples for Gobo Eiffel Pattern Library
    example/regexp              examples for Gobo Eiffel Regexp Library
    example/test                examples for Gobo Eiffel Test Library
    example/time                examples for Gobo Eiffel Time Library
    example/tools               examples for Gobo Eiffel Tools Library
    example/xml                 examples for Gobo Eiffel XML Library
    library/argument            Gobo Eiffel Argument Library classes
    library/free_elks           copy of the FreeELKS kernel library used by gec
    library/kernel              compiler-dependent kernel class adapters
    library/lexical             Gobo Eiffel Lexical Library classes
    library/math                Gobo Eiffel Math Library classes
    library/parse               Gobo Eiffel Parse Library classes
    library/pattern             Gobo Eiffel Pattern Library classes
    library/regexp              Gobo Eiffel Regexp Library classes
    library/string              Gobo Eiffel String Library classes
    library/structure           Gobo Eiffel Structure Library classes
    library/test                Gobo Eiffel Test Library classes
    library/time                Gobo Eiffel Time Library classes
    library/tools               Gobo Eiffel Tools Library classes
    library/utility             Gobo Eiffel Utility Library classes
    library/xml                 Gobo Eiffel XML Library classes
    misc                        miscellaneous files
    src/geant                   geant source code
    src/gec                     gec source code (still under development)
    src/gelex                   gelex source code
    src/gelint                  gelint source code (still under development)
    src/gepp                    gepp source code
    src/getest                  getest source code
    src/gexace                  gexace source code
    src/gexslt                  gexslt source code
    src/geyacc                  geyacc source code
    test/argument               test suite for Gobo Eiffel Argument Library
    test/common                 classes used by other tests
    test/example                test suite for the examples in $GOBO/example
    test/free_elks              test suite for FreeELKS kernel library
    test/kernel                 test suite for Gobo Eiffel Kernel Library
    test/lexical                test suite for Gobo Eiffel Lexical Library
    test/math                   test suite for Gobo Eiffel Math Library
    test/pattern                test suite for Gobo Eiffel Pattern Library
    test/precomp                precompilation test
    test/regexp                 test suite for Gobo Eiffel Regexp Library
    test/src                    test suite for the tools in $GOBO/src
    test/string                 test suite for Gobo Eiffel String Library
    test/structure              test suite for Gobo Eiffel Structure Library
    test/time                   test suite for Gobo Eiffel Time Library
    test/tools                  test suite for Gobo Eiffel Tools Library
    test/utility                test suite for Gobo Eiffel Utility Library
    test/xml                    test suite for Gobo Eiffel XML Library
    tool/gec                    configuration and runtime files for gec

Each of the above directories comes with a Readme file providing some basic information. Documentation is also available on the Web at http://www.gobosoft.com/. Check it out regularly for updates, bug fixes, workarounds and new releases. You can also subscribe to the Gobo Eiffel mailing list (http://groups.yahoo.com/group/gobo-eiffel/) and take part to the discussions or ask your questions there. Another mailing list (http://lists.sourceforge.net/lists/listinfo/gobo-eiffel-develop) for discussions about the features under development in the Git version is hosted at SourceForge.

Although the license allows you to do pretty much whatever you want with this software, we would be grateful to get your feedbacks, bug reports and/or bug fixes, improvements, etc. so that others could benefit from your work and ideas as well. We would also be interested in hearing about your projects and how easy (or difficult) it was to adapt this software for your specific needs. Thank you in advance.

## Authors 
Copyright (c) 1997-2008, Eric Bezault and others 20 November 2008
