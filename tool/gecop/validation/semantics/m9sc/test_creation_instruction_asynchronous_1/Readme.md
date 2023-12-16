# Semantics M9SC

This [test](.) is exercising the semantics rule [M9SC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a creation instruction with a target whose type is separate. This creates a new region with a new processor. The creation procedure `make` has a_separate formal argument and the actual argument `s`, whose type is separate, is not in the current region and the current processor has no lock on it. So the creation procedure is executed asynchronously on the new object in the new region by the new processor. The execution of `f` continues without waiting for the creation procedure to complete.
