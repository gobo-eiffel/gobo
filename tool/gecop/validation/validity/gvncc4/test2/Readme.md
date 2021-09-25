# Validity GVNCC-4

This [test](.) is exercising a non-standard extension of the condition [4](../Readme.md) of the validity rule [VNCC](../../vncc/Readme.md).

### Description

In this test, there is an assignment `b1 := b2` where `b1` is of type `BB [ANY]` and `b2` is of type `BB [STRING]`, with class `BB` being an expanded generic class. This violates `GVNCC-4` because `BB [STRING]` does not conform to `BB [ANY]` since class `BB` is expanded.

### Notes

* ISE Eiffel (as of 20.11.10.5048 and after) accepts the code, but `b1` is left unchanged after the assignment (as if the assignment did not occur).
