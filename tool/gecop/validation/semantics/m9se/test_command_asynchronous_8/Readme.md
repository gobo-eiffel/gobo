# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is asynchronous because feature `g` is a procedure with no argument. An exception occurs (in feature `z` of class `CC`) during this call, and it is not propagated to the client region. The exception is silently ignored because no subsequent calls is executed on the dirty region.
