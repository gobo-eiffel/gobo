# Validity VOMB-6G

This [test](.) is exercising the condition [6G](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of inspect expression is not attached. This violates `VOMB-6G`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type is a sized variant of `STRING`.
