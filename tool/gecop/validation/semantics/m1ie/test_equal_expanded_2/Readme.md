# Semantics M1IE

This [test](.) is exercising the semantics rule [`M1IE`](../Readme.md).

### Description

In this test, we have an inequality expression of the form `c /= d` where `c` and `d` both have value `4` of type `INTEGER_32`. The value of this expression is false because both objects are with copy semantics, they have the same types and they are equal when calling `is_equal`.
