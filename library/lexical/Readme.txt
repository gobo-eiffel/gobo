Gobo Eiffel Lexical Library

This library provides lexical functionalities such as regular expressions,
nondeterministic finite automata (NFA) and deterministic finite automata
(DFA), lexical analyzers (also known as scanners or tokenizers). This
library is mainly used by Gobo Eiffel Lex (gelex). To get information
about Gelex, have a look at "$GOBO\src\gelex\Redame.txt" and
"$GOBO\doc\gelex". Examples for both Gelex and this library can be
found in "$GOBO\example\lexical".

Clusters:

automaton
    Nondeterministic finite automata (NFA) and deterministic finite
    automata (DFA).
error
    Error message classes used throughout this library and Gelex.
generation
    DFA table compression algorithm. Generation of Eiffel class texts
    describing scanners made out of DFA.
lex
    Parser used by Gelex to read scanner descriptions from ".l" files.
regexp
    Regular expression classes using DFA which are dynamically built
    (i.e. no class text generation using Gelex). See the Gegrep example
    in "$GOBO\example\lexical\gegrep" for details.
scanner
    Scanner classes using different kinds of DFA implementations
    (compressed tables, full tables).
skeleton
    Skeleton classes used by Gelex. Describe abstract scanners.
support
    Support classes.

A more detailed documentation for this library will be provided in
future releases.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
