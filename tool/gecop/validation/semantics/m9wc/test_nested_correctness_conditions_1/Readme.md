# Semantics M9WC

This [test](.) is exercising the semantics rule [M9WC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a precondition with a qualified
non-separate call `b.is_valid (c)`. So the precondition is a correctness condition.
The feature `BB.is_valid` also contains a precondition with a qualified non-separate
call `c.is_valid`. So this precondition is also a correctness condition. The
nested precondition is not evaluated to avoid infinite recursion.
