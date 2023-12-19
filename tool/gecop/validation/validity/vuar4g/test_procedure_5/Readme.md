# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type `INTEGER` of the actual argument of `f` is expanded, and it does not contain (directly or indirectly) any attribute whose type is reference but not separate. In this test `VUAR-4G` is not violated.
