# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [f: INTEGER]` and `CC`. There is a call `a.f` where `a` is of type `G`. But `f` is both a tuple label in the first generic constraint, and a feature in `CC`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. Apparently is does not support tuple labels when the type of the target is a generic parameter.
