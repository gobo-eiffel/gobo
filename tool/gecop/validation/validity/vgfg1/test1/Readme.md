# Validity VGFG-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGFG](../../vgfg/Readme.md).

### Description

In this test, the name of the formal generic parameter `CC` of class `BB` is also the name of a class in the surrounding universe. This violates `VGFG-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VCFG-1`.
* `gec` and `gelint` report this validity rule violation using the old code `VCFG-1`.
