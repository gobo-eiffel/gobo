# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `CC` is `DD [like name]`, but `like name` is an anchored type. Furthermore, although not relevant for `VGGC`, `name` is not the final name of a feature in class `CC`. This violates `VGGC-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-1`.
