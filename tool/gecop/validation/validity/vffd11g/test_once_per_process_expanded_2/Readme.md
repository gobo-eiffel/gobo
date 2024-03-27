# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-process function `f` in class `AA`. Its result type is an expanded type, but it contains an attribute `c` whose expanded type contains an attribute `name` whose type is reference but not separate. This violates `V1EA-1G`, even though in this test `VFFD-11G` is not violated because the result type of `f` is expanded.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity error, resulting in a type issue where a `STRING` from another SCOOP region is not flagged as separate.
