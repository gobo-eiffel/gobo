# Semantics MBAS

This [test](.) is exercising the semantics rule [MBAS](../Readme.md).

### Description

In this test, we have an assignment `b := c` where the type of `c` is expanded and the type of `b` is a reference type. After the assignment the target `b` is attached to a clone of the object attached to the source `c`. This test satisfies `MBAS`.
