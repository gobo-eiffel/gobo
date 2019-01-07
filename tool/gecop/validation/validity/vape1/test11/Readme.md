# Validity VAPE-1

This test is exercising the condition [1](..) of the validity rule [VAPE](../../vape).

### Description

In this test, feature `f` is exported to `ANY`. It has an instruction which is a qualified call to `g` appearing in an inline agent in its precondition, but `g` is only available to `AA`. This violates `VAPE-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and above) fails to report this validity rule violation.
