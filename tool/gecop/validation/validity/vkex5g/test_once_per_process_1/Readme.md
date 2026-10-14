# Validity VKEX-5G

This [test](.) is exercising the condition [5G](../Readme.md) of the validity rule [VKEX](../../vkex/Readme.md).

### Description

In this test, there is a creation expression with a once-per-process creation procedure `make`
and a creation type which is a reference type but not separate. This violates `VKEX-5G`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule violation.
