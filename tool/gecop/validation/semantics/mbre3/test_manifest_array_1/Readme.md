# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, a manifest array `a` is created using the local variable `c` declared with a reference type but attached to an object with copy semantics is created. The effect of the manifest array creation is the one of cloning the object which is attached to `c` and attaching it to the item of the manifest array `a`. This test satisfies `MBRE-3`.
