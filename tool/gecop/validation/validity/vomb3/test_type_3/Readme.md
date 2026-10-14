# Validity VOMB-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{READABLE_STRING_8}` is included in the interval
`{STRING_8} .. {COMPARABLE}` in the multi-branch instruction. This violates `VOMB-3`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.
