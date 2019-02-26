# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [INTEGER]` and `TUPLE [INTEGER, STRING]`. It inherits `f` from class `XX` with the call `a.g`, where `a` is of type `G` and `g` is the tuple label of the first item in the generic constraint `TUPLE [g: INTEGER]` in `XX`. In this test `VGMC` is not violated because the inherited feature is valid when using the first tuple item in either of the two generic constraints in `BB`, and these two items have the same type.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a `VTMC-1`. Apparently is does not support tuple labels when the type of the target is a generic parameter.
