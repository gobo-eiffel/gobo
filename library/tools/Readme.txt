WARNING: THIS LIBRARY IS STILL UNDER DEVELOPMENT!

Gobo Eiffel Tools Library

The Gobo Eiffel Tools Library is a portable Eiffel class library
to make easier the development of Eiffel tools such as Eiffel
pretty-printers or flat-short tools. This library contains a
LACE parser to analyze Ace files, an Eiffel parser which builds
abstract syntax trees out of Eiffel source code, and routines
to process these abstract syntax trees. The Gobo Eiffel Tools
Library is primarily used to develop Gobo Eiffel Lint (gelint).

Clusters:

eiffel
  ast
      Abstract syntax tree classes.
  compilation
      Eiffel code analysis.
  dynamic
      Dynamic type set classes and other runtime entities.
  error
      Error message classes used throughout this library.
  generation
      C code generation.
  parser
      Eiffel parsers.
  processor
      AST visitors.
ecf
    ECF parser (not available yet).
lace
    LACE parser.
xace
    Xace parser.

A more detailed documentation for this library will be provided in
future releases.

--
Copyright (c) 2000-2007, Eric Bezault and others
