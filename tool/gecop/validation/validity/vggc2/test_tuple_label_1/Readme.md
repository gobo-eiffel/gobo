# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `x` as `y`. But `x` is a tuple label in the constraint `TUPLE [x: INTEGER]`, and not the final name of a feature. This violates `VGGC-2`.
