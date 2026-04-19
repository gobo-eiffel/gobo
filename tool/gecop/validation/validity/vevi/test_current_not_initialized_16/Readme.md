# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, `Current` is used before the attribute `s` of attached type is
initialized in the creation procedure of class `BB`. In particular, since
`BB` is expanded, the assignment `c := Current` will trigger a call to
`twin/copy` which will access attribute `s`. This violates `VEVI`.
