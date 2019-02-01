# Validity VFAV-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a rename clause `f as alias "+" convert`. The `convert` mark is useless because a formal generic parameter converts to no type. In this test `VFAV-4` is not violated.


