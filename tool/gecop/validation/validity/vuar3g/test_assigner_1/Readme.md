# Validity VUAR-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate *Assigner\_call* to set the value of an attribute `name` in an object of separate type `separate BB`. The type of the source of the *Assigner\_call* is reference, but the type of the formal argument of the assigner procedure `set_name` is not separate. This violates `VUAR-3G`.
