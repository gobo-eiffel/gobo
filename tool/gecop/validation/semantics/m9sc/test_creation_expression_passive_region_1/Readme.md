# Semantics M9SC

This [test](.) is exercising the semantics rule [M9SC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a creation expression whose creation type is separate. With the syntax `create <NONE> ...`, this creates a new passive region. So the creation procedure is executed synchronously on the new object in the new region by the current processor. The execution of `f` waits until the creation procedure completes before proceeding further.
