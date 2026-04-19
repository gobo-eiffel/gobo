# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the creation procedure of class `AA` calls `f (b)`
before the assignment instruction with attribute `b` as target.
In this test `VEVI` is not violated because the type of `b` is
detachable.
