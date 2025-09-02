# Installing the Gobo Eiffel tools

If you downloaded the source code of Gobo from Git or
if you got it from a source package (e.g. `gobo-*.zip`
or `gobo-*.tar.gz`), you will need to run this install
procedure in order to compile the tools which will be
placed in `$GOBO/bin`.

The procedure is quite simple:

* Check out the source code from the Gobo Git repository
  (or extract it from the source package).
* Set the environment variable `$GOBO` to the directory where
  you installed the source.
* Add `$GOBO/bin` to your `$PATH`.
* Make sure that your C compiler is in your `$PATH`.
* Depending on your platform, run either:

		install.bat [-v] <c_compiler>

	or:

		install.sh [-v] <c_compiler>

* The Gobo tools will now be accessible in `$GOBO/bin`.

To find out about the already supported values for
`<c_compiler>`, run the same command but with the
option `-help`. The optional command-line
option `-v` is used to run the installation in verbose mode.
Since not all C compilers nor all platforms have been
tested, you are welcome to send patches and/or code to
support other C compilers.

After having run this installation procedure, the Gobo package
should be fully installed on your computer and ready to be
used. Later on, if you check out new files from Git, there 
is usually no need to redo a full installation again. 
However, if you want to make sure that the files in the package
are up to date (e.g. each parser Eiffel class regenerated from 
its associated `.y` file), you can run this command:

		geant install
		geant clean

in the `$GOBO` root directory. `geant` will find its
instructions in the file `build.eant`. Almost all directories
are equipped with such build file. In order to know 
the possible command-line arguments provided by a given
build file, type:

		geant help

## Authors

Copyright (c) 2001-2016, Eric Bezault and others
