# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, an object `b1` containing an attribute declared with an expanded type and attached to an object with copy semantics is cloned to another object  `b2` using feature `twin`. The effect for this attribute is the one of cloning the object it is attached to and attaching it to the target (the corresponding attribute in `b2`). This test satisfies `MBRE-3`.

### Notes

* ISE Eiffel (as of 20.11.10.5048 and after) does not properly clone the object with copy semantics. It looks like `standard_copy` is called instead of `copy` (which is what should be called when cloning an object). This violates `MBRE-3`.
