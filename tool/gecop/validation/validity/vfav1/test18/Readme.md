# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `infix "+"`. But feature `f` is not a query with exactly one argument in `CC`. This violates `VFAV-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) mentions `infix "+" alias "+"` whereas only `infix "+"` was specified for `f`.

