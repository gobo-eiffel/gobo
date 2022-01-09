[![GitHub Actions](https://github.com/gobo-eiffel/gobo/actions/workflows/github-ci.yml/badge.svg)](https://github.com/gobo-eiffel/gobo/actions/workflows/github-ci.yml)
[![GitLab CI/CD](https://gitlab.com/ebezault/gobo/badges/master/pipeline.svg?key_text=GitLab+CI/CD&key_width=85)](https://gitlab.com/ebezault/gobo/-/pipelines)
[![Azure Pipelines](https://dev.azure.com/ericb0733/gobo/_apis/build/status/gobo?branchName=master)](https://dev.azure.com/ericb0733/gobo/_build?definitionId=1&branchName=master)

# Gobo Eiffel Project

One of the main concerns of the *Gobo Eiffel Project* is to provide
the Eiffel community with Eiffel tools and libraries that are free 
and portable across various Eiffel compilers available on the market.
That way, you can still use your favorite Eiffel compiler while taking
advantage of the goodies included in *Gobo Eiffel*.

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the MIT License as specified in file 
[License.txt](License.txt).
*Gobo Eiffel* is a multi-developer open-source project whose development
is hosted at
[Github](http://github.com/gobo-eiffel/gobo)
while the official site (for stable releases) is located at
[gobosoft.com](http://www.gobosoft.com).

*Gobo Eiffel* already consists of seventeen Eiffel libraries:

* Gobo Eiffel Argument Library
* Gobo Eiffel Kernel Library
* Gobo Eiffel Lexical Library
* Gobo Eiffel Math Library
* Gobo Eiffel Parse Library
* Gobo Eiffel Pattern Library
* Gobo Eiffel Regexp Library
* Gobo Eiffel String Library
* Gobo Eiffel Structure Library
* Gobo Eiffel Test Library
* Gobo Eiffel Thread Library
* Gobo Eiffel Time Library
* Gobo Eiffel Tools Library
* Gobo Eiffel Utility Library
* Gobo Eiffel XML Library
* Gobo Eiffel XPath Library
* Gobo Eiffel XSLT Library

and twelve utilities:

* Gobo Eiffel Ant (geant)
* Gobo Eiffel Compiler (gec)
* Gobo Eiffel C Compilation (gecc)
* Gobo Eiffel Cop (gecop)
* Gobo Eiffel Doc (gedoc)
* Gobo Eiffel Image (geimage)
* Gobo Eiffel Lex (gelex)
* Gobo Eiffel Lint (gelint)
* Gobo Eiffel Preprocessor (gepp)
* Gobo Eiffel Test (getest)
* Gobo Eiffel XSLT Processor (gexslt)
* Gobo Eiffel Yacc (geyacc)

Note that these utilities are not needed if you just want to use the
library classes provided in this package.

## Eiffel compilers

The supported Eiffel compilers, in alphabetical order, are:

* Gobo Eiffel Compiler (gec) 21.01.09.4
* ISE Eiffel 21.11.10.6046 (Classic and .NET)

For more details about the supported Eiffel compilers, please see the file
[Release_notes.md](./Release_notes.md). 
This software might work with other Eiffel compilers and/or other compiler
versions, however no test has been made yet.
To have a better understanding of the way this software has been designed
and implemented, you can also have a look at
[portability issues](http://www.gobosoft.com/eiffel/gobo/portability/index.html).

## Platforms

The software provided in this distribution should work on any platform
where supported Eiffel compilers are available. However this software
has only been tested under Windows 10 and Linux. 
Since most Eiffel compilers use the notation `$NAME` for environment
variables in their ECF files (or equivalent), this convention has been
used instead of the Windowish `%NAME%`. Likewise, the directory separator
used throughout this distribution is `/`, following Unix/Linux convention
instead of the Windows `\` separator.

To install this package, please follow the instructions below:

### Under Windows

* [Download](http://www.gobosoft.com/eiffel/gobo/download.html)
  the package `gobo*-src.7z`, or check-out the files from the
  [Git repository](https://github.com/gobo-eiffel/gobo).
* Copy the files to a directory of your choice on your disk 
  and set the environment variable `%GOBO%` to that directory,
  known as the distribution directory. Also put the directory
  `%GOBO%\bin` in your `PATH`.
* To build the tools (e.g. gec, geyacc, ...), execute the script:

		%GOBO%\bin\install.bat <c_compiler>

	where `<c_compiler>` is a C compiler installed on your 
	computer (for example use `msc` for Microsoft C compiler).

### Under Unix/Linux

* [Download](http://www.gobosoft.com/eiffel/gobo/download.html)
  the package `gobo*-src.tar.gz`, or check-out the files from the
  [Git repository](https://github.com/gobo-eiffel/gobo).
* Copy the files to a directory of your choice on your disk and 
  set the environment variable `$GOBO` to that directory, known
  as the distribution directory. Also put the directory 
  `$GOBO/bin` in your `PATH`.
* To build the tools (e.g. gec, geyacc, ...), execute the script:

		$GOBO/bin/install.sh <c_compiler>

	where `<c_compiler>` is a C compiler installed on your
	computer (for example use `gcc` for GNU C compiler).

## Feedback

A list of the known defects along with eventual bug fixes or
workarounds is available in the 
[issue tracker](https://github.com/gobo-eiffel/gobo/issues)
on GitHub (an older
[bug tracker](https://sourceforge.net/tracker/?atid=381937&amp;group_id=24591&amp;func=browse)
is available on SourceForge). If you find a bug which does not
appear in this list yet, please
[report it](https://github.com/gobo-eiffel/gobo/issues).
We will try to provide a bug fix as soon as possible
(usually within one or two days).

There is a
[mailing list](http://lists.sourceforge.net/lists/listinfo/gobo-eiffel-develop)
(hosted at SourceForge) for discussions about the features under
development in the
[Git repository](https://github.com/gobo-eiffel/gobo)
on GitHub. You can subscribe and take part to the discussions or ask your questions there.

Although the license allows you to do pretty much whatever you want 
with this software, we would be grateful to get your feedback, 
bug reports and/or bug fixes, improvements, etc. so that others 
could benefit from your work and ideas as well. 
We would also be interested in hearing about your projects and
how easy (or difficult) it was to adapt this software for your
specific needs. Thank you in advance.

You are also welcome to take part in the development of the
*Gobo Eiffel Project*. Some
[developer guidelines](http://www.gobosoft.com/eiffel/gobo/guidelines/index.html)
are available to help you make the first steps.

## Authors

Copyright (c) 1997-2022, Eric Bezault and others
