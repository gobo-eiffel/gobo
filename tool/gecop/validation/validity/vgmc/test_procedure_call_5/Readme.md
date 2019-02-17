# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `attached CC` and `detachable CC`. There is a call `a.f` where `a` is of type `G` and `f` is the name of a feature in `CC`. This violates `VGMC`, because even though it's as if `attached CC` was a single generic constraint, `attached CC` and `detachable CC` are considered as different types.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTMC-2`.
