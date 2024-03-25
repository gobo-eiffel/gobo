# Validity VUER

This [test](.) is exercising the validity rule [VUER](../../vuer/Readme.md).

### Description

In this test, in class `BB` there is a separate call to the function `f` from class `CC`. The type of the result of `f` is the formal generic parameter of `CC`, whose actual generic parameter may be an expanded type with attributes whose type is reference but not separate. This violates `VUER`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation.
