# Validity VAPE-1

This test is exercising the condition 1 of the validity rule [VAPE](..).

### Description

In this test, feature `f` is exported to `ANY`. It has an unqualified call to `g` appearing in an inline agent in its precondition, but `g` is only available to `STRING`. This violates `VAPE-1`.


