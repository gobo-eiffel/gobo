# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, in class `BB` there is a separate call to the procedure `f` from class `CC`. The type of the actual argument of `f` is the formal generic parameter of `BB`, whose actual generic parameter may be an expanded type with attributes whose type is reference but not separate. This violates `VUAR-4G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation.
