# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-object function `f` in class `AA`. Its result type is an expanded type, but it contains an attribute `name` whose type is reference but not separate. This violates `V1EA-1G`, even though in this test `VFFD-11G` is not violated because `f` is not a once-per-process function.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) does not report validity error `V1EA-1G`.
