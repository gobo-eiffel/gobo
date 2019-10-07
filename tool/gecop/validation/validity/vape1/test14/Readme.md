# Validity VAPE-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VAPE](../../vape/Readme.md).

### Description

In this test, feature `f` is exported to `ANY`. It has an `across` expression in its precondition, but the associated feature `forth` is only available to `AA`. This violates `VAPE-1`.
