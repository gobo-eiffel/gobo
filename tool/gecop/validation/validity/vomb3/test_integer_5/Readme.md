# Validity VOMB-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `10` appears twice in the multi-branch instruction,
even though one is with the form `{INTEGER_8} 10` and the other `{INTEGER_16} 10`.
This violates `VOMB-3`.
