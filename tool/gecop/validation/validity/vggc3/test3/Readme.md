# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. But `make` is the final name of a feature in `CC` and in `DD` (the two generic constraints). This violates `VGGC-3`, even if in `CC` the feature `make` is a query and not a procedure.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-3`.
