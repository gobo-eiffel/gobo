# Semantics MBAS

This [test](.) is exercising the semantics rule [MBAS](../Readme.md).

### Description

In this test, we have an assignment `c := b` where the type of `b` converts to the type of `c`. The unfolded form which is executed is `c := b.to_c`. The type of `b.to_c` is expanded, but the result of this expression is an object with copy semantics. After the assignment the target `c` is attached to a clone of the object attached to the source `b.to_c`. This test satisfies `MBAS`.

### Notes

* ISE Eiffel (as of 20.11.10.5048 and after) does not clone the object with copy semantics in *finalized mode*. This violates `MBAS`.  It works as expected in *workbench mode*.
