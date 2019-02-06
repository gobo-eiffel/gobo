# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, class `BB` inherits from `CC` and renames feature `f` with the binary operator alias name `alias "*"`. But feature `f` is not a query with exactly one argument in `CC`. This violates `VFAV-1`.
