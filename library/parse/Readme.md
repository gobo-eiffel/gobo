# Gobo Eiffel Parse Library

This library provides parsing functionalities such as syntactical analyzers
(also known as parsers). This library is mainly used by *Gobo Eiffel Yacc*
(`geyacc`). To get information about `geyacc`, have a look at
[`$GOBO/tool/geyacc/doc`](https://www.gobosoft.com/eiffel/gobo/tool/geyacc/doc/index.html).

**Included in this library:**

* `example`: this folder contains examples for this library and for `geyacc`.
* `src`: this folder contains the clusters and classes making up this library.
  * `error`: Error message classes used throughout this library and `geyacc`.
  * `fsm`: Finite State Machine.
  * `generation`: Parser table compression algorithm. Generation of Eiffe
    class texts describing parsers made out of given grammars.
  * `grammar`: Grammar description classes.
  * `parser`: Parser engine classes.
  * `skeleton`: Skeleton classes used by `geyacc`. Describe abstract parsers.
  * `support`: Support classes.
  * `yacc`: Parser used by `geyacc` to read grammar descriptions from `.y` files.
* `test`: this folder contains the unit tests for this library as well as
  tests to exercise the examples.

A more detailed documentation for this library will be provided in
future releases.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
