# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `infix "+"` as `g`. Since `infix "+"` is the final name of a feature in `CC`, and `g` is not, this `rename` clause is valid. In this test `VGGC-2` is not violated.

