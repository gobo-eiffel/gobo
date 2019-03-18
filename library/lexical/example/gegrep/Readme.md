# Gobo Eiffel Lexical Example: gegrep

This folder contains the source code for a simple Unix-like `grep`
program. *Gobo Eiffel Grep* (`gegrep`) takes a regular expression and
a list of files as arguments and prints on the standard output the lines
from these files containing a match for the given regular expression.

`gelex` works in two phases. First it generates an Eiffel class from a set
of regular expressions and then this class can be compiled in a system
using these regular expressions for scanning. This means that the
regular expressions are "hard-coded" inside the system. In order to
change one of these regular expressions, a new class has to be generated
using `gelex`, and then the system has to be compiled again.

`gegrep` shows how to use regular expressions dynamically in your system.
New regular expressions can be provided without having to recompile the
system.

`gelex` and `gegrep` use the same classes from the *Gobo Eiffel Lexical Library*,
but after building the Deterministic Finite Automaton (DFA), `gelex` just
outputs a class text describing the corresponding scanner, whereas `gegrep`
uses this DFA to directly analyze input streams.

**To compile and run this example:**

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

2. Run the program using:

        gegrep [-i] regexp [filename...]

    where the options and arguments are defined as follows:

        -i    Produce a case-insensitive scanner.
        regexp
              Regular expression used to search the files.
        filename...
              Names of the files to be searched. Use standard
              input if no filename is specified.

The regular expression given as argument follows the same notation as
regular expressions provided in `gelex`. See
[`$GOBO/tool/gelex/doc/patterns.html`](http://www.gobosoft.com/eiffel/gobo/gelex/patterns.html)
for details.

When several filenames are given as argument, the matched lines are
prefixed by their enclosing filename, just as `grep` does.

## Authors

Copyright (c) 1997-2019, Eric Bezault and others
