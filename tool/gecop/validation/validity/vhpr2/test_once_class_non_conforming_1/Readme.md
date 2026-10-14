# Validity VHPR-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VHPR](../../vhpr/Readme.md).

### Description

In this test, class `CC` inherits from class `BB` which is a once class, and hence implicitly frozen.
But `BB` is a non conforming parent of `CC`. In this test `VHPR-2` is not violated.
