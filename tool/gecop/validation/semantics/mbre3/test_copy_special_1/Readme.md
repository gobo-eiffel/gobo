# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, a special object `s1` containing an item declared with a reference type but attached to an object with copy semantics is copied to another special object  `s2` using feature `copy`. The effect for this item is the one of cloning the object it is attached to and attaching it to the target (the corresponding item in `s2`). This test satisfies `MBRE-3`.

### Notes

* ISE Eiffel (as of 20.05.10.4440 and after) does not clone the object with copy semantics. We end up having two items, in `s1` and `s2`, sharing the same object. This violates `MBRE-3`.