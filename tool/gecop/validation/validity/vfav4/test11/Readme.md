# Validity VFAV-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` from class `BB` has been renamed with the alias name `alias "+"` and a `convert` mark in class `CC`. But `f` has no argument. This violates `VFAV-4`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VFAV-3`.
