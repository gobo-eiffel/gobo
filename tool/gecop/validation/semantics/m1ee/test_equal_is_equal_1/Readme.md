# Semantics M1EE

This [test](.) is exercising the semantics rule [`M1EE`](../Readme.md).

### Description

In this test, we have an equality expression of the form `c = d` where `c` and `d` are expanded entities of type `CC` with the same value `4`. The value of this expression is true because the objects are with copy semantics, they have the same type and they are equal when calling `is_equal`. This test shows that `is_equal` is called.
