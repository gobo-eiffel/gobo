# Semantics MBAS

This [test](.) is exercising the semantics rule [MBAS](../Readme.md).

### Description

In this test, we have an assignment `c := b` where the type `BB` of `b` converts to the type `CC` of `c`. The unfolded form which is executed is `c := create {CC}.make_from_b (b)`. Type `CC` is expanded, so after the assignment the target `c` is attached to a clone of the object attached to the source `create {CC}.make_from_b (b)`. This test satisfies `MBAS`.
