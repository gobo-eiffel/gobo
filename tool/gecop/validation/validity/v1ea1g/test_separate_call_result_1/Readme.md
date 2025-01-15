# Validity V1EA-1G

This [test](.) is exercising the condition [1G](../Readme.md) of the validity rule [V1EA](../../v1ea/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type `ANY` of the result of `f` is not expanded. But at runtime the result will be attached to an object of type `CC`, which is an expanded type which contains an attribute `name` whose type is reference but not separate. This violates `V1EA-1G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation, resulting in a type issue where a `STRING` from another SCOOP region is not flagged as separate.
