# Validity VOMB-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{AA}.f` in the multi-branch instruction is not a
constant attribute. This violates `VOMB-2`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type is a sized variant of `STRING`.
