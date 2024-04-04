# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `BB` contains separate call to the feature `g` of class `AA`. The separate call is asynchronous because feature `g` is a procedure with no argument. The target of the call is the root object. An exception occurs (in feature `z` of class `CC`) during this call, and it is not propagated to the client region. The exception is silently ignored and the region is clean again at the end of `f` because no subsequent synchronous calls is executed on the dirty region, and because the exception did not occur during a chain of synchronous calls from the root creation procedure.
