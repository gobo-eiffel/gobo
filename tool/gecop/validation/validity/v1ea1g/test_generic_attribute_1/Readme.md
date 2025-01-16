# Validity V1EA-1G

This [test](.) is exercising the condition [1G](../Readme.md) of the validity rule [V1EA](../../v1ea/Readme.md).

### Description

In this test, the expanded class `BB [G]` has one attribute of type `detachable G` whose actual generic parameter may be a non-separate reference type (`STRING` in this test). This violates `V1EA-1G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity rule violation.
