# Validity V1SE-1G

This [test](.) is exercising the condition [1G](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with two arguments with the same name `x`. This violates `V1SE-1G`.

### Notes

* ISE Eiffel (as of 21.11.10.6046 and after) reports this validity rule violation using the code `FRESH_IDENTIFIER`.
