# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. `make` is the final name of a procedure in `CC` which is listed twice as generic constraint with the same actual generic parameter `ANY`. In this test `VGGC-3` is not violated because it's as if `CC [ANY]` was a single generic constraint.
