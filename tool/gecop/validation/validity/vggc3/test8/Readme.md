# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. `make` is the final name of a procedure in `CC` which is listed twice as generic constraint (once as `attached CC` and once as `detachable CC`). This violates `VGGC-3`, because even though it's as if `attached CC` was a single generic constraint, `attached CC` and `detachable CC` are considered as different types.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-3`.
