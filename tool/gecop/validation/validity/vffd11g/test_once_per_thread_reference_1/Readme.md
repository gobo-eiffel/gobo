# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-thread function `f` in class `AA`. Its result type is a reference type but it is not separate. In this test `VFFD-11G` is not violated because `f` is not a once-per-process function.
