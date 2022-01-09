# Semantics M1EE

This [test](.) is exercising the semantics rule [`M1EE`](../Readme.md).

### Description

In this test, we have an equality expression of the form `c ~ d` where both `c` and `d` are Void. The value of this expression is true.

### Notes:

* The standard says that the value of `Void ~ Void` is false, but both ISE Eiffel (as of 21.11.10.6046 and after) and Gobo Eiffel consider the value of this expression to be true.
