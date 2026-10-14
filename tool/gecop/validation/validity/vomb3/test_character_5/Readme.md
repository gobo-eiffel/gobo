# Validity VOMB-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the choice `'b'` appears twice in the multi-branch instruction,
even though one is with the form `{CHARACTER_8} 'b'` and the other `{CHARACTER_32} 'b'`.
This violates `VOMB-3`.
