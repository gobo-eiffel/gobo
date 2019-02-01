# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming features `f` and `g` respectively as `infix "+"` and with the alias name `alias "+"` (which are equivalent notations). This violates `VFAV-1`, even if this feature is never called.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VTGC-2`. Also, it mentions `infix "+" alias "+"` whereas only `infix "+"` was specified for `f`.
