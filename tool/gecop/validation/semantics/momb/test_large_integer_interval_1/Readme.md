# Semantics MOMB

This [test](.) is exercising the semantics rule [MOMB](../Readme.md).

### Description

In this test, the matching branch of the inspect instruction is a
very large interval `1 .. 1_000_000_000`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) generates a 20 GB C file and
  the C compiler fails to compile it (compiler is out of heap space).
