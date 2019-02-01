# Validity VFAV-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `g` with the alias `alias "[]"`. But feature `f` in `CC` is not a query with at least one argument. This violates `VFAV-2`.

