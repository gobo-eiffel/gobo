# Validity VOMB-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{BB}.g` in the multi-branch instruction is not valid
(`g` is not a creation procedure). This violates `VOMB-1`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports a validity rule violation using
  the code `VOMB-2` (`g` is not a constant).
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `VKCN-2`
  (`g` is not a query in an expression).
