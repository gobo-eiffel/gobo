# Validity VFFD-11G

This [test](.) is exercising the condition [11G](../Readme.md) of the validity rule [VFFD](../../vffd/Readme.md).

### Description

In this test, there is a once-per-process function `f` in class `AA`. Its result type is a reference type which is separate. But at runtime the result will be attached to an object of type `BBC`, which is an expanded type which contains an attribute `name` whose type is reference but not separate. This violates `VFFD-11G`, even though this is nearly impossible to catch that at compile time.

### Notes

* Gobo Eiffel and ISE Eiffel (as of 23.09.10.7341 and after) fail to report this validity error, resulting in a type issue where a `STRING` from another SCOOP region is not flagged as separate.
