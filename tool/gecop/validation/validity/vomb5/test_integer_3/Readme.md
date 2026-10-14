# Validity VOMB-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of the choice `{INTEGER_32} 1` in the multi-branch instruction is different
from the type of the inspect expression `INTEGER_8` but `1` can be represented as an `INTEGER_8`.
In this test `VOMB-5` is not violated.
