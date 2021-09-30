# Semantics MBRE-1

This [test](.) is exercising the condition [`1`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, we have an assignment `b := d` where the type of `d` converts to the type of `b`. The unfolded form which is executed is `b := d.to_c`. The expression `d.to_c` is an attribute of expanded type, even though the type of `b` is a reference type. After the assignment the target `b` is attached to a clone of the object attached to the attribute `d.to_c`. Otherwise we would end up with two entities `b` and `d.to_c` attached to the same object with copy semantics, which defeats one of the goals of copy semantics.

### Notes

* This test shows that we need to apply both `MBRE-1` and `MBRE-3`, and not just one or the other.

* ISE Eiffel (as of 20.11.10.5048 and after) does not clone the object with copy semantics in *finalized mode*. It also crashes with an exception trace. It works as expected in *workbench mode*.
