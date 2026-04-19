# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the attribute `b` of attached type is initialized before the end
of the creation procedure of class `AA`, in all branches of the conditional
instruction following the calls to `g` and `h`. In this test `VEVI` is not violated.
