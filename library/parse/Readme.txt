Gobo Eiffel Parse Library

This library provides parsing functionalities such as syntactical analyzers
(also known as parsers). This library is mainly used by Gobo Eiffel Yacc
(geyacc). To get information about Geyacc, have a look at "$GOBO\doc\geyacc"
and "$GOBO\src\geyacc\Redame.txt". Examples for both Geyacc and this library
can be found in "$GOBO\example\parse".

Clusters:

error
    Error message classes used throughout this library and Geyacc.
fsm
    Finite State Machine.
generation
    Parser table compression algorithm. Generation of Eiffel class
    texts describing parsers made out of given grammars.
grammar
    Grammar description classes.
parser
    Parser engine classes.
skeleton
    Skeleton classes used by Geyacc. Describe abstract parsers.
support
    Support classes.
yacc
    Parser used by Geyacc to read grammar descriptions from ".y" files.

A more detailed documentation for this library will be provided in
future releases.

--
Copyright (c) 1997-2000, Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com
