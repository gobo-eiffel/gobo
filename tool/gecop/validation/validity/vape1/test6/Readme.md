# Validity VAPE-1

This test is exercising the condition [1](..) of the validity rule [VAPE](../../vape).

### Description

In this test, feature `f` is exported to `ANY`. It has a call agent `agent a.g` in its precondition, but `g` is only available to `AA`. This violates `VAPE-1`.


