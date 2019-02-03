# Validity VFAV-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a rename clause `f as g alias "+" convert`. Even though `convert` mark is useless (because a formal generic parameter converts to no type), this violates `VFAV-4` because `f` has no argument.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VFAV-3`.
