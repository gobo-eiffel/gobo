# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The target of the separate call is not in the current SCOOP region. And `g` is a procedure which has a separate formal argument and the actual argument `Current`, whose type is not separate, is in the current region and therefore the current processor has a lock on it. So the procedure is executed synchronously in the region of the target by its associated processor. The execution of `f` waits until the separate call completes before proceeding further.
