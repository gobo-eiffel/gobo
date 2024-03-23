# Validity VUER

This [test](.) is exercising the validity rule [VUER](../../vuer/Readme.md).

### Description

In this test, there is a separate call to the function `f` from class `BB`. The type `CC` of result of `f` is expanded, but it contains an attribute `d` whose expanded type contains an attribute `name` whose type is reference but not separate. This violates `VUER`.

### Notes

* This is a case where the result is expanded and contains *indirectly* an attribute whose type is reference but not separate.
