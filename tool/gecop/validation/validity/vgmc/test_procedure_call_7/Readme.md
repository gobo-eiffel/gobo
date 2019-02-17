# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `CC` again. There is a call `a.h` where `a` is of type `G` and `h` is the final name of feature `f` renamed from `CC` (first constraint) and also the final name of feature `g` renamed from `CC` again (second constraint). This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTMC-2`.
