# Validity VOIN

This [test](.) is exercising the validity rule [VOIN](../Readme.md).

### Description

In this test, the lower bound `f` of the of choice interval in the multi-branch
instruction is a Unique attribute, but the upper bound is not. This violates `VOIN`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
