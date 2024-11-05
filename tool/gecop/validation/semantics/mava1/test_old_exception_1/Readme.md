# Semantics MAVA-1

This [test](.) is exercising the case [`1`](../Readme.md) of the semantics rule [`MAVA`](../../mava/Readme.md).

### Description

In this test, the evaluation of the expression `g`, from the old expression `old g`, before executing the body of feature `f` triggers an exception. This exception is recorded and an exception of type `OLD_VIOLATION` is raised when actually executing the old expression during the evaluation of the postcondition.
