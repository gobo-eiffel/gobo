# Semantics M9SC

This [test](.) is exercising the semantics rule [M9SC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a creation expression whose creation type is separate. This creates a new region with a new processor. The creation procedure `make` has a_separate formal argument and the actual argument `s`, whose type is not separate, is in the current region and therefore the current processor has a lock on it. So the creation procedure is executed synchronously on the new object in the new region by the new processor. The execution of `f` waits until the creation procedure completes before proceeding further.
