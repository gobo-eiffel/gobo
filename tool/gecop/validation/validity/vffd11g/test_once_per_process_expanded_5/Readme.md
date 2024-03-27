# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-process function `f` in class `AA`. Its result type of `f` is a separate reference type. At runtime the result will be attached to an object of type `INTEGER`. In this test `VFFD-11G` is not violated.
