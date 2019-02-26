# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `TUPLE [f: INTEGER]` and `ANY`. There is a call `a.f` where `a` is of type `G`. So the call is returning the first item in the `TUPLE`. In this test `VGMC` is not violated.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a `VTMC-1`. Apparently is does not support tuple labels when the type of the target is a generic parameter.
