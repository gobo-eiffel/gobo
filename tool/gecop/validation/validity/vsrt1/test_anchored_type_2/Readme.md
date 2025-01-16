# Validity VSRT-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `like out` is not stand-alone because it involves an anchred type. This violates `VSRT-1`.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VD00`.
