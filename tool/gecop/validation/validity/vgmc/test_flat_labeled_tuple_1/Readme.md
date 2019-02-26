# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [CC]` and `TUPLE [DD]`. It inherits `f` from class `XX` with the call `a.g`, where `a` is of type `G` and `g` is the tuple label of the first item in the generic constraint `TUPLE [g: ANY]` in `XX`. But the first tuple items in the generic constraints in `BB` have a different type. This violates `VGMC` because we don't know what is the type of the resulting expression, in particular when it is used as the target of another call.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a `VTMC-1`. Apparently is does not support tuple labels when the type of the target is a generic parameter.
