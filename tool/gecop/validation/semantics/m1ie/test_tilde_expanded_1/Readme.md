# Semantics M1IE

This [test](.) is exercising the semantics rule [`M1IE`](../Readme.md).

### Description

In this test, we have an inequality expression of the form `c /~ d` where `c` has value `4` of type `INTEGER_8` and `d` has value `'%/4/'` of type `CHARACTER_8`. The value of this expression is true because `c` and `d` don't have the same type.

### Notes:

* Both ISE Eiffel (as of 21.11.10.6046 and after) and Gobo Eiffel also report a `VWEQ` warning indicating that the types of the operands don't conform nor convert to each other.
