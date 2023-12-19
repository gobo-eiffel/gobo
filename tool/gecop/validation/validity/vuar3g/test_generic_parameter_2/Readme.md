# Validity VUAR-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, in class `BB` there is a separate call to the procedure `f` from class `CC`. The type of the actual argument of `f` is the formal generic parameter of `BB`, whose actual generic parameter may be a reference type. But the type of the formal argument in `f` is the formal generic parameter of `CC`, whose actual generic parameter may not necessarily be separate. This violates `VUAR-3G`.

### Note

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation.
