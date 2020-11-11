# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. `make` is the final name of the procedure `f` renamed from `CC` which is listed twice as generic constraint with the same renaming  of `f`. In this test `VGGC-3` is not violated because it's as if `CC` was a single generic constraint with respect to `make`, even though feature `g` in `CC` is renamed differently in these two constraints.
