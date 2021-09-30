# Semantics MBRE-1

This [test](.) is exercising the condition [`1`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, we have an assignment `c := d` where the type of `d` converts to the type of `c`. The unfolded form which is executed is `c := d.to_c`. The expression `d.to_c` is an attribute of expanded type. After the assignment the target `c` is attached to a clone of the object attached to the attribute `d.to_c`. Otherwise we would end up with two entities `c` and `d.to_c` attached to the same object with copy semantics, which defeats one of the goals of copy semantics.

### Notes

* This test shows that we need to apply both `MBRE-1` and `MBRE-3`, and not just one or the other.
