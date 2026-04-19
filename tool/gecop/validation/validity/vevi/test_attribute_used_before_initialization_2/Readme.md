# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the creation procedure of class `AA` calls `f`
which contains a call to `g (b)` before initializing the attribute
`b` of attached type. This violates `VEVI`.
