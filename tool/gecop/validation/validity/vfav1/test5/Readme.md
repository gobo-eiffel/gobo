# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming features `f` and `g` both with the same alias name `alias "+"`. But one corresponds to the binary operator `+` and the other one to the unary operator `+`. In this test `VFAV-1` is not violated.
