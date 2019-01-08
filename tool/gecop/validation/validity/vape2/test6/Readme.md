# Validity VAPE-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VAPE](../../vape/Readme.md).

### Description

In this test, feature `f` is exported to `ANY`. An implicit conversion from type `CC` to type `BB` appears in its precondition, but the associated convert procedure `make_from_cc` is only available for creation to `AA`. This violates `VAPE-2`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and above) fails to report this validity rule violation.
