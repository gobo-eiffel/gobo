# Validity VAPE-1

This test is exercising the condition 1 of the validity rule [VAPE](..).

### Description

In this test, feature `f` is exported to `ANY`. It has an `across` expression in its precondition, but but the associated feature `forth` is only available to `AA`. This violates `VAPE-1`.
