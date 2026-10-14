# Validity VOIN

This [test](.) is exercising the validity rule [VOIN](../Readme.md).

### Description

In this test, the lower bound `{COMPARABLE}` of the of choice interval in the multi-branch
instruction does not conform to the upper bound `{STRING_8}`. This violates `VOIN`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.
