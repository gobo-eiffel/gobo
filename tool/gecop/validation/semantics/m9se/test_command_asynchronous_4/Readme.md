# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is asynchronous because feature `g` is a procedure with no argument. An exception occurs (in feature `z` of class `CC`) during this call, and it is not propagated to the client region. Feature `f` contains another separate call to the feature `x` of class `BB`. This second separate call is synchronous because feature `x` is a query. This call to `x` is ignored because the region of the target is dirty, but an exception is raised in `f` and target region is clean again. Feature `f` contains a third separate call to the feature `h` of class `BB`. This third separate call is asynchronous because feature `h` is a procedure with no argument. This separate call is executed normally because the region of the target is now clean.
