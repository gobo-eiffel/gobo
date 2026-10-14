# Validity VOIN

This [test](.) is exercising the validity rule [VOIN](../Readme.md).

### Description

In this test, the lower bound `{AA}.g` of the of choice interval in the multi-branch
instruction is greater than the upper bound `{AA}.f` (the declaration of `f` appears
before the declaration of `g` in class `AA`). This violates `VOIN`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
