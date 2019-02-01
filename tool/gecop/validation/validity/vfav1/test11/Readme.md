# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` with the alias name `alias "+"`. But there is already a feature named `infix "+"` (which are equivalent notations) in `CC`. This violates `VFAV-1`, even if these features are never called.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VTGC-2`.
