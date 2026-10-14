# Semantics M9WC

This [test](.) is exercising the semantics rule [M9WC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a precondition with a qualified
separate call whose target was not locked in the caller. So the precondition is
a wait condition. `f` contains another precondition with a qualified
non-separate call. So this other precondition is also a correctness condition.
A precondition violation is raised because this correctness condition
evaluates to false.
