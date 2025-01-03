# Validity VSRP-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VSRP](../../vsrp/Readme.md).

### Description

In this test, the root creation procedure `make` has a precondition with two assertions `True`. In this test `VSRP-3` is not violated.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) erroneously reports a validity error `VSRP-3` because of the two assertions `True`.
