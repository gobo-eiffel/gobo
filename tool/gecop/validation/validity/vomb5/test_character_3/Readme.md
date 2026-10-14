# Validity VOMB-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of the choice `{CHARACTER_32} 'b'` in the multi-branch instruction is different
from the type of the inspect expression `CHARACTER_8` but `'b'` can be represented as a `CHARACTER_8`.
In this test `VOMB-5` is not violated.
