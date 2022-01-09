# Semantics M1EE

This [test](.) is exercising the semantics rule [`M1EE`](../Readme.md).

### Description

In this test, we have an equality expression of the form `c ~ d` where `c` is attached to an object of type `CC` and `d` is attached to an object of type `DD`. The value of this expression is false because the objects don't have the same type. This test shows that `is_equal` is not called.
