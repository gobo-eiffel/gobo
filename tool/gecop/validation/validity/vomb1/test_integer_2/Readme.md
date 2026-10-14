# Validity VOMB-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{INTEGER_8} 11111` in the multi-branch instruction is not valid
(`11111` is not a `INTEGER_8`). This violates `VOMB-1`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports a syntax error.
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `GVWMC-2`.
