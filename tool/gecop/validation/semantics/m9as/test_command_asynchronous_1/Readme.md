# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The target of the separate call is not in the current SCOOP region. And `g` is a procedure which has a separate formal argument and the actual argument `s`, whose type is separate, is not in the current region and the current processor has no lock on it. So the procedure is executed asynchronously in the region of the target by it associated processor. The execution of `f` continues without waiting for the separate call to complete.
