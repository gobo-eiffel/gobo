# Validity VGFG-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGFG](../../vgfg/Readme.md).

### Description

In this test, `G` is used twice as formal generic name in the declaration of class `BB`. This violates `VGFG-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VCFG-2`.
* `gec` and `gelint` report this validity rule violation using the old code `VCFG-2`.
