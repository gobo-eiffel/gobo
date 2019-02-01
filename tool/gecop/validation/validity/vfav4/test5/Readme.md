# Validity VFAV-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` in class `BB` has an alias name `alias "()"` with a `convert` mark. But the alias name does not list an operator. This violates `VFAV-4`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VFAV-3`.
