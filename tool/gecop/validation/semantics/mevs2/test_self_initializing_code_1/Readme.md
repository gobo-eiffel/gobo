# Semantics MEVS-2

This [test](.) is exercising the case [2](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the value of the attribute `f` is `0` (which is the default initialization value of its type which is expanded), even though this attribute has self-initializing code setting it to `2`. This test satisfies `MEVS-2`.
