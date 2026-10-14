# Validity VOIT-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VOIT](../../voit/Readme.md).

### Description

In this test, the expression `s` of the iteration is separate but not controlled.
This violates `VOIT-3G`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports a validity rule violation using
  the code `VUTA-3`.
* Gobo Eiffel (as of 26.07 and after) reports a validity rule violation using the
  code `VUTA-4G`.
