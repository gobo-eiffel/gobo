# Validity VOMB-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `2` in the multi-branch instruction is not
of type `TYPE [T]` for some type `T` but the type of the inspect expression
is a generic derivation of `TYPE`. This violates `VOMB-4`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.
