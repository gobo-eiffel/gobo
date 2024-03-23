# Validity VUER

This [test](.) is exercising the validity rule [VUER](../../vuer/Readme.md).

### Description

In this test, there is a separate call to the function `f` from class `BB`. The type `INTEGER` of the result of `f` is expanded, and it does not contain (directly or indirectly) any attribute whose type is reference but not separate. In this test `VUER` is not violated.
