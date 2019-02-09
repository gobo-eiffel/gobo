# Validity VGGC-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the formal generic parameter of class `BB` has a `create` clause listing `make`. But `make` is the final name of a query in the constraint `CC`, not a procedure. This violates `VGGC-3`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation.
