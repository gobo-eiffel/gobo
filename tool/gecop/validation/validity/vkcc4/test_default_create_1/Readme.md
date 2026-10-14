# Validity VKCC-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, class `BB` has no create clause. So its default creation procedure
is `default_create` which is a once procedure. This violates `VKCC-4`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
