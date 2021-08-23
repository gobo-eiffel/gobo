# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [f: INTEGER]` and `TUPLE [f: INTEGER; g: BOOLEAN]`. There is a call `a.f` where `a` is of type `G`. But `f` is a tuple label in both generic constraints. This violates `VGMC`, even if the tuple labels are at the same index with the same types.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a `VTMC-1`. Apparently is does not support tuple labels when the type of the target is a generic parameter.
