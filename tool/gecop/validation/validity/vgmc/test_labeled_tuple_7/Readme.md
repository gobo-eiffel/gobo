# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [f: INTEGER; g: INTEGER]` and `TUPLE [f: INTEGER; h: INTEGER]`. There is a call `a.f` where `a` is of type `G`. But `f` is a tuple label in both generic constraints. In this test `VGMC` is not violated because the types are the same (i.e. `TUPLE [INTEGER, INTEGER]`, labels are not taken into account when comparing types) and the label `f` is at the same position in both types. So it's as if there was a single generic constraint with type `TUPLE [f: INTEGER; some_other_label: INTEGER]`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a `VTMC-1`. Apparently is does not support tuple labels when the type of the target is a generic parameter.
