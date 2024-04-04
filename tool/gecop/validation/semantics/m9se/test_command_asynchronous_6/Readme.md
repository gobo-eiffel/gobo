# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f1` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is asynchronous because feature `g` is a procedure with no argument. An exception occurs (in feature `z` of class `CC`) during this call, and it is not propagated to the client region. The exception is silently ignored and the target region is clean again at the end of `f1` because no subsequent synchronous calls is executed on the dirty region. Then, feature `f2` of class `AA` contains a separate call to the feature `h` of class `BB`. The separate call is synchronous because feature `h` is a query. This separate call is executed normally because the region of the target is now clean.
