# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, class `BB` inherits from `CC` and renames feature `f` with the unary operator alias name `alias "not"`. But feature `f` is not a query with no argument in `CC`. This violates `VFAV-1`.
