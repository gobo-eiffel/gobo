# Validity VFAV-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` in class `BB` has an alias name `alias "+"` with a `convert` mark. But `f` has no argument. This violates `VFAV-5`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and until 19.10.10.3641) reported this validity rule violation using the old code `VFAV-3`.
* Gobo Eiffel until 19.11.03.1 reported this validity rule violation using the old code `VFAV-4`.
