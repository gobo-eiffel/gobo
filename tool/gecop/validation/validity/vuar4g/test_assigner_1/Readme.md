# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate *Assigner\_call* to set the value of an attribute `c` in an object of separate type `separate BB`. The type `CC` of the source of the *Assigner\_call* is expanded, but `CC` contains an attribute whose type is reference but not separate. This violates `VUAR-4G`.
