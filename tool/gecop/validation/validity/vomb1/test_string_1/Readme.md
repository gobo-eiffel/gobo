# Validity VOMB-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{STRING_8} "Ω"` in the multi-branch instruction is not valid
(`"Ω"` cannot be represented as a `STRING_8`). This violates `VOMB-1`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type is a sized variant of `STRING`.
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `GVWMC-2`.
