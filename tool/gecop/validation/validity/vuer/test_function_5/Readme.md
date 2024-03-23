# Validity VUER

This [test](.) is exercising the validity rule [VUER](../../vuer/Readme.md).

### Description

In this test, there is a separate call to the function `f` from class `BB`. The type `ANY` of the result of `f` is not expanded. But at runtime the result will be attached to an object of type `INTEGER`, which does not contain (directly or indirectly) any attribute whose type is reference but not separate. In this test `VUER` is not violated.
