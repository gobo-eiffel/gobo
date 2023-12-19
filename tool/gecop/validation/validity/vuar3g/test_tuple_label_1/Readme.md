# Validity VUAR-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate *Assigner\_call* to set the value of a label of a tuple whose type is separate. The type of the source of the *Assigner\_call* is reference, but the type of the tuple label is not separate. This violates `VUAR-3G`.
