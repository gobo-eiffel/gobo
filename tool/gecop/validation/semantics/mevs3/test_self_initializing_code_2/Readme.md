# Semantics MEVS-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the self-initializing code of the attribute `f` is called only by its first access. Its value is still `"foo"` when accessing it again. This test satisfies `MEVS-3`.
