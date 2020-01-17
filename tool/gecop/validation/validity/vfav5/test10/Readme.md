# Validity VFAV-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` from class `BB` has been renamed with the alias name `alias "+"` and a `convert` mark in class `CC`. Class `CC` also has a conversion routine to `DD`. Class `DD` also has a feature with the alias name `alias "+"`. The code `c + d` is class `AA` will be unfolded to `c.to_d + d`. In this test `VFAV-5` is not violated.
