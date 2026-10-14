# Validity VOMB-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `"b"` appears twice in the multi-branch instruction,
even though one is with the form `{STRING_8} "b"` and the other `{STRING_32} "b"`.
This violates `VOMB-3`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type is a sized variant of `STRING`.
