# Validity V1SE-G1

This [test](.) is exercising the condition [G1](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with two arguments with the same name `x`. This violates `V1SE-G1`.

### Notes

* ISE Eiffel (as of 21.11.10.6046 and after) reports this validity rule violation using the code `FRESH_IDENTIFIER`.
