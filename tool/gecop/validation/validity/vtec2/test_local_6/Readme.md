# Validity VTEC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VTEC](../../vtec/Readme.md).

### Description

In this test, class `BB` is not expanded but the local variable `b` is declared of type
`expanded BB` in class `AA`. The version of `default_create` in `BB` is generally
available as creation procedure. It is called when initializing the local variable `b`
in class `AA`. In this test `VTEC-2` is not violated.

### Notes

* The syntax `expanded BB` is not supported anymore in the ECMA standard.
  Instead, class `BB` should be declared as expanded.
