# Validity VFAV-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, class `AA` has two features `f` and `g` (inherited from `BB`) with the same alias name `alias "()"`. This violates `VFAV-3`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and until 19.10.10.3641) reported this validity rule violation using the code `VFAV-4`.
