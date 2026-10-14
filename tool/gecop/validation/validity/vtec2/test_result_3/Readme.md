# Validity VTEC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VTEC](../../vtec/Readme.md).

### Description

In this test, class `BB` is expanded and its version of `default_create` is generally
available as creation procedure. It is called when initializing the `Result` of type
`BB` of function `b` in class `AA`. In this test `VTEC-2` is not violated.
