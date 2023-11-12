# Validity V1SE-2G

This [test](.) is exercising the condition [2G](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with an argument whose name `x` is also the name of an argument of an enclosing inline agent. This violates `V1SE-2G`.

### Notes

* ISE Eiffel (as of 21.11.10.6046 and after) reports this validity rule violation using the code `FRESH_IDENTIFIER`.
