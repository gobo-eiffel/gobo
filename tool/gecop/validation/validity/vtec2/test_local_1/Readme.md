# Validity VTEC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VTEC](../../vtec/Readme.md).

### Description

In this test, class `BB` is expanded. It is used in class `AA` but `BB` does not export
`default_create` as creation procedure to `AA`. This violates `VTEC-2`.
