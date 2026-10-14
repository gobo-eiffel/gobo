# Semantics M9WC

This [test](.) is exercising the semantics rule [M9WC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a precondition with a qualified
separate call `b.is_valid (c)` whose target was locked in the caller. So the
precondition is a correctness condition. The feature `BB.is_valid` also contains
a precondition with a qualified separate call `c.is_valid` whose target was locked
in the caller. So this precondition is also a correctness condition. The
nested precondition is not evaluated to avoid infinite recursion.
