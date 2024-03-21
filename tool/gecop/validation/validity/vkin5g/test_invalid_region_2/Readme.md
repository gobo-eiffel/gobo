# Validity VKIN-5G

This [test](.) is exercising the condition [5G](../Readme.md) of the validity rule [VKIN](../../vkin/Readme.md).

### Description

In this test, there is a creation instruction with a region even though the type of the target is not separate. But the region `<ANY>` is not a valid region specifier. This violates `VKIN-5G`.

### Note

* ISE Eiffel (as of 23.09.10.7341 and after) reports a syntax error instead of a violation of a validity rule.
