# Semantics MEVS-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the type of the attribute `f` is self-initializing (detachable) in class `BB`, therefore its self-initializing code is not called and the attribute has the default initialization value of its type (`Void`). In class `CC` the type of `f` is not self-initializing (reference attached), therefore its self-initializing code is called and the value is set to `"foo"`. This test satisfies `MEVS-3`.
