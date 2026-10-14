# Validity VOMB-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{like Current}` in the multi-branch instruction is not a
standalone type. This violates `VOMB-2`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `VOMB-4`.
