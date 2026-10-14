# Validity VKCC-7G

This [test](.) is exercising the condition [7G](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `CC` has a once creation procedure `f`, but `f` has been inherited
from `BB` without being redeclared in `CC`. This violates `VKCC-7G`.
