# Validity VAPE-1

This test is exercising the condition 1 of the validity rule [VAPE](..).

### Description

In this test, feature `f` is exported to `ANY`. It has a non-object call `{AA}.g` in its precondition, but `g` is only available to `AA`. This violates `VAPE-1`.


