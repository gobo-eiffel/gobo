# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, `Current` is used before the attribute `b` of attached type is
initialized in the creation procedure of class `AA`. But there is no qualified
calls between the use of `Current` and the initialization of `b`, even in
creation procedure `make` from class `BB`. In this test `VEVI` is not violated.
