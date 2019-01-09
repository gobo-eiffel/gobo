# Validity VAPE-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VAPE](../../vape/Readme.md).

### Description

In this test, feature `f` is exported to `ANY`. It has a non-object call to `{AA}.g` appearing in an inline agent in its precondition, but `g` is only available to `AA`. This violates `VAPE-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation.
