# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, class `BB` inherits from `CC` and renames feature `f` as `prefix "+"`. But feature `f` is not a query with no argument in `CC`. This violates `VFAV-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VHRC-4`.
.

