# Validity VFAV-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` in class `BB` has an alias name `alias "+"` with a `convert` mark. Class `BB` also has a conversion routine to `CC`. Class `CC` also has a feature with the alias name `alias "+"`. The code `b + c` is class `AA` will be unfolded to `b.to_c + c`. In this test `VFAV-5` is not violated.


