# Semantics M9SC

This [test](.) is exercising the semantics rule [M9SC](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains a creation expression whose creation type is separate. This creates a new region with a new processor. There is no explicit creation procedure. `default_create` has no argument and is executed asynchronously on the new object in the new region by the new processor. The execution of `f` continues without waiting for the creation procedure to complete.
