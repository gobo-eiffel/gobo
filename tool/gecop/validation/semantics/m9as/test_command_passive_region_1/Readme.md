# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the procedure `g` of class `BB`. The target of the separate call is in a passive region. So the procedure is executed synchronously in the region of the target by the current processor. The execution of `f` waits until the separate call completes before proceeding further.
