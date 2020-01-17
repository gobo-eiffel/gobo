# Validity VFAV-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a rename clause `f as g alias "+" convert`. The `convert` mark is useless because a formal generic parameter converts to no type. In this test `VFAV-5` is not violated.


