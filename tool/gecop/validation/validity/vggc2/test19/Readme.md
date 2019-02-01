# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `g` and feature `g` as `f`. Feature `f` and `g` are the final names of features in `CC`. Their names end up being swapped. In this test `VGGC-2` is not violated.
