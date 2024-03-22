# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains two separate calls to the features `g` and `h` of class `BB`. Both separate calls have the same target `b` which is not in the current SCOOP region. Feature `g` is a query, so it is executed synchronously in the region of the target by its associated processor. The execution of `f` waits until the separate call completes before proceeding further. Then feature `h` is a procedure with no argument. So the separate call is executed asynchronously in the region of the target by its associated processor. This time the execution of `f` continues without waiting for the separate call to complete.
