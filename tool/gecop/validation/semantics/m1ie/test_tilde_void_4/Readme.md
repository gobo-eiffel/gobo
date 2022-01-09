# Semantics M1IE

This [test](.) is exercising the semantics rule [`M1IE`](../Readme.md).

### Description

In this test, we have an inequality expression of the form `c /~ d` where both `c` and `d` are Void. The value of this expression is false.

### Notes:

* The standard says that the value of `Void /~ Void` is true, but both ISE Eiffel (as of 21.11.10.6046 and after) and Gobo Eiffel consider the value of this expression to be false.
