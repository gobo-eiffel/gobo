# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is asynchronous because feature `g` is a procedure with no argument. An exception occurs (in feature `z` of class `CC`) during this call, and it is not propagated to the client region. Feature `f` contains another separate call to the feature `h` of class `BB`. This second separate call is asynchronous because feature `h` is a procedure with no argument. This call to `h` is ignored because the region of the target is dirty. The exception is silently ignored because no subsequent synchronous calls is executed on the dirty region.
