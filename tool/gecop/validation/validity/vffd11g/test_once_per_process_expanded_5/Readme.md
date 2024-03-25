# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-process function `f` in class `AA`. Its result type of `f` is not expanded. But at runtime the result will be attached to an object of type `INTEGER`, which does not contain (directly or indirectly) any attribute whose type is reference but not separate. In this test `VFFD-11G` is not violated.
