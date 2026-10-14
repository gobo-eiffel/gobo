# Validity VKCC-6G

This [test](.) is exercising the condition [6G](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `BB` declares `f`, which is class routine,
as a creation procedure. This violates `VKCC-6G`.

#### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports this validity rule violation using the code `VKCN-1`.
