# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, class `BB` is generic. Feature `f` in class `BB` contains a call `c.g` where the type of the target `c` is the formal generic parameter. When the actual generic parameter is the separate type `separate CC`, the type of `c` is separate. But `c` is an attribute and therefore it is not controlled. This violates `VUTA-4G`.
