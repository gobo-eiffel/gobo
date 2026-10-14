# Validity VOMB-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of the choice `{STRING_8} "b"` in the multi-branch instruction is different
from the type of the inspect expression `STRING_32` but `"b"` can be represented as a `STRING_32`.
In this test `VOMB-5` is not violated.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type is a sized variant of `STRING`.
