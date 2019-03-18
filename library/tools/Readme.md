# Gobo Eiffel Tools Library

This library is a portable Eiffel class library
to make easier the development of Eiffel tools such as Eiffel
pretty-printers or flat-short tools. This library contains an
ECF parser to analyze ECF files, an Eiffel parser which builds
abstract syntax trees out of Eiffel source code, and routines 
to process these abstract syntax trees. 
The *Gobo Eiffel Tools Library* is primarily used to develop
the *Gobo Eiffel Compiler* (`gec`) and *Gobo Eiffel Lint*
(`gelint`).

**Included in this library:**

* `doc`: this folder contains the documentation for this library,
  in HTML format. Start with `index.html`.
* `example`: this folder contains examples for this library.
* `src`: this folder contains the clusters and classes making up this library.
  * `eiffel`:
     * `ast`: Abstract syntax tree classes.
     * `compilation`: Eiffel code analysis.
     * `dynamic`: Dynamic type set classes and other runtime entities.
     * `error`: Error message classes used throughout this library.
     * `generation`: C code generation.
     * `parser`: Eiffel parsers.
     * `processor`: AST visitors.
  * `ecf`: ECF parser.
  * `lace`: LACE parser. These classes are obsolete. `ecf` should be used instead.
  * `xace`: Xace parser. These classes are obsolete. `ecf` should be used instead.
* `test`: this folder contains the unit tests for this library as well as
  tests to exercise the examples. It also contains an Eiffel language
  validity test suite.

A more detailed documentation for this library will be provided in
future releases.

## Authors

Copyright (c) 2000-2019, Eric Bezault and others
