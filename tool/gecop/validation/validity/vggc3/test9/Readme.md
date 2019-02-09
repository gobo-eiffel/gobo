# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. `make` is the final name of procedure `f` renamed from `CC` (first constraint) and also the final name of procedure `g` renamed from `CC` again (second constraint). This violates `VGGC-3`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-3`.
