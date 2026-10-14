# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, calling the once procedure `f` has part of the creation procedure
`make` will initialize the attribute `b` of attached type when creating the first
object, but not when creating for subsequent objects. This violates `VEVI`.
