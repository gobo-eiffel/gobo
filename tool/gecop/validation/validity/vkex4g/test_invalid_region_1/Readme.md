# Validity VKEX-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VKEX](../../vkex/Readme.md).

### Description

In this test, there is a creation expression with separate creation type. The region `<ANY>` is not a valid region specifier. This violates `VKEX-4G`.

### Note

* ISE Eiffel (as of 23.09.10.7341 and after) reports a syntax error instead of a violation of a validity rule.