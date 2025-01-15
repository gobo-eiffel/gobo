# Validity VSRT-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA` depends on `BB`, but class `BB` is not in the universe. This violates `VSRT-3`.

### Notes

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) report this validity rule violation using the code `VTCT`.
