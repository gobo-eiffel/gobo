# Validity VOMB-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `{BB}.g` in the multi-branch instruction is not valid
(the creation procedure `g` is not exported to `AA`). This violates `VOMB-1`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports a validity rule violation using
  the code `VUEX-2` (the feature `g` is not exported to `AA`).
* Gobo Eiffel (as of 26.06 and after) reports a validity rule violation using the code `VGCC-6`
  (the creation procedure `g` is not exported to `AA`).
