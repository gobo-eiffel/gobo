# Gobo Eiffel Lexical Library

This library provides lexical functionalities such as regular expressions,
nondeterministic finite automata (NFA) and deterministic finite automata
(DFA), lexical analyzers (also known as scanners or tokenizers). This
library is mainly used by *Gobo Eiffel Lex* (`gelex`). To get information
about `gelex`, have a look at
[`$GOBO/tool/gelex/doc`](https://www.gobosoft.com/eiffel/gobo/tool/gelex/doc/index.html).

**Included in this library:**

* `example`: this folder contains examples for this library and for `gelex`.
* `src`: this folder contains the clusters and classes making up this library.
  * `automaton`: Nondeterministic finite automata (NFA) and deterministic finite
    automata (DFA).
  * `error`: Error message classes used throughout this library and `gelex`.
  * `generation`: DFA table compression algorithm. Generation of Eiffel class texts
    describing scanners made out of DFA.
  * `lex`: Parser used by `gelex` to read scanner descriptions from `.l` files.
  * `regexp`: Regular expression classes using DFA which are dynamically built
    (i.e. no class text generation using `gelex`). See the `gegrep` example
    in `example/gegrep` for details.
  * `scanner`: Scanner classes using different kinds of DFA implementations
    (compressed tables, full tables).
  * `skeleton`: Skeleton classes used by `gelex`. Describe abstract scanners.
  * `support`: Support classes.
* `test`: this folder contains the unit tests for this library as well as
  tests to exercise the examples.

A more detailed documentation for this library will be provided in
future releases.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
