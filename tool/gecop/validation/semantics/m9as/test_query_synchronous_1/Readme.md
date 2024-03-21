# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The target of the separate call is not in the current SCOOP region. And `g` is a query, so it is executed synchronously in the region of the target by its associated processor. The execution of `f` waits until the separate call completes before proceeding further.
