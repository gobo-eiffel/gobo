# Validity VOMB-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VOMB](../../vomb/Readme.md).

### Description

In this test, the type of the choice `{CHARACTER_32} 'Ω'` in the multi-branch instruction is
different from the type of the inspect expression `CHARACTER_8` and `'Ω'` cannot be represented
as a `CHARACTER_8`. This violates `VOMB-5`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
* Gobo Eiffel (as of 26.06 and after) reports this validity rule violation using the code `VOMB-2`.
