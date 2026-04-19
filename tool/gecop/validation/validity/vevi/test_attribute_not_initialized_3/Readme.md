# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the attribute `b` of attached type is not initialized in one
of the branches of the conditional instruction, and hence at the end of
the creation procedure of class `AA`. This violates `VEVI`.
