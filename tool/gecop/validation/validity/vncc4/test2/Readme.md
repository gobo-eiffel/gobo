# Validity VNCC-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VNCC](../../vncc/Readme.md).

### Description

In this test, there is an assignment `b1 := b2` where `b1` is of type `BB [ANY]` and `b2` is of type `BB [STRING]`, with class `BB` being an expanded generic class. This does not violate `VNCC-4`. However it violates `GVNCC-4` because `BB [STRING]` does not conform to `BB [ANY]` when class `BB` is expanded.

### Notes

* ISE Eiffel (as of 20.11.10.5048 and after) accepts the code, but `b1` is left unchanged after the assignment (as if the assignment did not occur).
* Gobo Eiffel (as of 20.05.31.5 and after) reports the violation of validity rule `VJAR`, stating that `BB [STRING]` does not conform to `BB [ANY]`. This is a consequence of `GVNCC-4`.
