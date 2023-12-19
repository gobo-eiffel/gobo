# Validity VUAR-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type of the actual argument is reference, but the type of the formal argument of `f` is not separate. This violates `VUAR-3G`.
