# Semantics MEVS-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the self-initializing code of the attribute `f` is called twice, recursively. This is because the attribute is set to the result of its self-initializing code, and hence marked as initialized,only at  the end of the execution of then self-initializing code. This test satisfies `MEVS-3`.
