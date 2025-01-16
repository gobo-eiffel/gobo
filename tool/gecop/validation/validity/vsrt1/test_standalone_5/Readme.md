# Validity VSRT-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA [BB [CC]]` is stand-alone because it involves no anchred types nor formal generic parameters. In this test `VSRT-1` is not violated.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) erroneously reports that the base class of the actual generic parameters are not in the universe (validity `VSRT-2`).
