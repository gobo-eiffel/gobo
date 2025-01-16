# Validity VSRP-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VSRP](../../vsrp/Readme.md).

### Description

In this test, the root creation procedure `make` is not exported to `ANY` as a creation procedure in the root class `AA`. This violates `VSRP-1`.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) fails to report this validity rule violation.
