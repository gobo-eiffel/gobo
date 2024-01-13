# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The target of the separate call is not in the current SCOOP region and `g` is a procedure with no argument. So the separate call is executed asynchronously. The execution of `f` continues without waiting for the separate call to complete.
