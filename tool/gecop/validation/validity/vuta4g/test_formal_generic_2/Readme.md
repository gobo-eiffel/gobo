# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, class `BB` is generic. Feature `f` in class `BB` contains a call `c.g` where the type of the target `c` is the formal generic parameter. The actual generic parameter could be a separate type, in which case the type of `c` would be separate. But `c` is an attribute and therefore it would not be controlled. This violates `VUTA-4G`, even though the actual generic parameter in this test is not a separate type.
