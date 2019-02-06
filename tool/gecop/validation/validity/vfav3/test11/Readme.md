# Validity VFAV-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` from `CC` with the alias name `alias "()"`. But class `CC` already has a feature `g` with the same alias name. This violates `VFAV-3`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. It calls the renamed version of the `()` operator.
