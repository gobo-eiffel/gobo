# Semantics M9WC

This [test](.) is exercising the semantics rule [M9WC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a precondition with a qualified
separate call `b.is_valid (c)` whose target was not locked in the caller. So the
precondition is a wait condition. The feature `BB.is_valid` also contains a 
precondition with a qualified separate call `c.is_valid` whose target was not
locked in the caller. So this precondition is also a wait condition. Both
nested preconditions get evaluated.
