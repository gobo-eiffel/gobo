# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, class `BB` is generic. Feature `g` in class `BB` contains a call `c.h` where the type of the target `c` is the formal generic parameter. When the actual generic parameter is the separate type `separate CC`, the type of `c` is separate. `c` is a formal argument of the enclosing feature `g`. In this test `VUTA-4G` is not violated because `c` is controlled.
