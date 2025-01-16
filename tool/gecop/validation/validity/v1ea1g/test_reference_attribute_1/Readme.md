# Validity V1EA-1G

This [test](.) is exercising the condition [1G](../Readme.md) of the validity rule [V1EA](../../v1ea/Readme.md).

### Description

In this test, the expanded class `BB` has one attribute of type `detachable STRING` which is a reference type, but not separate. This violates `V1EA-1G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation.
