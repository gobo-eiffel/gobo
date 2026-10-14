# Validity VOMB-7G

This [test](.) is exercising the condition [7G](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choices `1` and `2` in the multi-branch instruction are not of
the same type as the inspect expression. This violates `VOMB-7G`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports a validity rule violation using
  the code `VOMB-2`.
