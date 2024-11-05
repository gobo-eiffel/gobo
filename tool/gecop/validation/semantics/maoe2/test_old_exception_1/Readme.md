# Semantics MAOE-2

This [test](.) is exercising the case [`2`](../Readme.md) of the semantics rule [`MAOE`](../../maoe/Readme.md).

### Description

In this test, the evaluation of the expression `g`, from the old expression `old g`, before executing the body of feature `f` triggers an exception. This exception is recorded and but no exception of type `OLD_VIOLATION` is raised because the old expression is not executed when evaluating the postcondition.
