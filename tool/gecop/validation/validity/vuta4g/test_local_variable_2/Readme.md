# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `y.f` where `y` is a local variable of type `sepatate BB`. Even though `x`, which is controlled, was just assigned to `y`, the compiler is not smart enough to infer that `y` is controlled. This violates `VUTA-4G`.
