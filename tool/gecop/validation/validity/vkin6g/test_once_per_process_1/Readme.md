# Validity VKIN-6G

This [test](.) is exercising the condition [6G](../Readme.md) of the validity rule [VKIN](../../vkin/Readme.md).

### Description

In this test, there is a creation instruction with a once-per-process creation procedure `make`
and a creation type which is a reference type but not separate. This violates `VKIN-6G`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
