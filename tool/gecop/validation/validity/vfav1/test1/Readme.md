# Validity VFAV-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming features `f` and `g` both with the same alias name `alias "+"`. This violates `VFAV-1`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VTGC-2`. Also, it mentions `infix "+"` whereas only `alias "+"` are involved. And the error message is truncated.

* ISE Eiffel (as of 21.11.10.6046) crashes with an exception trace.
