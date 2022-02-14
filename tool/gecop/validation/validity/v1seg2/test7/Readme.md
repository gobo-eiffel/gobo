# Validity V1SE-G1

This [test](.) is exercising the condition [G2](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with an argument `x` which appears in the scope of an iteration item with the same name. This violates `V1SE-G2`.

### Notes

* ISE Eiffel (as of 21.11.10.6046 and after) reports this validity rule violation using the code `FRESH_IDENTIFIER`.
