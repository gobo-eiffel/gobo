# Validity VTEC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VTEC](../../vtec/Readme.md).

### Description

In this test, class `BB` is not expanded but the local variable `b` is declared of type
`expanded BB` in class `AA`. But `BB` does not export `default_create` as creation procedure
to `AA`. This violates `VTEC-2`.

### Notes

* The syntax `expanded BB` is not supported anymore in the ECMA standard.
  Instead, class `BB` should be declared as expanded.
