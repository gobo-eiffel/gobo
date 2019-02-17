# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `a.f` where `a` is of type `G`. But `f` is the name of a feature both in `CC` and `DD`. This violates `VGMC`, even though this is in fact the same feature inherited from `ZZ`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTMC-2`.
