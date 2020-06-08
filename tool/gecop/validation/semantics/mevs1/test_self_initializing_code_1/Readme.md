# Semantics MEVS-1

This [test](.) is exercising the case [1](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the value of the attribute `f` is `"bar"` after the assignment, even though this attribute has self-initializing code setting it to `"foo"`. This test satisfies `MEVS-1`.
