# Validity VSRT-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA [BB]` involves classes `AA` and `BB`, but `AA` is no in the universe. This violates `VSRT-2`.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VD20`.
