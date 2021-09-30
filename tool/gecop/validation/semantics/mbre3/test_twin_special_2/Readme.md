# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, a special object `s1` containing an item declared with an expanded type and attached to an object with copy semantics is cloned to another special object  `s2` using feature `twin`. The effect for this item is the one of cloning the object it is attached to and attaching it to the target (the corresponding item in `s2`). This test satisfies `MBRE-3`.

### Notes

* ISE Eiffel (as of 20.05.10.4440 and after) does not pass this test successfully because it does not seem to allow modification of the items directly in the special object (i.e. `s1.item (0).set_attr (4)`). It's as if `SPECIAL.item` is cloning the item, but there is no call to `DD.copy` showing that there is indeed a cloning. It may use `DD.standard_copy` (or a runtime equivalent) for some reason.
