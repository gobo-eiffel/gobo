# Semantics MBAS

This [test](.) is exercising the semantics rule [MBAS](../Readme.md).

### Description

In this test, we have an assignment `c := b` where the type of `b` converts to the type of `c`. The unfolded form which is executed is `c := b.to_c`. The type of `b.to_c` is a reference type, so after the assignment the target `c` is attached to the same object as the source `b.to_c`. This test satisfies `MBAS`.
