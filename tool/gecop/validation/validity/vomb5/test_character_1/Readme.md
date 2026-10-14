# Validity VOMB-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of the choice `1` in the multi-branch instruction is different
from the type of the inspect expression `CHARACTER_8`. This violates `VOMB-5`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports this validity rule violation using the code `VOMB-2`.
* Gobo Eiffel (as of 26.06 and after) reports this validity rule violation using the code `VOMB-2`.
