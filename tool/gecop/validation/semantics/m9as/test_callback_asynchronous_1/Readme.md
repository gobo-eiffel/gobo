# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The target of the separate call is not in the current SCOOP region and `g` is a procedure with no argument. So the separate call is executed asynchronously. The execution of `f` continues without waiting for the separate call to complete. In feature `g` in class `BB` there is another separate call to feature `h` whose target is the object of type `AA` which triggered the call to `g`. But the call to `g` was asynchronous, so no lock passing occurred. So this second separate call is also executed asynchronously since `h` is a procedure with no argument.
