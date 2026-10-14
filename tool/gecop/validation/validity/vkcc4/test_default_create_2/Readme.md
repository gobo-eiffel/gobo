# Validity VKCC-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, class `BB` has an empty create clause. So it has no creation procedure,
and `default_create`, which is a once procedure, is not a creation procedure. In this
test `VKCC-4` is not violated.
