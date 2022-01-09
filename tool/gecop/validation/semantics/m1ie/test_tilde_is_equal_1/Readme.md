# Semantics M1IE

This [test](.) is exercising the semantics rule [`M1IE`](../Readme.md).

### Description

In this test, we have an inequality expression of the form `c /~ d` where `c` and `d` are attached to two different objects of type `CC` with the same value `4`. The value of this expression is false because the objects have the same type and they are equal when calling `is_equal`. This test shows that `is_equal` is called.
