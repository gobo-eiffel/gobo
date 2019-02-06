# Validity VFAV-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming features `f` and `g` with the same alias name `alias "[]"`. This violates `VFAV-2`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VTGC-2`. Also, the error message is truncated.
