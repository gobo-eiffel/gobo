# Semantics MBAS

This [test](.) is exercising the semantics rule [MBAS](../Readme.md).

### Description

In this test, we have an assignment `a := b` where the type of `a` and `b` is a reference type but `b` is attached to an object with copy semantics. After the assignment the target `a` is attached to a clone of the object attached to the source `b`. This test satisfies `MBAS`.
