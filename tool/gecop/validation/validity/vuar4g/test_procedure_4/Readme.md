# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type `CC` of the actual argument of `f` is expanded, but it contains an attribute `d` whose expanded type contains an attribute `name` whose type is reference but not separate. This violates `VUAR-4G`.

### Notes

* This is a case where the actual argument is expanded and contains *indirectly* an attribute whose type is reference but not separate.
