# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` twice, a first time as `g` and a second time as `h`. This violates `VGGC-2`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-2`.
