# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming the alias of feature `f` from `alias "+"` to `alias "-"`, and the alias of feature `g` from `alias "-"` to `alias "+"`. Their alias names end up being swapped. In this test `VFAV-1` is not violated.
