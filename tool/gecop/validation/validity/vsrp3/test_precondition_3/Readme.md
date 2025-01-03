# Validity VSRP-3

This [test](.) is exercising the condition [3](../Readme.md) of the validity rule [VSRP](../../vsrp/Readme.md).

### Description

In this test, the root creation procedure `make` has a precondition which is not `True`. This violates `VSRP-3` even if the precondition always evaluates to True.
