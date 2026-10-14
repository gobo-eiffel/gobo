# Validity VYCQ-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VYCQ](../../vycq/Readme.md).

### Description

In this test, class `BB [G]` declares a conversion query of the form `f: {CC [ANY], CC [G]}`,
but the two convert types have the same base class. This violates `VYCQ-4`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not report this validity error.
  This is case there is no ambiguity even for `BB [ANY]`, but it is forbidden by
  the standard in the same way `f: {CC [ANY], CC [ANY]}` is forbidden.
  