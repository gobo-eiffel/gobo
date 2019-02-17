# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. `make` is the final name of a procedure in `CC`, and also the final name of a procedure in `DD`. In this test `VGGC-3` is not violated because the feature `make` from `DD` is renamed as `make_dd` in the generic constraint.
