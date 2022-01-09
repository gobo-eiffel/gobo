# Semantics M1IE

This [test](.) is exercising the semantics rule [`M1IE`](../Readme.md).

### Description

In this test, we have an inequality expression of the form `c /= d` where `c` is a reference entity attached to an object of expanded type `CC` and `d` is a reference entity attached to an object of expanded type `DD`. The value of this expression is true because the objects are with copy semantics but they don't have the same type. This test shows that `is_equal` is not called.
