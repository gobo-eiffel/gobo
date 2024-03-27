# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type `ANY` of the actual argument of `f` is not expanded. But at runtime the actual argument will be attached to an object of type `CC`, which is an expanded type which contains an attribute `name` whose type is reference but not separate. This violates `V1EA-1G`, even though in this test `VUAR-4G` is not violated.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity error, resulting in a type issue where a `STRING` from another SCOOP region is not flagged as separate.
