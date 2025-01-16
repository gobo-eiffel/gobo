# Validity VSRT-5G

This [test](.) is exercising the condition [5G](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA [CC]` is generic-creation-ready. Procedure `make` inherited from `BB` is a creation procedure in `CC` available for creation to `AA`. In this test `VSRT-5G` is not violated.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) erroneously reports a validity error `VSRT-2`.
