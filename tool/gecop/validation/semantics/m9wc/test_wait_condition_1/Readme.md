# Semantics M9WC

This [test](.) is exercising the semantics rule [M9WC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a precondition with a qualified
separate call whose target was not locked in the caller. So the precondition is
a wait condition. Initially the condition is not satisfied, and then another SCOOP
processor made it True, allowing `f` to be executed.
