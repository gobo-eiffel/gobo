## Bootstrap of the Gobo Eiffel Compiler

If you downloaded the source code of Gobo from Git or
if you got it from a source package (e.g. `gobo*-src.7z`
or `gobo*-src.gz`), and if you don't have an Eiffel compiler 
already installed on your computer, you will need to 
run this bootstrap procedure in order to be able to 
compile the tools which will be placed in `$GOBO/bin`.

The procedure is quite simple:

* Check out the source code from the Gobo Git repository (or extract it from the source package).
* Set the environment variable `$GOBO` to the directory where you installed the source.
* Add `$GOBO/bin` to your `$PATH`.
* Make sure that your C compiler is in your `$PATH`.
* Depending on your platform, run either:

		bootstrap.bat [-v] <c_compiler>

	or:

		bootstrap.sh [-v] <c_compiler>

* `gec` will now be accessible in `$GOBO/bin`.

To find out about the already supported values for
`<c_compiler>`, run the same command but with the 
option `-help`. The optional command-line
option `-v` is used to run the bootstrap in verbose mode.
Since not all C compilers nor all platforms have been
tested, you are welcome to send patches and/or code to
support other C compilers.

## Authors
Copyright (c) 2001-2016, Eric Bezault and others
