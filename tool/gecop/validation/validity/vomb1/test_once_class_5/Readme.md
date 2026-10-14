# Validity VOMB-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{BB}.f` in the multi-branch instruction is not valid
(`f` is a once-per-process creation procedure but the creation type is not
declared as separate). This violates `VOMB-1`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `VKEX-5G`
  (`f` is a once-per-process creation procedure but the creation type is not declared as separate).
