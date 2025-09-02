[![GitHub Actions](https://github.com/gobo-eiffel/gobo/actions/workflows/github-ci.yml/badge.svg)](https://github.com/gobo-eiffel/gobo/actions/workflows/github-ci.yml)
[![GitLab CI/CD](https://gitlab.com/ebezault/gobo/badges/master/pipeline.svg?key_text=GitLab+CI/CD&key_width=85)](https://gitlab.com/ebezault/gobo/-/pipelines)
[![Azure Pipelines](https://dev.azure.com/ericb0733/gobo/_apis/build/status/gobo?branchName=master)](https://dev.azure.com/ericb0733/gobo/_build?definitionId=1&branchName=master)

# Gobo Eiffel Project

One of the main concerns of the *Gobo Eiffel Project* is to provide
the Eiffel community with Eiffel tools and libraries that are
[free](License.md) and [portable](./library/common/doc/portability/index.html)
across various Eiffel compilers available on the market.
That way, you can still use your favorite Eiffel compiler while taking
advantage of the goodies included in *Gobo Eiffel*.

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the MIT License as specified in
[License](License.md) file.
*Gobo Eiffel* is a multi-developer open-source project whose development
is hosted at
[Github](http://github.com/gobo-eiffel/gobo)
while the official site (for stable releases) is located at
[gobosoft.com](https://www.gobosoft.com). This package also contains files
from the [Boehm GC](https://github.com/ivmai/bdwgc) project which is also
released under a MIT-style [license](https://github.com/bdwgc/bdwgc/blob/master/LICENSE), and is bundled with the [Zig toolchain](https://ziglang.org/) which is also released under a MIT-style [license](https://github.com/ziglang/zig/blob/master/LICENSE).

*Gobo Eiffel* already consists of eighteen Eiffel libraries:

* [Gobo Eiffel Argument Library](./library/argument/doc/index.html)
* Gobo Eiffel Kernel Library
* Gobo Eiffel Lexical Library
* [Gobo Eiffel Math Library](./library/math/doc/index.html)
* Gobo Eiffel Parse Library
* Gobo Eiffel Pattern Library
* Gobo Eiffel Regexp Library
* Gobo Eiffel Storable Library
* [Gobo Eiffel String Library](./library/string/doc/index.html)
* [Gobo Eiffel Structure Library](./library/structure/doc/index.html)
* Gobo Eiffel Test Library
* Gobo Eiffel Thread Library
* [Gobo Eiffel Time Library](./library/time/doc/index.html)
* [Gobo Eiffel Tools Library](./library/tools/doc/index.html)
* Gobo Eiffel Utility Library
* [Gobo Eiffel XML Library](./library/xml/doc/index.html)
* [Gobo Eiffel XPath Library](./library/xpath/doc/index.html)
* [Gobo Eiffel XSLT Library](./library/xslt/doc/index.html)

and twelve utilities:

* [Gobo Eiffel Ant](./tool/geant/doc/overview.html) (geant)
* [Gobo Eiffel Compiler](./tool/gec/doc/index.html) (gec)
* [Gobo Eiffel C Compilation](./tool/gecc/doc/index.html) (gecc)
* [Gobo Eiffel Cop](./tool/gecop/doc/index.html) (gecop)
* [Gobo Eiffel Doc](./tool/gedoc/doc/index.html) (gedoc)
* [Gobo Eiffel Image](./tool/image/doc/index.html) (geimage)
* [Gobo Eiffel Lex](./tool/gelex/doc/index.html) (gelex)
* [Gobo Eiffel Lint](./tool/gelint/doc/index.html) (gelint)
* [Gobo Eiffel Preprocessor](./tool/gepp/doc/index.html) (gepp)
* [Gobo Eiffel Test](./tool/getest/doc/index.html) (getest)
* [Gobo Eiffel XSLT Processor](./tool/gexslt/doc/index.html) (gexslt)
* [Gobo Eiffel Yacc](./tool/geyacc/doc/index.html) (geyacc)

Note that these utilities are not needed if you just want to use the
library classes provided in this package.

## Eiffel compilers

The supported Eiffel compilers, in alphabetical order, are:

* Gobo Eiffel Compiler (gec) 25.09.02
* ISE Eiffel 25.02.9.8732 (Classic and .NET)

For more details about the supported Eiffel compilers, please see the file
[Release notes](./Release_notes.md). 
This software might work with other Eiffel compilers and/or other compiler
versions, however no test has been made yet.
To have a better understanding of the way this software has been designed
and implemented, you can also have a look at
[portability issues](./library/common/doc/portability/index.html).

## Platforms

The software provided in this distribution should work on any platform
where supported Eiffel compilers are available. However this software
has only been tested under Windows 11, Linux Ubuntu and MacOS.
Since most Eiffel compilers use the notation `$NAME` for environment
variables in their ECF files (or equivalent), this convention has been
used instead of the Windowish `%NAME%`. Likewise, the directory separator
used throughout this distribution is `/`, following Unix/Linux convention
instead of the Windows `\` separator.

To install this package, please follow the instructions below:

### On Windows

* [Download](https://github.com/gobo-eiffel/gobo/releases/latest)
  the package `gobo-windows-{x86_64,arm64}-*.7z` (choose
  `x86_64` or `arm64` depending on your architecture).
* Copy the files to a directory of your choice on your disk,
  and (optional) set the environment variable `%GOBO%` to
  that directory, known as the distribution directory.
* Put the directory `%GOBO%\bin` in your `PATH`.

### On Linux

* [Download](https://github.com/gobo-eiffel/gobo/releases/latest)
  the package `gobo-linux-{x86_64,arm64}-*.tar.xz` (choose
  `x86_64` or `arm64` depending on your architecture).
* Copy the files to a directory of your choice on your disk,
  and (optional) set the environment variable `$GOBO` to
  that directory, known as the distribution directory.
* Put the directory `$GOBO/bin` in your `PATH`.

### On MacOS

* [Download](https://github.com/gobo-eiffel/gobo/releases/latest)
  the package `gobo-macos-{x86_64,arm64}-*.tar.xz` (choose
  `x86_64` or `arm64` depending on your architecture).
* Copy the files to a directory of your choice on your disk,
  and (optional) set the environment variable `$GOBO` to
  that directory, known as the distribution directory.
* Put the directory `$GOBO/bin` in your `PATH`.

### On other platforms

* [Download](https://github.com/gobo-eiffel/gobo/releases/latest)
  the package `gobo-*.tar.gz` (Source code), or check-out the
  files from the [Git repository](https://github.com/gobo-eiffel/gobo).
* Copy the files to a directory of your choice on your disk and
  (optional) set the environment variable `$GOBO` to that directory,
  known as the distribution directory.
* Put the directory `$GOBO/bin` in your `PATH`.
* (optional) Download the [Zig toochain](https://ziglang.org/download/),
  copy the files to the directory `$GOBO/tool/gec/backend/c/zig` (the `zig`
  executable should be at the root of this directory), and run the command:
  ```sh
    $GOBO/.cicd/patch_zig.ps1 $GOBO/tool/gec/backend/c/zig
  ``` 
* To build the tools (e.g. `gec`, `geyacc`, ...), execute the script:
  ```sh
    $GOBO/bin/install.sh <c_compiler>
  ```
	where `<c_compiler>` is `zig` (if installed above) or a C compiler
  installed on your computer (for example use `gcc` for GNU C compiler).

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
on GitHub. You can subscribe and take part to the discussions or ask
your questions there.

A [nightly build](https://github.com/gobo-eiffel/gobo/releases/tag/nightly)
with bug fixes and features under development is available on GitHub, next to the other
[releases](https://github.com/gobo-eiffel/gobo/releases).
The official releases are also available on
[SourceForge](https://sourceforge.net/projects/gobo-eiffel/files/gobo-eiffel/) for those of you who prefer to use this mirror.

Although the license allows you to do pretty much whatever you want
with this software, we would be grateful to get your feedback,
bug reports and/or bug fixes, improvements, etc. so that others
could benefit from your work and ideas as well.
We would also be interested in hearing about your projects and
how easy (or difficult) it was to adapt this software for your
specific needs. Thank you in advance.

You are also welcome to take part in the development of the
*Gobo Eiffel Project*. Some
[developer guidelines](./library/common/doc/guidelines/index.html)
are available to help you make the first steps.

## Authors

Copyright (c) 1997-2025, Eric Bezault and others<br>
mailto:[ericb@gobosoft.com](mailto:ericb@gobosoft.com)<br>
https:[//www.gobosoft.com](https://www.gobosoft.com)
