# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `g`. Feature `f` is the final name of a feature in `CC`, but `g` is also the final name of a feature in `CC`. Therefore, after renaming we end up with two features with the same name `g`. This violates `VGGC-2`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-2`.
