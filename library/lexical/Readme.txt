Gobo Eiffel Lexical Library

This library provides lexical functionalities such as regular expressions,
nondeterministic finite automata (NFA) and deterministic finite automata
(DFA), lexical analyzers (also known as scanners or tokenizers). This
Library is mainly used by Gobo Eiffel Lex (gelex). To get information
about Gelex, have a look at "$GOBO\src\gelex\Redame.txt" and
"$GOBO\doc\gelex". Examples for both Gelex and this library can be found
in "$GOBO\example\lexical".

Clusters:

automaton
    Nondeterministic finite automata (NFA) and deterministic finite
    automata (DFA).
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

Clusters of the form "<cluster_name>\spec\<compiler_name>", where
<cluster_name> is one of the clusters listed above and <compiler_name> 
is either "hact", "ise", "se", "tower" or "ve", contain classes adapted
from non-portable classes in <cluster_name> (filenames suffixed by ".ge").
See "$GOBO\doc\portability" for details.

A more detailed documentation for this library will be provided in
future releases.

--
Eric Bezault <ericb@gobo.demon.co.uk>
