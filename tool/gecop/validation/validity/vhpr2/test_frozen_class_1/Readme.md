# Validity VHPR-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VHPR](../../vhpr/Readme.md).

### Description

In this test, class `CC` inherits from the frozen class `BB`. This violates `VHPR-2`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports this validity rule violation using the code `VIFI-1`.
