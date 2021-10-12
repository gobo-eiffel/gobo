# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, a manifest tuple `t` is created using the local variable `c` declared with a reference type but attached to an object with copy semantics is created. The effect of the manifest tuple creation is the one of cloning the object which is attached to `c` and attaching it to the item of the manifest tuple `t`. This test satisfies `MBRE-3`.

### Notes

* ISE Eiffel (as of 20.11.10.5048 and after) does not clone the object with copy semantics. We end up having entities, the local variable `c` and in the item in the tuple `t`, sharing the same object. This violates `MBRE-3`.
