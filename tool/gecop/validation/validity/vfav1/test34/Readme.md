# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, class `BB` inherits features `f` and `g` from `CC`, renaming both with the same alias name `alias "+"`. The operator `+` is binary in both cases. This violates `VFAV-1`.
