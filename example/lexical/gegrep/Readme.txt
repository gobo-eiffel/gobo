This directory contains the source code for a simple Unix-like 'grep'
program. 'Gobo Eiffel Grep' (Gegrep) takes a regular expression and
a list of files as arguments and prints on the standard output the lines
from these files containing a match for the given regular expression.

Gelex works in two phases. First it generates an Eiffel class from a set
of regular expressions and then this class can be compiled in a system
using these regular expressions for scanning. This means that the
regular expressions are "hard-coded" inside the system. In order to
change one of these regular expressions, a new class has to be generated
using Gelex, and then the system has to be compiled again.

Gegrep shows how to use regular expressions dynamically in your system.
New regular expressions can be provided without having to recompile the
system.

Gelex and Gegrep use the same classes from the Gobo Eiffel Lexical Library,
but after building the Deterministic Finite Automaton (DFA), Gelex just
outputs a class text describing the corresponding scanner, whereas Gegrep
uses this DFA to directly analyze input streams.

To compile this example:

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Ace file (ISE Eiffel: ise.ace, Halstenbach: hact.ace) or
   ESD file (Visual Eiffel: ve.esd). With SmallEiffel, you can just execute
   the script se.bat or se.sh (after possible modifications).
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
regular expressions provided in Gelex. See "$GOBO\doc\gelex\patterns.html"
for details.

When several filenames are given as argument, the matched lines are
prefixed by their enclosing filename, just as 'grep' does.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
