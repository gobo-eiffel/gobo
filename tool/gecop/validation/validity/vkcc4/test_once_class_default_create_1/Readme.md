# Validity VKCC-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `BB` has no create clause. So its default creation procedure
is `default_create` which is not a once procedure. This violates `VKCC-4`.
