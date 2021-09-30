# Semantics MBRE-1

This [test](.) is exercising the condition [`1`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, we have an assignment `b := d` where the type of `d` converts to the type of `b`. The unfolded form which is executed is `b := d.to_b`. The expression `d.to_b` is an attribute of reference type, but attached to an object with copy semantics. After the assignment the target `b` is attached to a clone of the object attached to the attribute `d.to_b`. Otherwise we would end up with two entities `b` and `d.to_b` attached to the same object with copy semantics, which defeats one of the goals of copy semantics.

### Notes

* This test shows that we need to apply both `MBRE-1` and `MBRE-3`, and not just one or the other.

* ISE Eiffel (as of 20.11.10.5048 and after) does not clone the object with copy semantics in *finalized mode*. We end up with two entities `b` and `d.to_b` attached to the same object with copy semantics, which defeats one of the goals of copy semantics. It works as expected in *workbench mode*.
